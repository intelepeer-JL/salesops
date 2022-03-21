# The name of this view in Looker is "V Forecast S2"
view: v_forecast_s2 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `test-and-poc.salesops_sf.v_Forecast_s2`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Closedval" in Explore.

  dimension: closedval {
    type: number
    sql: ${TABLE}.closedval ;;
  }

  dimension: forecast_conversion {
    type: number
    sql: ${TABLE}.forecast_conversion ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_forecast_conversion {
    type: sum
    sql: ${forecast_conversion} ;;
  }

  measure: average_forecast_conversion {
    type: average
    sql: ${forecast_conversion} ;;
  }

  dimension: gross {
    type: number
    sql: ${TABLE}.GROSS ;;
  }

  dimension: lost {
    type: number
    sql: ${TABLE}.lost ;;
  }

  dimension: mgmt_dept {
    type: string
    sql: ${TABLE}.mgmtDept ;;
  }

  dimension: Quarter {
    type:  string
    sql: concat(${quarter_month},"-",${quarter_year}) ;;
  }

  dimension: net {
    type: number
    sql: ${TABLE}.Net ;;
  }

  dimension: openval {
    type: number
    sql: ${TABLE}.openval ;;
  }
  measure: winrate {
    type: number
    sql: sum(${won})/sum(${totalval})
    ;;
    value_format: "%"
  }

  measure: funnel_achieve {
    type: number
    sql: sum(${gross})/.25 ;;



  }


  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: quarter {
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
    sql: ${TABLE}.quarter ;;
  }

  dimension: totalval {
    type: number
    sql: ${TABLE}.totalval ;;
  }

  dimension: won {
    type: number
    sql: ${TABLE}.won ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
