/*************************************************************************
 *
 *
 * Product        :  Flashes Anywhere
 *                                                                          
 * Name           :  flashes.sch
 *                                                                           
 * Description    :  This partial schema file provides information required
 *                   required to update a Clarify schema for the Flashes Anywhere
 *                   product.
 *
 *                   In this partial schema file is:
 * 
 * Usage          :  * Use the Clarify Data Dictionary Editor to export a schema file
 *                   * Use a text editor to cut+paste these changes into the file
 *                   * Use the Data Dictionary Editor to apply the schema file
 *
 * Author         :  First Choice Software, Inc.                             
 *                   4412 Spicewood Springs Road Suite 701
 *                   Austin, TX  78759                                       
 *                   (512) 418-2905                                          
 *                                                                           
 * Platforms      :  This version supports Clarify 5.0 and later             
 *                                                                           
 * Copyright (C)  2000 First Choice Software, Inc.                           
 * All Rights Reserved                                                       
 *************************************************************************/

1) Add the following field to table_alert

,
    x_active  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=2
     MANDATORY PREDEFINED
     COMMENT="Is this really active - ignore pre-defined active flag for find caller.i.e., 0=no, 1=yes"    
,
    disp_from CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=80
     COMMENT="For Flashes Anywhere display purposes only. No data stored in DB."

2) Add the following relation to table_alert:

,
     alert2alert_to_other OTM alert_to_other
     USER_DEFINED
     INV_REL=to_other2alert     COMMENT="Tables related to this alert"

3) Add the following index to table_alert:
  INDEXES
	alert_ind	FIELD=x_active
  INDEXES_END
   
4) Add the following tables at the end of the schema file:

OBJECT alert_to_other 4300
 SUBJECT=""
 COMMENT="Relates alerts to other tables"
  FIELDS
    objid  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     MANDATORY PREDEFINED
     GEN_FIELD_ID=3
     COMMENT="Internal Record number"
,
    obj_num  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     MANDATORY PREDEFINED
     COMMENT="Object number of related table"
,
    obj_id  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     MANDATORY PREDEFINED
     COMMENT="Object ID of related row in table"
,
    alias_name  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=80
     COMMENT="Alias of table/view that this row was found from"
,
    dev  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     MANDATORY PREDEFINED ALLOW_NULL
     GEN_FIELD_ID=151
     DEFAULT="1"
     COMMENT="Row version number for mobile distribution purposes"
  FIELDS_END
  RELATIONS
    to_other2alert MTO alert
     USER_DEFINED
     INV_REL=alert2alert_to_other     COMMENT="Alert related to other tables"
  RELATIONS_END
  INDEXES
	alert_to_other_ind	FIELD=obj_num FIELD= obj_id
  INDEXES_END
OBJECT_END;

OBJECT alert_table 4301
 SUBJECT=""
 COMMENT="Lists tables that can have alerts on them. Also, query information for them."
  FIELDS
    objid  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     MANDATORY PREDEFINED
     GEN_FIELD_ID=3
     COMMENT="Internal Record number"
,
    table_or_view  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=80
     COMMENT="Name of table or view to query"
,
    alias_name  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=80
     COMMENT="Alias of table/view name"
,
    objid_column  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=80
     COMMENT="Name of column that has objid (views only)"
,
    num_query_cols  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     MANDATORY PREDEFINED
     COMMENT="Number of query columns to use for this object."
,
    col1  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=80
     COMMENT="Column 1 to query"
,
    lbl1  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=80
     COMMENT="Label of column 1"
,
    col2  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=80
     COMMENT="Column 2 to query"
,
    lbl2  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=80
     COMMENT="Label of column 2"
,
    col3  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=80
     COMMENT="Column 3 to query"
,
    lbl3  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=80
     COMMENT="Label of column 3"
,
    col4  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=80
     COMMENT="Column 4 to query"
,
    lbl4  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=80
     COMMENT="Label of column 4"
,
    col5  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=80
     COMMENT="Column 5 to query"
