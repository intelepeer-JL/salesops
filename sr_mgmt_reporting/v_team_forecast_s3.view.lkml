# The name of this view in Looker is "V Team Forecast S3"
view: v_team_forecast_s3 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `test-and-poc.salesops_views.v_team_forecast_s3`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Committed" in Explore.

  dimension: committed {
    type: number
    sql: ${TABLE}.committed ;;
    value_format: "$#,##0"
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_committed {
    type: sum
    sql: ${committed} ;;
    value_format: "$#,##0"
  }

  measure: average_committed {
    type: average
    sql: ${committed} ;;
    value_format: "$#,##0"
  }

  measure: Actual_to_qupta {
    type:  number
    value_format: "0.00%"
    sql: sum(${won})/nullif(sum(${quota}),0) ;;
  }

  measure: cw_to_qupta {
    type:  number
    value_format: "0.00%"
    sql: sum(${cw})/nullif(sum(${quota}),0) ;;
  }

  measure: Actual_to_gross {
    type:  number
    value_format: "0.00%"
    sql: sum(${won})/nullif(sum(${gross}),0) ;;
  }

  measure: Actual_to_Net {
    type:  number
    value_format: "0.00%"
    sql: sum(${won})/nullif(sum(${net}),0) ;;
  }

  measure: cw_to_gross {
    type:  number
    value_format: "0.00%"
    sql: sum(${cw})/nullif(sum(${gross}),0) ;;
  }

  measure: cw_to_net {
    type:  number
    value_format: "0.00%"
    sql: sum(${cw})/nullif(sum(${net}),0) ;;
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

  dimension: gross {
    type: number
    sql: ${TABLE}.GROSS ;;
    value_format: "$#,##0"
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

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

  dimension: closemthgroup {
    type: string
    sql:concat(format_date("%B",${month_date})," ",format_date("%Y",${month_date})) ;;
    order_by_field: month_date

  }

  dimension: net {
    type: number
    sql: ${TABLE}.Net ;;
    value_format: "$#,##0"
  }

  dimension: probable {
    type: number
    sql: ${TABLE}.probable ;;
    value_format: "$#,##0"
  }

  dimension: quota {
    type: number
    sql: ${TABLE}.Quota ;;
    value_format: "$#,##0"
  }

  dimension: upside {
    type: number
    sql: ${TABLE}.upside ;;
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
