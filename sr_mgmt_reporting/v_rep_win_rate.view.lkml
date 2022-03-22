# The name of this view in Looker is "V Rep Win Rate"
view: v_rep_win_rate {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `test-and-poc.salesops_sf.v_rep_win_rate`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Department" in Explore.

  dimension: department {
    type: string
    sql: ${TABLE}.Department ;;
  }

  dimension: opp_owner {
    type: string
    sql: ${TABLE}.OppOwner ;;
  }

  dimension: owner_id {
    type: string
    sql: ${TABLE}.OwnerId ;;
  }

  dimension: role {
    type: string
    sql: ${TABLE}.Role ;;
  }

  dimension: totalval {
    type: number
    sql: ${TABLE}.totalval ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_totalval {
    type: sum
    sql: ${totalval} ;;
  }

  measure: average_totalval {
    type: average
    sql: ${totalval} ;;
  }

  dimension: win90 {
    type: number
    sql: ${TABLE}.win90 ;;
  }

  dimension: won {
    type: number
    sql: ${TABLE}.Won ;;
  }

  dimension: won90 {
    type: number
    sql: ${TABLE}.won90 ;;
  }

  dimension: yearwin {
    type: number
    sql: ${TABLE}.yearwin ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
