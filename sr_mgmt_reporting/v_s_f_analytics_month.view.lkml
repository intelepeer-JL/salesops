# The name of this view in Looker is "V S F Analytics Month"
view: v_s_f_analytics_month {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `test-and-poc.salesops_sf.V_S_F_Analytics_month`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Close Age" in Explore.

  dimension: close_age {
    type: number
    sql: ${TABLE}.close_age ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_close_age {
    type: sum
    sql: ${close_age} ;;
  }

  measure: average_close_age {
    type: average
    sql: ${close_age} ;;
  }

  dimension: closed_c {
    type: number
    sql: ${TABLE}.closed_c ;;
  }

  dimension: closed_val {
    type: number
    sql: ${TABLE}.closed_val ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: lost_age {
    type: number
    sql: ${TABLE}.lost_age ;;
  }

  dimension: lost_c {
    type: number
    sql: ${TABLE}.lost_c ;;
  }

  dimension: lost_val {
    type: number
    sql: ${TABLE}.lost_val ;;
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

  dimension: open_age {
    type: number
    sql: ${TABLE}.Open_age ;;
  }

  dimension: open_c {
    type: number
    sql: ${TABLE}.Open_c ;;
  }

  dimension: open_val {
    type: number
    sql: ${TABLE}.open_val ;;
  }

  dimension: quota {
    type: number
    sql: ${TABLE}.quota ;;
  }

  dimension: won_age {
    type: number
    sql: ${TABLE}.won_age ;;
  }

  dimension: won_c {
    type: number
    sql: ${TABLE}.won_c ;;
  }

  dimension: won_val {
    type: number
    sql: ${TABLE}.won_val ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
