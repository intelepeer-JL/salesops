# The name of this view in Looker is "V Wo W Analysis"
view: v_wo_w_analysis {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `test-and-poc.salesops_sf.v_WoW_analysis`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Account Name" in Explore.

  dimension: account_name {
    type: string
    sql: ${TABLE}.AccountName ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: close_date {
    type: string
    sql: ${TABLE}.CloseDate ;;
  }

  dimension: closedloss {
    type: number
    sql: ${TABLE}.closedloss ;;
  }

  dimension: closedloss_c {
    type: number
    sql: ${TABLE}.closedloss_c ;;
  }

  dimension: closedwon {
    type: number
    sql: ${TABLE}.closedwon ;;
  }

  dimension: closedwon_c {
    type: number
    sql: ${TABLE}.closedwon_c ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.Created ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.Department ;;
  }

  dimension: inactive {
    type: number
    sql: ${TABLE}.inactive ;;
  }

  dimension: inactive_c {
    type: number
    sql: ${TABLE}.inactive_c ;;
  }

  dimension: is_active {
    type: string
    sql: ${TABLE}.IsActive ;;
  }

  dimension_group: lastweek {
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
    sql: ${TABLE}.lastweek ;;
  }

  dimension: lw_active {
    type: number
    sql: ${TABLE}.LW_Active ;;
  }

  dimension: lw_active_c {
    type: number
    sql: ${TABLE}.LW_Active_c ;;
  }

  dimension: lw_amount {
    type: number
    sql: ${TABLE}.LW_Amount ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_lw_amount {
    type: sum
    sql: ${lw_amount} ;;
  }

  measure: average_lw_amount {
    type: average
    sql: ${lw_amount} ;;
  }

  dimension: lw_status {
    type: string
    sql: ${TABLE}.LW_Status ;;
  }

  dimension: newadd {
    type: number
    sql: ${TABLE}.newadd ;;
  }

  dimension: newadd_c {
    type: number
    sql: ${TABLE}.newadd_c ;;
  }

  dimension: opp_name {
    type: string
    sql: ${TABLE}.OppName ;;
  }

  dimension: opp_owner {
    type: string
    sql: ${TABLE}.OppOwner ;;
  }

  dimension: opp_owner_id {
    type: string
    sql: ${TABLE}.OppOwnerID ;;
  }

  dimension: opp_record_type {
    type: string
    sql: ${TABLE}.OppRecordType ;;
  }

  dimension: removed {
    type: number
    sql: ${TABLE}.removed ;;
  }

  dimension: removed_c {
    type: number
    sql: ${TABLE}.removed_c ;;
  }

  dimension: rengaged {
    type: number
    sql: ${TABLE}.Rengaged ;;
  }

  dimension: rengaged_c {
    type: number
    sql: ${TABLE}.Rengaged_c ;;
  }

  dimension: role {
    type: string
    sql: ${TABLE}.Role ;;
  }

  dimension: stalled {
    type: number
    sql: ${TABLE}.Stalled ;;
  }

  dimension: stalled_c {
    type: number
    sql: ${TABLE}.Stalled_c ;;
  }

  dimension: team {
    type: string
    sql: ${TABLE}.Team ;;
  }

  dimension_group: thisweek {
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
    sql: ${TABLE}.thisweek ;;
  }

  dimension: totalid {
    type: string
    sql: ${TABLE}.totalid ;;
  }

  dimension: tw_active {
    type: number
    sql: ${TABLE}.TW_Active ;;
  }

  dimension: tw_active_c {
    type: number
    sql: ${TABLE}.TW_Active_c ;;
  }

  dimension: tw_amount {
    type: number
    sql: ${TABLE}.TW_Amount ;;
  }

  dimension: tw_status {
    type: string
    sql: ${TABLE}.TW_Status ;;
  }

  dimension: value_change {
    type: number
    sql: ${TABLE}.ValueChange ;;
  }

  dimension: value_change_c {
    type: number
    sql: ${TABLE}.ValueChange_c ;;
  }

  measure: count {
    type: count
    drill_fields: [opp_name, account_name]
  }
}
