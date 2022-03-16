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

  dimension: winloss_comments {
    type: string
    sql: ${TABLE}.winloss_comments ;;
  }

  dimension: winloss_data {
    type: string
    sql: ${TABLE}.winloss_data ;;
  }


  dimension: closedloss {
    type: number
    sql: ${TABLE}.closedloss ;;
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
  }

  dimension: closedloss_c {
    type: number
    sql: ${TABLE}.closedloss_c ;;
  }

  dimension: closedwon {
    type: number
    sql: ${TABLE}.closedwon ;;
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
  }

  dimension: closedwon_c {
    type: number
    sql: ${TABLE}.closedwon_c ;;
  }

  measure: top_5_new {
    type: yesno
    sql:
    exists(
      select *
      from (
        select ${opp_name}
        from orders
        group by ${opp_name}
        order by sum(${newadd}) desc
        limit 5
      ) top_5
      where ${opp_name} = top_5.opp_name
    ) ;;
  }

  dimension: top_5_lost {
    type: yesno
    sql:
    exists(
      select *
      from (
        select ${opp_name}
        from orders
        group by ${opp_name}
        order by sum(${closedloss}) desc
        limit 5
      ) top_5
      where ${opp_name} = top_5.opp_name
    ) ;;
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
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
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
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
  }

  dimension: lw_active_c {
    type: number
    sql: ${TABLE}.LW_Active_c ;;
  }

  dimension: lw_amount {
    type: number
    sql: ${TABLE}.LW_Amount ;;
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_lw_amount {
    type: sum
    sql: ${lw_amount} ;;
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
  }

  measure: average_lw_amount {
    type: average
    sql: ${lw_amount} ;;
  }

  measure: WoWChangeCount {
    type: sum
    sql: ${tw_active_c}-${lw_active_c} ;;
  }

  dimension: lw_status {
    type: string
    sql: ${TABLE}.LW_Status ;;
  }

  dimension: newadd {
    type: number
    sql: ${TABLE}.newadd ;;
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
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
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
  }

  dimension: removed_c {
    type: number
    sql: ${TABLE}.removed_c ;;
  }

  dimension: rengaged {
    type: number
    sql: ${TABLE}.Rengaged ;;
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
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
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
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
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
  }

  dimension: tw_active_c {
    type: number
    sql: ${TABLE}.TW_Active_c ;;
  }

  dimension: tw_amount {
    type: number
    sql: ${TABLE}.TW_Amount ;;
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
  }

  dimension: tw_status {
    type: string
    sql: ${TABLE}.TW_Status ;;
  }

  dimension: value_change {
    type: number
    sql: ${TABLE}.ValueChange ;;
    value_format: "[<-1000]-$0.00,\"K\";[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
  }

  dimension: value_change_c {
    type: number
    sql: ${TABLE}.ValueChange_c ;;
  }
  parameter: max_rank {
    type: number
  }

  dimension: rank_limit {
    type: number
    sql: {% parameter max_rank %} ;;
  }
  measure: count {
    type: count
    drill_fields: [opp_name, account_name]
  }
}
