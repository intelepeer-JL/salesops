# The name of this view in Looker is "V Cpaa S Adds"
view: v_cpaa_s_adds {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `test-and-poc.salesops_sf.v_CPaaS_Adds`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Account Name" in Explore.

  dimension: account_name {
    type: string
    sql: ${TABLE}.Account_Name ;;
  }

  dimension: account_owner {
    type: string
    sql: ${TABLE}.AccountOwner ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: contract_effective {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Contract_Effective_Date ;;
  }

  dimension_group: cpaa_s_effective {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.CPaaS_Effective_Date ;;
  }

  dimension: cpaa_sbuild {
    type: string
    sql: ${TABLE}.CPaaSbuild ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.Department ;;
  }

  dimension: new_installed {
    type: string
    sql: ${TABLE}.New_Installed ;;
  }

  dimension: portal_enabled_type {
    type: string
    sql: ${TABLE}.PortalEnabled_Type ;;
  }

  dimension: product {
    type: string
    sql: ${TABLE}.Product ;;
  }

  dimension: role {
    type: string
    sql: ${TABLE}.Role ;;
  }

  dimension: sap_id {
    type: string
    sql: ${TABLE}.SAP_ID ;;
  }

  dimension: team {
    type: string
    sql: ${TABLE}.Team ;;
  }

  measure: count {
    type: count
    drill_fields: [account_name]
  }
}