,
    lbl5  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=80
     COMMENT="Label of column 5"
,
    out_col1  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=80
     COMMENT="Column 1 to display"
,
    out_lbl1  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=80
     COMMENT="Label of output column 1"
,
    out_col2  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=80
     COMMENT="Column 2 to display"
,
    out_lbl2  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=80
     COMMENT="Label of output column 2"
,
    dev  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     MANDATORY PREDEFINED ALLOW_NULL
     GEN_FIELD_ID=151
     DEFAULT="1"
     COMMENT="Row version number for mobile distribution purposes"
  FIELDS_END
OBJECT_END;

OBJECT fc_string 3500
 SUBJECT="System"
 COMMENT="Locale-based strings for First Choice Software Customizations"
  FIELDS
    objid  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     MANDATORY PREDEFINED
     GEN_FIELD_ID=3
     COMMENT="Internal record number"
,
    id  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     MANDATORY PREDEFINED
     COMMENT="String ID"
,
    string  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=255
     COMMENT="Text  of the string"
,
    locale  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=20
     COMMENT="Indicates the locale of the string; e.g., EN_US=US English, JA_JP=Japanese in Japan"
,
    application  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=80
,
    dev  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     MANDATORY PREDEFINED ALLOW_NULL
     GEN_FIELD_ID=151
     DEFAULT="1"
     COMMENT="Row version number for mobile distribution purposes"
  FIELDS_END
OBJECT_END;

OBJECT fc_list_hdr 3501
 SUBJECT="FC I18N"
 COMMENT="Header record for First Choice Software list object"
  FIELDS
    objid  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     MANDATORY PREDEFINED
     GEN_FIELD_ID=3
     COMMENT="Internal record number"
,
    title  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=80
     COMMENT="Name of the list"
,
    description  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=255
     COMMENT="Description of the list"
,
    application  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=80
     COMMENT="What is the list for?"
,
    dev  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     MANDATORY PREDEFINED ALLOW_NULL
     GEN_FIELD_ID=151
     DEFAULT="1"
     COMMENT="Row version number for mobile distribution purposes"
  FIELDS_END
  RELATIONS
    hdr2fc_list_level OTOP fc_list_level USER_DEFINED
     INV_REL=level2fc_list_hdr     COMMENT="Top-level of list"

  RELATIONS_END
OBJECT_END;

OBJECT fc_list_level 3502
 SUBJECT="FC I18N"
 COMMENT="One level of a First Choice Software list"
  FIELDS
    objid  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     MANDATORY PREDEFINED
     GEN_FIELD_ID=3
     COMMENT="Internal record number"
,
    dev  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     MANDATORY PREDEFINED ALLOW_NULL
     GEN_FIELD_ID=151
     DEFAULT="1"
     COMMENT="Row version number for mobile distribution purposes"
  FIELDS_END
  RELATIONS
    level2fc_list_elm OTM fc_list_elm USER_DEFINED
     INV_REL=elm2fc_list_level     COMMENT="Elements for this list level"
,
    level2fc_list_hdr OTOF fc_list_hdr USER_DEFINED
     INV_REL=hdr2fc_list_level     COMMENT="Relates top level to header"
,
    child2fc_list_elm OTOF fc_list_elm USER_DEFINED
     INV_REL=parent2fc_list_level     COMMENT="The element that this level was called from"

  RELATIONS_END
OBJECT_END;

OBJECT fc_list_elm 3503
 SUBJECT="FC I18N"
 COMMENT="One element in a First Choice Software list"
  FIELDS
    objid  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     MANDATORY PREDEFINED
     GEN_FIELD_ID=3
     COMMENT="Internal record number"
,
    rank  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     MANDATORY PREDEFINED
     COMMENT="The position of this element in the level"
,
    state  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     MANDATORY PREDEFINED
     COMMENT="The state of the element. 0 = Default. 1 = Active. 2 = Inactive"
,
    fc_use  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=20
     COMMENT="Only used by the i18n list gui. Do not depend on this field having a value."
