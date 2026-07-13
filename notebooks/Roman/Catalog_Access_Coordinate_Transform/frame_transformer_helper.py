"""
Helper class for wrangling spatial selection transformations 
and query syntax formatting, and parsing the results 
to add coordinates in the other frame to the results table.
"""

import itertools

import astropy.units as u
from astropy.coordinates import SkyCoord, BaseCoordinateFrame
from astropy.coordinates.sky_coordinate_parsers import _get_frame_class
from astropy.table import Table

from regions import (
    CircleSphericalSkyRegion,
    RangeSphericalSkyRegion,
    PolygonSphericalSkyRegion,
    SphericalSkyRegion
)

__all__ = ["FrameTransformerHelper"]


def _get_inv_dict_frame_repr_comp_names(frame):
    """
    Utility function to get the inverse component name mapping 
    from `~astropy.coordinates.BaseCoordinateFrame` instances.
    Eg: go from "lon" -> "ra", instead of "ra" -> "lon"

    Convenience bundler accessing the default frame 
    RepresentationMapping info
    """
    inv_dict = {}

    # pylint: disable=W0212
    repr_maps = frame._frame_specific_representation_info[frame._default_representation]
    for repr_map in repr_maps:
        inv_dict[getattr(repr_map, "reprname")] = getattr(repr_map, "framename")

    return inv_dict


def _infer_units_keys_from_frame(frame):
    """
    Utility function to infer default units and position key names 
    based on the coordinate frame.

    Parameters
    ----------
    frame : `~astropy.coordinates.BaseCoordinateFrame`
        The coordinate reference frame

    Returns
    -------
    units : `~astropy.units.Unit`
        Inferred units

    keys: tuple of strings
        Tuple with inferred positional keys
    """

    # units = frame. ?????? guessing from frame?

    # JUST RETURN DEGREES FOR NOW
    # pylint: disable=E1101
    units = u.deg

    inv_dict = _get_inv_dict_frame_repr_comp_names(frame)
    keys = (inv_dict["lon"], inv_dict["lat"])

    return units, keys


def _construct_query_search_criteria_adql_circle(region, pos_keys, units_target):
    """
    General function for constructing ADQL circle selections
    """

    inv_dict = _get_inv_dict_frame_repr_comp_names(region.frame)
    lon = getattr(region.center, inv_dict["lon"])
    lat = getattr(region.center, inv_dict["lat"])

    query_string = (
        f"CONTAINS(POINT({pos_keys[0]}, {pos_keys[1]}),"
        f"CIRCLE({lon.to(units_target).value},"
        f"{lat.to(units_target).value},"
        f"{region.radius.to(units_target).value}))=1"
    )
    return query_string


def _construct_query_search_criteria_adql_lonlat(region, pos_keys, units_target):
    """
    General function for constructing ADQL lon/lat range selections
    """

    raise NotImplementedError(
        "To be implemented: would be normal 'filter' entries, not a formal spatial search"
    )


def _construct_query_search_criteria_adql_polygon(region, pos_keys, units_target):
    """
    General function for constructing ADQL polygon selections
    """

    inv_dict = _get_inv_dict_frame_repr_comp_names(region.frame)

    # Polygon specified as list of lon1, lat1, lon2, lat2, ... over all vertices
    lons = [str(getattr(vert, inv_dict["lon"]).to(units_target).value) for vert in region.vertices]
    lats = [str(getattr(vert, inv_dict["lat"]).to(units_target).value) for vert in region.vertices]
    polygon_str = ",".join(list(itertools.chain.from_iterable(zip(lons, lats))))

    query_string = (
        f"CONTAINS(POINT({pos_keys[0]}, {pos_keys[1]}),"
        f"POLYGON({polygon_str}))=1"
    )
    return query_string


def _construct_query_search_criteria_adql(region, pos_keys, units_target):
    """
    Helper function to format search criteria (specified by a `SphericalSkyRegion` instance) 
    in a valid ADQL query string.
    """
    if isinstance(region, CircleSphericalSkyRegion):
        return _construct_query_search_criteria_adql_circle(
            region,
            pos_keys,
            units_target,
        )
    elif isinstance(region, RangeSphericalSkyRegion):
        return _construct_query_search_criteria_adql_lonlat(
            region,
            pos_keys,
            units_target,
        )
    elif isinstance(region, PolygonSphericalSkyRegion):
        return _construct_query_search_criteria_adql_polygon(
            region,
            pos_keys,
            units_target,
        )
    else:
        raise ValueError(
            "Other region searches not currently supported"
        )


