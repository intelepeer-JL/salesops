# The name of this view in Looker is "V Weekly Add"
view: v_weekly_add {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `test-and-poc.salesops_sf.v_weekly_add`
    ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.Id ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Arr" in Explore.

  dimension: arr {
    type: number
    sql: ${TABLE}.ARR ;;
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
  }

  dimension: total_dept_arr {
    type: number
    sql: ${TABLE}.total_arr ;;
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
  }



  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_arr {
    type: sum
    sql: ${arr} ;;
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
  }

  measure: average_arr {
    type: average
    sql: ${arr} ;;
  }

  dimension: campaign_driven {
    type: string
    sql: ${TABLE}.Campaign_Driven ;;
  }

  dimension: cpaa_s_designation {
    type: string
    sql: ${TABLE}.CPaaS_Designation ;;
  }

  dimension: cpaa_s_mrc_arr {
    type: number
    sql: ${TABLE}.CPaaS_MRC_ARR ;;
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
  }

  dimension: cpaa_s_mrc_yn {
    type: string
    sql: ${TABLE}.CPaaS_MRC_YN ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created_month {
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
    sql: ${TABLE}.Created_month ;;
  }

  dimension_group: current_execution {
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
    sql: ${TABLE}.CurrentExecutionDate ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.Department ;;
  }

  dimension: monthly_forecast_at_ramp {
    type: number
    sql: ${TABLE}.Monthly_Forecast_At_Ramp ;;
  }

  dimension: mtd {
    type: string
    sql: ${TABLE}.MTD ;;
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

  dimension: stage_group {
    type: string
    sql: ${TABLE}.StageGroup ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.Status ;;
  }

  dimension: total_cpaa_s_mrc {
    type: number
    sql: ${TABLE}.Total_CPaaS_MRC ;;
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
  }

  dimension: tw {
    type: string
    sql: ${TABLE}.TW ;;
  }

  dimension: wo_w {
    type: string
    sql: ${TABLE}.WoW ;;
  }

  measure: count {
    type: count
    drill_fields: [id, opp_name]
  }
}
