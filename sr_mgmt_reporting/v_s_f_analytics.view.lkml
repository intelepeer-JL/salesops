# The name of this view in Looker is "V S F Analytics"
view: v_s_f_analytics {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `salesops_sf.v_S_F_Analytics`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Active Funnel" in Explore.

  dimension: active_funnel {
    type: number
    sql: ${TABLE}.Active_Funnel ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_active_funnel {
    type: sum
    sql: ${active_funnel} ;;
  }

  measure: average_active_funnel {
    type: average
    sql: ${active_funnel} ;;
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
  }

  dimension: department {
    type: string
    sql: ${TABLE}.Department ;;
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

  dimension: opp_owner {
    type: string
    sql: ${TABLE}.OppOwner ;;
  }


  dimension: quota {
    type: number
    sql: ${TABLE}.quota ;;
    value_format: "$#,##0"
  }

  dimension: rep {
    type: string
    sql: ${TABLE}.Rep ;;
  }

  dimension: rep_id {
    type: string
    sql: ${TABLE}.RepId ;;
  }

  dimension: rep_status {
    type: string
    sql: ${TABLE}.Rep_status ;;
  }

  dimension: role {
    type: string
    sql: ${TABLE}.Role ;;
  }

  dimension: sq_department {
    type: string
    sql: ${TABLE}.SQ_department ;;
  }

  dimension: sq_role {
    type: string
    sql: ${TABLE}.sq_Role ;;
  }

  dimension: upside {
    type: number
    sql: ${TABLE}.Upside ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.UserID ;;
  }

  dimension: won_val {
    type: number
    sql: ${TABLE}.won_val ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  # created elements #

  measure: win_rate {
    type: number
    sql: if(${role}="Channel Sales East",.18,
          if(${role}="Channel Sales West",.22,
          if(${role} = "Midmarket Core Account Management",.44,
          if(${role} = "Midmarket Base Account Management",.44,
          if(${role} = "Key Account Management",.44,.25)))));;
  }

  measure: team_win_rate {
    type: number
    sql: if(${sq_department} = "Account Management", .44,
      if(${sq_department} = "Channel Sales",.22,.25));;
  }

  dimension: Pipe {
    type: number
    sql: ${TABLE}.Active_Funnel ;;
    value_format: "$#,##0"
  }

  measure: forecast_book {
    type: number
    sql:COALESCE( sum(${Pipe})*${win_rate} ,0)  ;;
    value_format: "$#,##0"
  }

  measure: team_forecast_book {
    type: number
    sql:COALESCE(sum(${Pipe})*${team_win_rate} ,0)  ;;
    value_format: "$#,##0"
  }

  measure: forecast_diff {
    type: number
    sql:if((${Booking_to_Quota}-sum(${Pipe})*${win_rate}) < 0 ,0 ,(${Booking_to_Quota}-sum(${Pipe})*${win_rate})) ;;
    value_format: "$#,##0"
  }

  measure: team_forecast_diff {
    type: number
    sql:if((${Booking_to_Quota}-sum(${Pipe})*${team_win_rate})<0,0,(${Booking_to_Quota}-sum(${Pipe})*${team_win_rate})) ;;
    value_format: "$#,##0"
  }

  measure: Booking_to_Quota {
    type: number
    sql: sum(${quota})-sum(${won_val}) ;;
  }



  dimension: closemonthgroup {
    type: string
    sql: concat(format_date("%B",${month_date})," ",format_date("%Y",${month_date})) ;;
    order_by_field: month_date
  }

  #not being used #

  dimension: pipeline {
    type: number
    hidden: yes
    sql: ${TABLE}.Pipeline ;;
  }

  dimension: probable {
    type: number
    hidden: yes
    sql: ${TABLE}.Probable ;;
  }


}
