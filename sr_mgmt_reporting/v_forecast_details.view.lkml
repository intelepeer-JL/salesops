# The name of this view in Looker is "V Forecast Details"
view: v_forecast_details {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `test-and-poc.salesops_sf_dev_views.v_forecast_details`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Accoun Name" in Explore.

  dimension: accoun_name {
    type: string
    sql: ${TABLE}.AccounName ;;
  }

  dimension: arr {
    type: number
    sql: ${TABLE}.ARR ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_arr {
    type: sum
    sql: ${arr} ;;
  }

  measure: average_arr {
    type: average
    sql: ${arr} ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: closedate {
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
    sql: ${TABLE}.closedate ;;
  }

  dimension_group: creadte {
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
    sql: ${TABLE}.CreadteDate ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.Department ;;
  }

  dimension: fiscal_period {
    type: string
    sql: ${TABLE}.FiscalPeriod ;;
  }

  dimension: forecast_category {
    type: string
    sql: ${TABLE}.ForecastCategory ;;
  }

  dimension: opp_name {
    type: string
    sql: ${TABLE}.OppName ;;
  }

  dimension: opp_owner {
    type: string
    sql: ${TABLE}.OppOwner ;;
  }

  dimension: role {
    type: string
    sql: ${TABLE}.Role ;;
  }

  dimension: stagename {
    type: string
    sql: ${TABLE}.stagename ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  measure: count {
    type: count
    drill_fields: [opp_name, stagename, accoun_name]
  }
}