,
    fc_use2  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=20
     COMMENT="Only used by the i18n list gui. Do not depend on this field having a value."
,
    dev  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     MANDATORY PREDEFINED ALLOW_NULL
     GEN_FIELD_ID=151
     DEFAULT="1"
     COMMENT="Row version number for mobile distribution purposes"
  FIELDS_END
  RELATIONS
    elm2fc_list_level MTO fc_list_level USER_DEFINED
     INV_REL=level2fc_list_elm     COMMENT="Level for this element"
,
    parent2fc_list_level OTOP fc_list_level USER_DEFINED
     INV_REL=child2fc_list_elm     COMMENT="The sub-level for this element"
,
    locs2fc_list_locelm OTM fc_list_locelm USER_DEFINED
     INV_REL=locelm2fc_list_elm     COMMENT="The locale strings for this element"

  RELATIONS_END
OBJECT_END;

OBJECT fc_list_locelm 3504
 SUBJECT="FC I18N"
 COMMENT="One locale string for an element in a First Choice Software list"
  FIELDS
    objid  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     MANDATORY PREDEFINED
     GEN_FIELD_ID=3
     COMMENT="Internal record number"
,
    title  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=20
     COMMENT="String for the locale element"
,
    locale  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=20
     COMMENT="Locale for the locale element"
,
    other  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=80
     COMMENT="Other string for the locale element"
,
    dev  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     MANDATORY PREDEFINED ALLOW_NULL
     GEN_FIELD_ID=151
     DEFAULT="1"
     COMMENT="Row version number for mobile distribution purposes"
  FIELDS_END
  RELATIONS
    locelm2fc_list_elm MTO fc_list_elm USER_DEFINED
     INV_REL=locs2fc_list_locelm     COMMENT="Element for this locale string"

  RELATIONS_END
OBJECT_END;

OBJECT fc_locale 3505
 SUBJECT="System"
 COMMENT=" "
  FIELDS
    objid  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     MANDATORY PREDEFINED
     GEN_FIELD_ID=3
     COMMENT="Internal record number"
,
    locale_name  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=20
,
    abday  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=255
,
    day  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=255
,
    abmon  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=255
,
    mon  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=255
,
    d_t_fmt  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=255
,
    d_fmt  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=255
,
    t_fmt  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=255
,
    am_pm  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=255
,
    t_fmt_ampm  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=255
,
    upper  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=255
,
    lower  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=255
,
    space  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=255
,
    cntrl  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=255
,
    punct  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=255
,
    digit  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=255
,
    xdigit CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=255
,
    blank  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=255
,
    toupper  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=255
,
    tolower  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=255
,
    yesexpr  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=255
,
    noexpr  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=255
,
    int_curr_symbol  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=20
,
    currency_symbol  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=10
,
    mon_decimal_point  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=10
,
    mon_thousands_sep  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=10
,
    mon_grouping  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     MANDATORY PREDEFINED COMMENT=""
,
    positive_sign  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=10
,
    negative_sign  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=10
,
    int_frac_digits  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     MANDATORY PREDEFINED
,
    frac_digits  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     MANDATORY PREDEFINED
,
    p_cs_precedes  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     MANDATORY PREDEFINED
,
    p_sep_by_space  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     MANDATORY PREDEFINED
,
    n_cs_precedes  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     MANDATORY PREDEFINED
,
    n_sep_by_space  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     MANDATORY PREDEFINED
,
    p_sign_posn  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     MANDATORY PREDEFINED
,
    n_sign_posn  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     MANDATORY PREDEFINED
,
    decimal_point  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=20
,
    thousands_sep  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY PREDEFINED
     ARRAY_SIZE=20
,
    grouping  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     MANDATORY PREDEFINED
,
    dev  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     MANDATORY PREDEFINED ALLOW_NULL
     GEN_FIELD_ID=151
     DEFAULT="1"
     COMMENT="Row version number for mobile distribution purposes"
  FIELDS_END
OBJECT_END;

/*
 * That's it.
 */