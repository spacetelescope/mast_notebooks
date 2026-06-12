# Simple flag helper class, 
# to work with the PanSTARRS flag information 
# that is stored in a TAP-accessible table.

import abc
import pyvo as vo
from astropy.nddata import bitmask
from astropy.table import Table


def _tap_query_to_flags_table_info_dict(tap_url, table):
    # pylint: disable=C0103
    TAP_service = vo.dal.TAPService(tap_url)
    adql_query = f"""
    SELECT * FROM {table}
    """ #nosec
    job = TAP_service.run_async(adql_query)
    t_flags = job.to_table()
    t_flags.sort("value")
    flags_dict = {}

    for i in range(len(t_flags)):
        # 0 listed in table, but isn't a flag:
        if t_flags["value"][i] > 0:
            flags_dict[t_flags["name"][i]] = (
                t_flags["value"][i], t_flags["description"][i]
            )
    return t_flags, flags_dict


def _get_name_lookup_by_value(flags_dict):
    inv_dict = {}
    for flagn in flags_dict.keys():
        inv_dict[flags_dict[flagn][0]] = flagn
    return inv_dict


class FlagHelper(object):
    """
    Base FlagHelper class
    """
    # Define internal properties:
    _flag_info_table = None
    _flags_dict = None
    _bitflag_map = None

    _flags_name_lookup_by_value = None

    @abc.abstractmethod
    def __init__(self):
        raise NotImplementedError

    def __repr__(self):
        strout = ""
        nvalchar = len(str(self.flag_info_table["value"].max()))
        for flagn in self._flags_dict.keys():
            val, desc = self._flags_dict[flagn]
            strout += f"{flagn:>20}:  {str(val):>{nvalchar}}   {desc}\n"
        return strout

    def get_all_flag_names(self, bitflag):
        """
        List all flag names that are set for a single bitflag.
        """
        # ???
        # For now, use the expand to table functionality
        # to do this expansion. Likely there is a better way.
        # ???

        flag_names = []
        for flagn in self._flags_dict.keys():
            if bitflag & self._flags_dict[flagn][0]:
                flag_names.append(flagn)

        return flag_names

    def get_flag_value(self, flagn):
        """
        List integer value for the named flag.
        """
        return self._flags_dict[flagn][0]

    def get_flag_name(self, value):
        """
        List flag name for the given flag value
        """
        return self._flags_name_lookup_by_value[value]

    def get_flag_info(self, flagn):
        """
        List flag description for a flag, 
        by flag name or integer value
        """
        if isinstance(flagn, int):
            flagn = self._flags_name_lookup_by_value[flagn]
        return self._flags_dict[flagn][1]

    def expand_to_table(
        self,
        bitflag, 
        flags_to_include=None,
        ids=None,
        dtype=bool
    ):
        """
        Expand a bitflag (scalar or array) into a table.

        flags_to_include: list of flag names (or list of integer values)
        """
        dict_mask_tab = {}
        dict_mask_tab_desc = {}

        # Add a id column if specified
        if ids is not None:
            dict_mask_tab["id"] = ids

        if flags_to_include is None:
            flags_to_include = self._flags_dict.keys()

        # Check if it's a comma/+/| separated string:
        for check_val in [',', '+', '/']:
            if check_val in flags_to_include:
                flags_to_include = flags_to_include.split(check_val)
                try:
                    # Send to int if integers:
                    flags_to_include = [int(flag) for flag in flags_to_include]
                except ValueError:
                    pass

        for flagn in flags_to_include:
            dict_mask_tab[flagn] = self.make_bitmask(
                bitflag,
                flags_to_include=flagn,
                dtype=dtype,
            )
            dict_mask_tab_desc[flagn] = self._flags_dict[flagn][1]
        return Table(dict_mask_tab, descriptions=dict_mask_tab_desc)

    def make_bitmask(
        self,
        bitflag,
        flags_to_include=None,
        dtype=bool,
    ):
        """
        Make a bitmask from bitflag (scalar or array) 
        that is based on one or more flags, 
        by passing directly to astropy.nddata.bitmask methods

        Parameters
        ----------
        flags_to_include: 
            List or comma separated string of flags to include, 
            using EITHER their name (as stored in the flag info table), 
            OR their flag value.
        """
        if isinstance(flags_to_include, str):
            str_flags = flags_to_include
        else:
            str_flags = ",".join(flags_to_include)
        return bitmask.bitfield_to_boolean_mask(
            bitflag,
            ignore_flags=f"~({str_flags})",
            dtype=dtype,
            flag_name_map=self._bitflag_map
        )

    @property
    def flag_info_table(self):
        """
        Flag information table
        """
        return self._flag_info_table


class PanSTARRSFlagHelper(FlagHelper):
    """
    PanSTARRS FlagHelper class,
    to parse flags with definitions 
    available through the MAST TAP service.
    """
    def __init__(
        self,
        tap_url="https://mast.stsci.edu/vo-tap/api/v0.1/ps1dr2",
        table="ObjectQualityFlags",
    ):

        t_flags, flags_dict = _tap_query_to_flags_table_info_dict(
            f"{tap_url}/", table
        )

        # Database name from end of TAP URL:
        database = tap_url.split("/")[-1]

        # Create subclassed bit flag map class
        bitflag_map = bitmask.extend_bit_flag_map(
            f"{database.upper()}_{table.split('.')[-1]}",
            bitmask.BitFlagNameMap,
            **flags_dict
        )
        # Store internal values
        self._flag_info_table = t_flags
        self._flags_dict = flags_dict
        self._bitflag_map = bitflag_map

        self._flags_name_lookup_by_value = _get_name_lookup_by_value(flags_dict)