def _construct_query_search_criteria_astroquery_circle(region, units_target):
    """
    General function for constructing ADQL circle selections
    """
    # NOTE: seems like there is no way to specify inclusion or exclusion in astroquery.mast queries

    query_kwargs = {
        "coordinates": region.center, 
        "radius": region.radius.to(units_target)
    }

    return query_kwargs


def _construct_query_search_criteria_astroquery_lonlat(region, units_target):
    """
    General function for constructing ADQL lon/lat range selections
    """
    # NOTE: seems like there is no way to specify inclusion or exclusion in astroquery.mast queries

    raise NotImplementedError(
        "To be implemented: would be normal 'filter' entries, not a formal spatial search"
    )


def _construct_query_search_criteria_astroquery(region, units_target):
    """
    Helper function to format search criteria (specified by a `SphericalSkyRegion` instance) 
    into a dict with valid astroquery.mast query kwargs.
    """
    if isinstance(region, CircleSphericalSkyRegion):
        # NOTE: As of now seems like astroquery.mast ONLY supports circles
        return _construct_query_search_criteria_astroquery_circle(
            region,
            units_target,
        )
    elif isinstance(region, RangeSphericalSkyRegion):
        return _construct_query_search_criteria_astroquery_lonlat(
            region,
            units_target,
        )
    else:
        raise ValueError(
            "astroquery currently only supports a single circle search, "
            "so complex, non-single-circle regions cannot be supported!"
        )


def _construct_query_search_criteria(region, output_format, pos_keys, units_target):
    """
    Helper function to format search criteria (specified by a `SphericalSkyRegion` instance) 
    in the formats necessary for different ways of querying databases.

    For output_format == "ADQL", this is a string with ADQL-formatted positional search constraints.
    For output_format == "astroquery.mast", this will be (once implemented) a dict 
    kwargs to pass to an astroquery.mast query.
    """
    if output_format == "ADQL":
        return _construct_query_search_criteria_adql(region, pos_keys, units_target)
    elif output_format == "astroquery.mast":
        return _construct_query_search_criteria_astroquery(region, units_target)


