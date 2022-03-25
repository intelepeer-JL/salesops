# The name of this view in Looker is "V Team Forecast S2"
view: v_team_forecast_s2 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `test-and-poc.salesops_views.v_team_forecast_s2`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Active" in Explore.

  dimension: active {
    type: number
    sql: ${TABLE}.active ;;
    value_format: "$#,##0"
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_active {
    type: sum
    sql: ${active} ;;
    value_format: "$#,##0"
  }

  measure: average_active {
    type: average
    sql: ${active} ;;
    value_format: "$#,##0"
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: close_month {
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
    sql: ${TABLE}.CloseMonth ;;
  }

  dimension: committed {
    type: number
    sql: ${TABLE}.Committed ;;
    value_format: "$#,##0"
  }

  dimension: cpaa_s_1 {
    type: number
    sql: ${TABLE}.CPaaS_1 ;;
    value_format: "$#,##0"
  }

  dimension: cpaa_s_2 {
    type: number
    sql: ${TABLE}.CPaaS_2 ;;
    value_format: "$#,##0"
  }

  dimension: cw {
    type: number
    sql: ${TABLE}.cw ;;
    value_format: "$#,##0"
  }

  dimension: department {
    type: string
    sql: ${TABLE}.Department ;;
  }

  dimension: lost {
    type: number
    sql: ${TABLE}.lost ;;
    value_format: "$#,##0"
  }

  dimension_group: month {
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
    sql: ${TABLE}.month ;;
  }

  dimension: mrpf {
    type: number
    sql: ${TABLE}.MRPF ;;
    value_format: "$#,##0"
  }

  dimension: mrpfcount {
    type: number
    sql: ${TABLE}.MRPFCount ;;
  }

  dimension: opp_owner {
    type: string
    sql: ${TABLE}.OppOwner ;;
  }

  dimension: owner_id {
    type: string
    sql: ${TABLE}.OwnerId ;;
  }

  dimension: probable {
    type: number
    sql: ${TABLE}.Probable ;;
    value_format: "$#,##0"
  }

  dimension: quota {
    type: number
    sql: ${TABLE}.Quota ;;
    value_format: "$#,##0"
  }

  dimension: quota_department {
    type: string
    sql: ${TABLE}.QuotaDepartment ;;
  }

  dimension: quota_role {
    type: string
    sql: ${TABLE}.QuotaRole ;;
  }

  dimension: rep {
    type: string
    sql: ${TABLE}.Rep ;;
  }

  dimension: rm {
    type: number
    sql: ${TABLE}.RM ;;
    value_format: "$#,##0"
  }

  dimension: rm_mrpf {
    type: number
    sql: ${TABLE}.RM_MRPF ;;
    value_format: "$#,##0"
  }

  dimension: role {
    type: string
    sql: ${TABLE}.Role ;;
  }

  dimension: upside {
    type: number
    sql: ${TABLE}.Upside ;;
    value_format: "$#,##0"
  }

  dimension: voice {
    type: number
    sql: ${TABLE}.Voice ;;
    value_format: "$#,##0"
  }

  dimension: won {
    type: number
    sql: ${TABLE}.won ;;
    value_format: "$#,##0"
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
