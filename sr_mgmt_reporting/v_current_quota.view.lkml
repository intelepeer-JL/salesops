# The name of this view in Looker is "V Current Quota"
view: v_current_quota {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `test-and-poc.salesops_sf_dev_views.v_current_quota`
    ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Department" in Explore.

  dimension: department {
    type: string
    sql: ${TABLE}.Department ;;
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

  dimension: quota {
    type: number
    sql: ${TABLE}.quota ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_quota {
    type: sum
    sql: ${quota} ;;
  }

  measure: average_quota {
    type: average
    sql: ${quota} ;;
  }

  dimension: rep {
    type: string
    sql: ${TABLE}.Rep ;;
  }

  dimension: rep_status {
    type: string
    sql: ${TABLE}.Rep_status ;;
  }

  dimension: role {
    type: string
    sql: ${TABLE}.Role ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.UserId ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