class FrameTransformerHelper:
    """
    Helper class for translating a selection region from 
    one coordinate frame into another, 
    providing necessary query syntax for executing a search on a database 
    (either within a directly tranformed region, or within a bounding region), 
    and for parsing the results (adding coordinates in the original selection region frame 
    to the results table and performing final cuts to the target selection region.

    Parameters
    ----------
    sel_region : `SphericalSkyRegion`
        The sky region within which to select objects. Includes 
        coordinate reference frame information. 
    frame_target : `~astropy.coordinates.BaseCoordinateFrame`
        The coordinate reference frame to transform the search region 
        into, for specifying query constraints.
    
    Attributes
    ----------
    sel_region_target: `SphericalSkyRegion`
        The selection sky region, transformed into the target coordinate frame.

    Methods
    -------
    get_bounds_constraints(**kwargs) :  
        Obtain the transformed selection boundary information for querying the database. 
    parse_results(table, **kwargs) :
        Parse the results table, adding the back-transformed coordinates to the table, 
        and trimming to entries falling within the original selection boundary. 

    """
    def __init__(self, sel_region=None, frame_target=None):
        # units_keys_target=None,
        if sel_region is None:
            raise ValueError("'sel_region' must be specified")
        if frame_target is None:
            raise ValueError("'frame_target' must be specified")
        
        # Get frame input as class:
        frame_target = (
            _get_frame_class(frame_target) if isinstance(frame_target, str) else frame_target
        )

        # Validate inputs:
        if not isinstance(sel_region, SphericalSkyRegion):
            raise ValueError("'sel_region' must be a `SphericalSkyRegion` instance")

        if not issubclass(frame_target, BaseCoordinateFrame):
            raise ValueError(
                "'frame_target' must be a `~astropy.coordinates.BaseCoordinateFrame` instance"
            )

        self.sel_region = sel_region
        self.frame_target = frame_target

        # Is units_orig better to just DEFAULT to degrees, explicitly?
        self.units_orig, self.keys_pos_orig = _infer_units_keys_from_frame(
            self.sel_region.frame
        )
        self.units_target, self.keys_pos_target = _infer_units_keys_from_frame(
            frame_target
        )

    @property
    def sel_region_target(self):
        """
        Transformation of the search region into the target coordiante frame.
        """
        return self.sel_region.transform_to(self.frame_target)

    def get_bounds_constraints(
        self,
        search_type="bound_circle",
        output_format="ADQL",
        keys_pos_target=None,
        units_target=None,
        pad_angle=1*u.arcsec,
        n_points=100,
    ):
        """
        Obtain the transformed search boundary information for querying the database. 

        Parameters
        ----------
        search_type : `str`
            Type of search boundary to return. 
            Options include ["bound_circle", "bound_lonlat", "polygon"].

            "bound_circle" will use the bounding circle, while "bound_lonlat" will use the 
            bounding "range" defined by a range of longitude and latitude 
            (or just latitude, if over a pole and the longitude bound is ill-defined).
            "polygon" will discretize the boundary, adding a small amount of padding 
            (specified by "pad_angle") on the original region (if a circle or a 
            longitude/latitude range), to avoid excluding objects due to differences
            in the ideal and polygonized boundary.

        output_format: `str`
            Output format for the search criteria. Options include ["ADQL", "astroquery.mast"].
            For "ADQL", the output will be a string with valid ADQL positional search criteria.

            ** astroquery.mast not yet supported

        keys_pos_target : `str` tuple, optional
            Position column names for the database query. 
            If None, defaults to the `~astropy.coordinates.BaseCoordinateFrame` 
            names for the longitude/latitude coordinates of the target (i.e., database) 
            coordinate frame. 
            For a database with an ICRS coordinate frame, this is ("ra", "dec")

        units_target : `~astropy.units.Unit`, optional
            Units for the positions in the target (i.e., database) frame. 
            Important for constructing correctly formatted search inputs 
            for, e.g., ADQL queries.
            If None, defaults to degrees.

        pad_angle : `~astropy.Quantity` or `~astropy.coordinates.Angle`
            Angular padding to apply to the original region, if a circle or 
            longitude/latitude range region, before discretizing the boundary for 
            "search_type" = "polygon".

        n_points : `int`
            Number of points to use for the polygon boundary for 
            "search_type" = "polygon".

        Returns
        -------
        search_bounds : `str` or `dict`
            Formatted search criteria, depending on output format. 

        """
        # Check inputs:
        _valid_search_types = ["bound_circle", "bound_lonlat", "polygon"]
        if search_type not in _valid_search_types:
            raise ValueError(
                f'"search_type"={search_type} not valid '
                f"Must be one of: {_valid_search_types}."
            )

        _valid_output_formats = ["ADQL", "astroquery.mast"]
        if output_format not in _valid_output_formats:
            raise ValueError(
                f'"output_format"={output_format} not valid '
                f"Must be one of: {_valid_output_formats}."
            )
        try:
            _ = pad_angle.to(u.arcsec)
        except AttributeError:
            raise ValueError(
                f'"pad_angle" must be a Quantity or Angle! "pad_angle"={pad_angle}'
            )

        # Override default guess if keys_pos_target is specified:
        if keys_pos_target is not None:
            self.keys_pos_target = keys_pos_target

        if units_target is not None:
            self.units_target = units_target

        # Get search region depending on search_type:
        if search_type == "bound_circle":
            # Use bounding circle
            query_region = self.sel_region_target.bounding_circle

        elif search_type == "bound_lonlat":
            # Use bounding lon/lat range
            query_region = self.sel_region_target.bounding_lonlat
        elif search_type == "polygon":
            # Pad original coordinate frame region:
            if isinstance(self.sel_region, CircleSphericalSkyRegion):
                reg_pad = self.sel_region.__class__(
                    center=self.sel_region.center,
                    radius=self.sel_region.radius + pad_angle,
                    frame=self.sel_region.frame
                )

                query_region = reg_pad.transform_to(
                    self.frame_target
                ).discretize_boundary(n_points=n_points)
            elif isinstance(self.sel_region, RangeSphericalSkyRegion):
                lon = self.sel_region.longitude_range
                lat = self.sel_region.latitude_range
                if lon is not None:
                    lon = [lon[0]-pad_angle, lon[1]+pad_angle]
                if lat is not None:
                    lat = [lat[0]-pad_angle, lat[1]+pad_angle]
                    
                reg_pad = self.sel_region.__class__(
                    longitude_range=lon,
                    latitude_range=lat, 
                    frame=self.sel_region.frame
                )
                query_region = reg_pad.transform_to(
                    self.frame_target
                ).discretize_boundary(n_points=n_points)

            else: 
                query_region = self.sel_region_target.discretize_boundary(
                    n_points=n_points
                )
            self.sel_region.transform_to(self.frame_target)
        else:
            # To avoid linter complaints below
            raise ValueError(
                f'"search_type"={search_type} not valid '
                f"Must be one of: {_valid_search_types}."
            )

        # Return appropriately-formatted search criteria:
        return _construct_query_search_criteria(
            query_region,
            output_format,
            self.keys_pos_target,
            self.units_target
        )

    def parse_results(
        self,
        table,
        add_orig_frame_coords_to_table=True,
        keys_pos_orig=None,
        units_orig=None,
        keys_pos_target=None,
        units_target=None,
    ):
        """
        Parse the results table:
        Add the back-transformed coordinates to the table, and trim to 
        only objects falling within the original selection boundary. 

        Parameters
        ----------
        table : `~astropy.table.Table`
            Search results table returned from the database query

        add_orig_frame_coords_to_table : bool, optional
            Option of whether or not to add original frame coordinates to results table. 
            Default is True. 

        keys_pos_orig : `str` tuple, optional
            Position column names for the original coordinate frame.
            If None, defaults to the `~astropy.coordinates.BaseCoordinateFrame`
            names for the longitude/latitude coordinates of the original (i.e., search region) 
            coordinate frame. 
            For a database with a Galactic coordinate frame, the default is ("l", "b")

        units_orig : `~astropy.units.Quantity`, optional
            Units for the added columns including the coordinates 
            in the original frame. 
            Defaults to degrees.

        keys_pos_target : `str` tuple, optional
            Position column names in the query results table. 
            If None, retains the PREVIOUSLY set value, 
            or with a default value of the `~astropy.coordinates.BaseCoordinateFrame` 
            names for the longitude/latitude coordinates of the target (i.e., database) 
            coordinate frame. 
            For a database with an ICRS coordinate frame, the default is ("ra", "dec")

        units_target : `~astropy.units.Unit`, optional
            Units for the positions in the query result table (in the target frame). 
            Important for constructing correctly formatted values if the results table 
            does not have units. 
            If None, defaults to degrees.

        Returns
        -------
        table_out : `~astropy.table.Table`
            Search results table, with columns containing the object coordinates 
            in the original frame and trimmed to only objects falling within  
            the original search region.
        """
        # Validate inputs:
        if not isinstance(table, Table):
            raise ValueError("'table' must be a `~astropy.table.Table` instance")

        #############################
        # Override default guesses if keys_pos_[target/orig] or units_[target/orig]
        # are specified:
        if keys_pos_orig is not None:
            self.keys_pos_orig = keys_pos_orig

        if units_orig is not None:
            self.units_orig = units_orig

        if keys_pos_target is not None:
            self.keys_pos_target = keys_pos_target

        if units_target is not None:
            self.units_target = units_target

        #############################
        # Get target coordinates:

        # Leverage unit information returned from DB query, if returned as
        # as columns with quantities:
        pos = []
        for i in range(2):
            if table[self.keys_pos_target[i]].unit is not None:
                pos.append(table[self.keys_pos_target[i]].quantity)
            else:
                pos.append(table[self.keys_pos_target[i]]*self.units_target)

        coos_target = SkyCoord(pos[0], pos[1], frame=self.frame_target)

        # Flush
        pos = None

        #############################
        # Cut to back to the original search area (in case a bounding
        # region was used for the query)

        # Get contains mask
        mask_contains = self.sel_region_target.contains(coos_target)

        # Apply cuts to table and SkyCoord (array)
        table_out = table[mask_contains]
        coos_target = coos_target[mask_contains]

        #############################
        # Add values to table

        if add_orig_frame_coords_to_table:
            # Transform back to original frame:
            coos_orig = coos_target.transform_to(self.sel_region.frame)

            # Use inverse dict lookup to get the attr name for the lon/lat coords,
            # and then get the lon, lat values out of the SkyCoord transformed
            # back to the original coordinate frame
            inv_dict = _get_inv_dict_frame_repr_comp_names(self.sel_region.frame)

            for i, coord in enumerate(["lon", "lat"]):
                coord_orig = getattr(coos_orig, inv_dict[coord])
                if table[self.keys_pos_target[i]].unit is not None:
                    # If units in table for original columns:
                    # Add values to results table, in units
                    table_out[self.keys_pos_orig[i]] = coord_orig.to(
                        self.units_orig
                    )
                else:
                    # Add values to results table, without attached units 
                    # but mapped to units_target:
                    table_out[self.keys_pos_orig[i]] = coord_orig.to(
                        self.units_orig
                    ).value

        return table_out
