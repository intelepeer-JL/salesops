# The name of this view in Looker is "V Q1 Active"
view: v_q1_active {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `test-and-poc.salesops_sf_dev_views.v_Q1_active`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Account Name C" in Explore.

  dimension: account_name__c {
    type: string
    sql: ${TABLE}.AccountName__c ;;
  }

  dimension: arr {
    type: number
    sql: ${TABLE}.ARR ;;
  }

  dimension: OppAge {
    type: number
    sql: ${TABLE}.OppAge ;;
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

  measure: average_Age {
    type: average
    sql: ${OppAge} ;;
  }

  dimension: close_date {
    type: string
    sql: ${TABLE}.CloseDate ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.Department ;;
  }

  dimension: opp_name {
    type: string
    sql: ${TABLE}.OppName ;;
  }

  dimension: opp_owner {
    type: string
    sql: ${TABLE}.OppOwner ;;
  }

  dimension: stage_name {
    type: string
    sql: ${TABLE}.StageName ;;
  }

  measure: count {
    type: count
    drill_fields: [opp_name, stage_name]
  }
}
