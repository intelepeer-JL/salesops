# The name of this view in Looker is "V Booking Team S5"
view: v_booking_team_s5 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `salesops_sf.v_booking_team_s5`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

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

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Committed" in Explore.

  dimension: committed {
    type: number
    sql: ${TABLE}.Committed ;;
    value_format:"$#;($#)"
  }

  dimension: cpaa_s {
    type: number
    sql: ${TABLE}.CPaaS ;;
    value_format:"#,##0;($#,##0)"
  }

  dimension: won {
    type: number
    sql: ${TABLE}.won ;;
    value_format:"#,##0;($#,##0)"
  }

  dimension: Pipe {
    type: number
    sql: ${TABLE}.Pipe ;;
    value_format:"#,##0;($#,##0)"
  }

  dimension: lost {
    type: number
    sql: ${TABLE}.lost ;;
    value_format:"#,##0;($#,##0)"
  }

  dimension: total_val {
    type: number
    sql: ${TABLE}.total_val ;;
    value_format:"#,##0;($#,##0)"
  }

  dimension: wonc {
    type: number
    sql: ${TABLE}.wonc ;;
  }

  dimension: lostc {
    type: number
    sql: ${TABLE}.lostc ;;

  }

  dimension: totalcount {
    type: number
    sql: ${TABLE}.totalcount ;;
  }

  dimension: cpaa_s2 {
    type: number
    sql: ${TABLE}.CPaaS2 ;;
    value_format:"#,##0;($#,##0)"
  }

  dimension: cpaa_s2c {
    type: number
    sql: ${TABLE}.CPaaS2c ;;
  }

  dimension: cpaa_sc {
    type: number
    sql: ${TABLE}.CPaaSc ;;
  }

  dimension: expansion {
    type: number
    sql: ${TABLE}.Expansion ;;
    value_format:"#,##0;($#,##0)"
  }

  dimension: expansionc {
    type: number
    sql: ${TABLE}.Expansionc ;;
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

  dimension: mrg_amount {
    type: number
    sql: ${TABLE}.MRG_Amount ;;
    value_format:"#,##0;($#,##0)"
  }

  dimension: closemonthgroup {
    type: string
    sql: concat(format_date("%B",${month_date})," ",format_date("%Y",${month_date})) ;;
    order_by_field: month_date
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.


  measure: quota_percent {
    type: number
    value_format: "0.00%"
    sql: (sum(${total_booking})/nullif(sum(${quota}),0)) ;;
    }

  measure: win_percent_arr {
    type: number
    value_format: "0.00%"
    sql: (sum(${won})/nullif(sum(${total_val}),0)) ;;
  }

  measure: win_percent_count {
    type: number
    value_format: "0.00%"
    sql: (sum(${wonc})/nullif(sum(${totalcount}),0)) ;;
  }

  measure: funnel_to_quota {
    type: number
    value_format: "0.00%"
    sql: (sum(${Pipe})/nullif(sum(${quota}),0)) ;;
  }

  measure: win_committed {
    type: number
    sql: ${total_booking}+${committed} ;;
    value_format:"#,##0;($#,##0)"
  }

  measure: quota_win {
    type: number
    sql: (sum(${Pipe})*win_percent_arr ;;
  }

  measure: total_mrg_amount {
    type: sum
    sql: ${mrg_amount} ;;
    value_format:"#,##0;($#,##0)"
  }

  measure: win_rate {
    type: number
    sql: if(${role}="Channel Sales East",.18,
    if(${role}="Channel Sales West",.22,
    if(${role} = "Midmarket Core Account Management",.44,
    if(${role} = "Midmarket Base Account Management",.27,
    if(${role} = "Key Account Management",.27,.25)))));;
  }

  measure: team_win_rate {
    type: number
    sql: if(${sq_department} = "Account Management", .31,
    if(${sq_department} = "Channel Sales",.22,.25));;
  }

  measure: forecast_book {
    type: number
    sql:sum(${Pipe})*${win_rate}   ;;
  }

  measure: average_mrg_amount {
    type: average
    sql: ${mrg_amount} ;;
    value_format:"#,##0;($#,##0)"
  }

  dimension: mrg_incremental {
    type: number
    sql: ${TABLE}.MRG_Incremental ;;
    value_format:"#,##0;($#,##0)"
  }

  dimension: mrpf {
    type: number
    sql: ${TABLE}.MRPF ;;
    value_format:"#,##0;($#,##0)"
  }

  dimension: mrpfcount {
    type: number
    sql: ${TABLE}.MRPFCount ;;
  }

  dimension: new_logo {
    type: number
    sql: ${TABLE}.NewLogo ;;
    value_format:"#,##0;($#,##0)"
  }

  dimension: new_logoc {
    type: number
    sql: ${TABLE}.New_Logoc ;;
  }

  dimension: oppowner_id {
    type: string
    sql: ${TABLE}.OppownerId ;;
  }

  dimension: probable {
    type: number
    sql: ${TABLE}.Probable ;;
    value_format:"#,##0;($#,##0)"
  }

  dimension: quota {
    type: number
    sql: ${TABLE}.quota ;;
    value_format:"#,##0;($#,##0)"
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

  dimension: role_id {
    type: string
    sql: ${TABLE}.role_id ;;
  }

  dimension: sq_department {
    type: string
    sql: ${TABLE}.SQ_department ;;
  }

  dimension: total_booking {
    type: number
    sql: ${TABLE}.total_booking ;;
    value_format:"#,##0;($#,##0)"
  }

  dimension: upside {
    type: number
    sql: ${TABLE}.Upside ;;
    value_format:"#,##0;($#,##0)"
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.UserID ;;
  }

  dimension: voice {
    type: number
    sql: ${TABLE}.Voice ;;
    value_format:"#,##0;($#,##0)"
  }

  dimension: voicec {
    type: number
    sql: ${TABLE}.Voicec ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
