# The name of this view in Looker is "V Booking V2s6"
view: v_booking_v2s6 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `salesops_sf.v_booking_v2s6`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Booking" in Explore.

  dimension: booking {
    type: number
    sql: ${TABLE}.booking ;;
    value_format: "$#,##0"
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_booking {
    type: sum
    sql: ${booking} ;;
    value_format: "$#,##0"
  }

  measure: average_booking {
    type: average
    sql: ${booking} ;;
    value_format: "$#,##0"
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: gross {
    type: number
    sql: ${TABLE}.Gross ;;
    value_format: "$#,##0"
  }

  dimension: mgmt_plan {
    type: number
    sql: ${TABLE}.Mgmt_plan ;;
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

  dimension_group: quota_month {
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
    sql: ${TABLE}.quota_month ;;
  }

  dimension: sq_department {
    type: string
    sql: ${TABLE}.SQ_department ;;
  }

  dimension: team_quota {
    type: number
    sql: ${TABLE}.team_quota ;;
    value_format: "$#,##0"
  }

  dimension: closemthgroup {
    type: string
    sql:concat(format_date("%B",${quota_month_date})," ",format_date("%Y",${quota_month_date})) ;;
    order_by_field: quota_month_date

  }
  dimension: Quarter {
    type:  string
    sql: concat(${quota_month_quarter},"-",${quota_month_year}) ;;
  }

  measure: mgmt_eff {
    type: number
    value_format: "0.0%"
    sql: ((${total_booking})/nullif((${mgmt_plan}),0)) ;;

  }

  measure: mgmt_gross_eff {
    type: number
    value_format: "0.0%"
    sql: ((${total_booking})/nullif(sum(${gross}),0)) ;;

  }

  measure: quota_eff_2 {
    type: number
    value_format: "0.0%"
    sql: ((${total_booking})/nullif(sum(${team_quota}),0)) ;;

  }



  measure: count {
    type: count
    drill_fields: []
  }
}
