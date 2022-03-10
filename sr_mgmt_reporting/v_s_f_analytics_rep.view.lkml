# The name of this view in Looker is "V S F Analytics Rep"
view: v_s_f_analytics_rep {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `salesops_sf.v_S_F_Analytics_rep`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Active Days" in Explore.

  dimension: active_days {
    type: number
    sql: ${TABLE}.Active_days ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_active_days {
    type: sum
    sql: ${active_days} ;;
  }

  measure: average_active_days {
    type: average
    sql: ${active_days} ;;
  }

  dimension: active_days_ty {
    type: number
    sql: ${TABLE}.Active_days_ty ;;
  }

  dimension: close_avg_days {
    type: number
    sql: ${TABLE}.close_avg_days ;;
  }

  dimension: close_avg_days_ty {
    type: number
    sql: ${TABLE}.close_avg_days_ty ;;
  }

  dimension: close_days {
    type: number
    sql: ${TABLE}.close_days ;;
  }

  dimension: close_days_ty {
    type: number
    sql: ${TABLE}.close_days_ty ;;
  }

  dimension: closed_avg {
    type: number
    sql: ${TABLE}.closed_avg ;;
  }

  dimension: closed_avg_ty {
    type: number
    sql: ${TABLE}.closed_avg_ty ;;
  }

  dimension: closed_c {
    type: number
    sql: ${TABLE}.closed_c ;;
  }

  dimension: closed_c_ty {
    type: number
    sql: ${TABLE}.closed_c_ty ;;
  }

  dimension: closed_val {
    type: number
    sql: ${TABLE}.closed_val ;;
  }

  dimension: closed_val_ty {
    type: number
    sql: ${TABLE}.closed_val_ty ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.Department ;;
  }

  dimension: lost {
    type: number
    sql: ${TABLE}.lost ;;
  }

  dimension: lost_avg {
    type: number
    sql: ${TABLE}.lost_avg ;;
  }

  dimension: lost_avg_days {
    type: number
    sql: ${TABLE}.lost_avg_days ;;
  }

  dimension: lost_avg_days_ty {
    type: number
    sql: ${TABLE}.lost_avg_days_ty ;;
  }

  dimension: lost_avg_ty {
    type: number
    sql: ${TABLE}.lost_avg_ty ;;
  }

  dimension: lost_c {
    type: number
    sql: ${TABLE}.lost_c ;;
  }

  dimension: lost_c_ty {
    type: number
    sql: ${TABLE}.lost_c_ty ;;
  }

  dimension: lost_days {
    type: number
    sql: ${TABLE}.lost_days ;;
  }

  dimension: lost_days_ty {
    type: number
    sql: ${TABLE}.lost_days_ty ;;
  }

  dimension: lost_ty {
    type: number
    sql: ${TABLE}.lost_ty ;;
  }

  dimension: open_val {
    type: number
    sql: ${TABLE}.open_val ;;
  }

  dimension: open_val_ty {
    type: number
    sql: ${TABLE}.open_val_ty ;;
  }

  dimension: opp_owner {
    type: string
    sql: ${TABLE}.OppOwner ;;
  }

  dimension: role {
    type: string
    sql: ${TABLE}.Role ;;
  }

  dimension: won {
    type: number
    sql: ${TABLE}.won ;;
  }

  dimension: won_avg {
    type: number
    sql: ${TABLE}.won_avg ;;
  }

  dimension: won_avg_days {
    type: number
    sql: ${TABLE}.won_avg_days ;;
  }

  dimension: won_avg_days_ty {
    type: number
    sql: ${TABLE}.won_avg_days_ty ;;
  }

  dimension: won_avg_ty {
    type: number
    sql: ${TABLE}.won_avg_ty ;;
  }

  dimension: won_c {
    type: number
    sql: ${TABLE}.won_c ;;
  }

  dimension: won_c_ty {
    type: number
    sql: ${TABLE}.won_c_ty ;;
  }

  dimension: won_days {
    type: number
    sql: ${TABLE}.won_days ;;
  }

  dimension: won_days_ty {
    type: number
    sql: ${TABLE}.won_days_ty ;;
  }

  dimension: won_ty {
    type: number
    sql: ${TABLE}.won_ty ;;
  }

  measure: avgclose {
    type: number
    sql: sum(${close_days})/nullif(sum(${closed_c}),0) ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
