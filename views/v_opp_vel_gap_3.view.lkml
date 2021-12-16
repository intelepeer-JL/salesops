# The name of this view in Looker is "V Opp Vel Gap 3"
view: v_opp_vel_gap_3 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `test-and-poc.salesops_sf.v_opp_vel_gap_3`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Amount" in Explore.

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_amount {
    type: sum
    sql: ${amount} ;;
  }

  measure: average_amount {
    type: average
    sql: ${amount} ;;
  }

  dimension: anyskipped {
    type: string
    sql: ${TABLE}.anyskipped ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: close {
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
    sql: ${TABLE}.CloseDate ;;
  }

  dimension_group: closed_opp_end {
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
    sql: ${TABLE}.ClosedOppEnd ;;
  }

  dimension: closed_oppamt {
    type: number
    sql: ${TABLE}.ClosedOppamt ;;
  }

  dimension: closedduration {
    type: number
    sql: ${TABLE}.closedduration ;;
  }

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
    sql: ${TABLE}.CreatedDate ;;
  }

  dimension: curr_stage {
    type: string
    sql: ${TABLE}.CurrStage ;;
  }

  dimension: is_active {
    type: string
    sql: ${TABLE}.IsActive ;;
  }

  dimension: is_lost {
    type: yesno
    sql: ${TABLE}.IsLost ;;
  }

  dimension: is_open {
    type: yesno
    sql: ${TABLE}.IsOpen ;;
  }

  dimension: is_won {
    type: yesno
    sql: ${TABLE}.IsWon ;;
  }

  dimension: isclosed {
    type: yesno
    sql: ${TABLE}.Isclosed ;;
  }

  dimension: noskipstage {
    type: number
    sql: ${TABLE}.noskipstage ;;
  }

  dimension: opp_name {
    type: string
    sql: ${TABLE}.OppName ;;
  }

  dimension: opp_type {
    type: string
    sql: ${TABLE}.OppType ;;
  }

  dimension: opportunityid {
    type: string
    sql: ${TABLE}.opportunityid ;;
  }

  dimension: oppowner {
    type: string
    sql: ${TABLE}.oppowner ;;
  }

  dimension: skip {
    type: string
    sql: ${TABLE}.skip ;;
  }

  dimension: stageduration {
    type: number
    sql: ${TABLE}.stageduration ;;
  }

  dimension: stagegroup {
    type: string
    sql: ${TABLE}.stagegroup ;;
  }

  dimension: stageorder {
    type: number
    sql: ${TABLE}.stageorder ;;
  }

  dimension: stagescompleted {
    type: number
    sql: ${TABLE}.stagescompleted ;;
  }

  dimension_group: start {
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
    sql: ${TABLE}.start ;;
  }

  dimension_group: stgend {
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
    sql: ${TABLE}.stgend ;;
  }

  dimension: team {
    type: string
    sql: ${TABLE}.Team ;;
  }

  dimension: totalstage {
    type: string
    sql: ${TABLE}.totalstage ;;
  }

  measure: count {
    type: count
    drill_fields: [opp_name]
  }
}
