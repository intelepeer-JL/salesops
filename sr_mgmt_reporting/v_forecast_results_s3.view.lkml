# The name of this view in Looker is "V Forecast Results S3"
view: v_forecast_results_s3 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `test-and-poc.salesops_sf.v_forecast_results_s3`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Add 60" in Explore.



  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.



  dimension: add_60_c {
    type: number
    sql: ${TABLE}.add_60_c ;;
  }

# Grouping Data Start

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

# Grouping Data End



# Rolling 90 data section

  dimension: add_90 {
    type: number
    value_format: "$#,##0"
    sql: ${TABLE}.add_90 ;;
  }

  dimension: add_90_c {
    type: number
    sql: ${TABLE}.add_90_c ;;
  }

  dimension: close_age_90 {
    type: number
    sql: ${TABLE}.close_age_90 ;;
  }

  dimension: closed_90_c {
    type: number
    sql: ${TABLE}.closed_90_c ;;
  }

  dimension: closedval_90 {
    type: number
    value_format: "$#,##0"
    sql: ${TABLE}.closedval_90 ;;
  }

  dimension: lost_90 {
    type: number
    value_format: "$#,##0"
    sql: ${TABLE}.Lost_90 ;;
  }

  dimension: lost_90_c {
    type: number
    sql: ${TABLE}.Lost_90_c ;;
  }

  dimension: lost_age_90 {
    type: number
    sql: ${TABLE}.lost_age_90 ;;
  }

  dimension: won_90 {
    type: number
    value_format: "$#,##0"
    sql: ${TABLE}.Won_90 ;;
  }

  dimension: won_90_c {
    type: number
    sql: ${TABLE}.Won_90_c ;;
  }

  measure: 90winrate {
    type: number
    sql: sum(${won_90})/nullif(sum(${closedval_90}),0) ;;
  }

  measure: 90winratec {
    type: number
    sql: sum(${won_90_c})/nullif(sum(${closed_90_c}),0) ;;
  }

  dimension: won_age_90 {
    type: number
    sql: ${TABLE}.won_age_90 ;;
  }

  measure: 90avgday {
    type: number
    sql: sum(${won_age_90})/nullif(sum(${won_90_c}),0) ;;
  }

  measure: monthly_win {
    type: number
    sql: (sum(${won_90})/${90avgday})*30 ;;
  }



#End of Rolling 90 section
#########################################################################################################################

# Rolling 60 data section


  dimension: close_age_60 {
    type: number
    sql: ${TABLE}.close_age_60 ;;
  }

  dimension: add_60 {
    type: number
    sql: ${TABLE}.add_60 ;;
  }

  dimension: closed_60_c {
    type: number
    sql: ${TABLE}.closed_60_c ;;
  }


  dimension: closedval_60 {
    type: number
    value_format: "$#,##0"
    sql: ${TABLE}.closedval_60 ;;
  }

  dimension: lost_60 {
    type: number
    value_format: "$#,##0"
    sql: ${TABLE}.Lost_60 ;;
  }

  dimension: lost_60_c {
    type: number
    sql: ${TABLE}.Lost_60_c ;;
  }

  dimension: lost_age_60 {
    type: number
    sql: ${TABLE}.lost_age_60 ;;
  }

  dimension: won_60 {
    type: number
    value_format: "$#,##0"
    sql: ${TABLE}.Won_60 ;;
  }

  dimension: won_60_c {
    type: number
    sql: ${TABLE}.Won_60_c ;;
  }

  dimension: won_age_60 {
    type: number
    sql: ${TABLE}.won_age_60 ;;
  }


  measure: total_add_60 {
    type: sum
    value_format: "$#,##0"
    sql: ${add_60} ;;
  }

  measure: average_add_60 {
    type: average
    value_format: "$#,##0"
    sql: ${add_60} ;;
  }


#End of Rolling 60 section
#########################################################################################################################



# Last Month data section

  dimension: lm_created {
    type: number
    value_format: "$#,##0"
    sql: ${TABLE}.LM_Created ;;
  }

  dimension: lm_created_c {
    type: number
    sql: ${TABLE}.LM_Created_c ;;
  }

# Last Month data end
#########################################################################################################################

# This Month data section start

  dimension: tm_active {
    type: number
    value_format: "$#,##0"
    sql: ${TABLE}.TM_Active ;;
  }

  dimension: tm_active_c {
    type: number
    sql: ${TABLE}.TM_Active_c ;;
  }

  dimension: tm_created {
    type: number
    value_format: "$#,##0"
    sql: ${TABLE}.TM_Created ;;
  }

  dimension: tm_created_c {
    type: number
    sql: ${TABLE}.TM_Created_c ;;
  }

  dimension: tm_quota {
    type: number
    value_format: "$#,##0"
    sql: ${TABLE}.TM_Quota ;;
  }


  measure: forecasttm_r {
    type:  number
    sql: sum(${tm_active})*${90winrate} ;;
  }

  measure: forecasttm_c {
    type:  number
    sql: sum(${tm_active})*${90winratec} ;;
  }

  measure: forecast_difftm_r {
    type: number
    sql:if(sum(${tm_quota})-sum(${tm_active})*${90winrate}) < 0 ,0 ,(sum(${tm_quota})-(sum(${tm_active})*${90winrate}))) ;;
    value_format: "$#,##0"
  }

  measure: forecast_difftm_c {
    type: number
    sql:if(sum(${tm_quota})-fore) < 0 ,0 ,(sum(${tm_quota})-sum(${tm_active})*${90winratec})) ;;
    value_format: "$#,##0"
  }



# This Month data end
#########################################################################################################################

# Next Month data section start

  dimension: nm_active {
    type: number
    value_format: "$#,##0"
    sql: ${TABLE}.NM_Active ;;
  }

  dimension: nm_active_c {
    type: number
    sql: ${TABLE}.NM_Active_c ;;
  }

  dimension: nm_quota {
    type: number
    value_format: "$#,##0"
    sql: ${TABLE}.NM_Quota ;;
  }

  measure: forecastnm_r {
    type:  number
    sql: sum(${nm_active})*${90winrate} ;;
  }

  measure: forecastnm_c {
    type:  number
    sql: sum(${nm_active})*${90winratec} ;;
  }

  measure: forecast_diffnm_r {
    type: number
    sql:if(sum(${nm_quota})-sum(${nm_active})*${90winrate}) < 0 ,0 ,(sum(${nm_quota})-sum(${nm_active})*${90winrate})) ;;
    value_format: "$#,##0"
  }

  measure: forecast_diffnm_c {
    type: number
    sql:if(sum(${nm_quota})-sum(${nm_active})*${90winratec}) < 0 ,0 ,(sum(${nm_quota})-sum(${nm_active})*${90winratec})) ;;
    value_format: "$#,##0"
  }



# Next Month data section end
#########################################################################################################################


# This year data section start

  dimension: ty_created {
    type: number
    value_format: "$#,##0"
    sql: ${TABLE}.TY_Created ;;
  }

  dimension: ty_created_c {
    type: number
    sql: ${TABLE}.TY_Created_c ;;
  }

# this year data section end
#########################################################################################################################


# This Q1 section start
  dimension: q1_active {
    type: number
    value_format: "$#,##0"
    sql: ${TABLE}.Q1_Active ;;
  }

  dimension: q1_active_c {
    type: number
    sql: ${TABLE}.Q1_Active_c ;;
  }

  dimension: q1_created {
    type: number
    value_format: "$#,##0"
    sql: ${TABLE}.Q1_Created ;;
  }

  dimension: q1_created_c {
    type: number
    sql: ${TABLE}.Q1_Created_c ;;
  }

  dimension: q1_quota {
    type: number
    value_format: "$#,##0"
    sql: ${TABLE}.Q1_Quota ;;
  }

# Q1 data section end
#########################################################################################################################

# Q2 section start

  dimension: q2_active {
    type: number
    value_format: "$#,##0"
    sql: ${TABLE}.Q2_Active ;;
  }

  dimension: q2_active_c {
    type: number
    sql: ${TABLE}.Q2_Active_c ;;
  }

  dimension: q2_created {
    type: number
    value_format: "$#,##0"
    sql: ${TABLE}.Q2_Created ;;
  }

  dimension: q2_created_c {
    type: number
    sql: ${TABLE}.Q2_Created_c ;;
  }

  dimension: q2_quota {
    type: number
    value_format: "$#,##0"
    sql: ${TABLE}.Q2_Quota ;;
  }

  measure: forecastq2_r {
    type:  number
    sql: sum(${q2_active})*${90winrate} ;;
  }

  measure: forecastq2_c {
    type:  number
    sql: sum(${q2_active})*${90winratec} ;;
  }

  measure: forecast_diffq2_r {
    type: number
    sql:if(sum(${q2_quota}) - (${forecastq2_r})<0,sum(${q2_quota}) - (${forecastq2_r}),0,) ;;
    value_format: "$#,##0"
  }



# Q2 data section end
#########################################################################################################################

# Q3 section start

  dimension: q3_active {
    type: number
    value_format: "$#,##0"
    sql: ${TABLE}.Q3_Active ;;
  }

  dimension: q3_active_c {
    type: number
    sql: ${TABLE}.Q3_Active_c ;;
  }

  dimension: q3_created {
    type: number
    value_format: "$#,##0"
    sql: ${TABLE}.Q3_Created ;;
  }

  dimension: q3_created_c {
    type: number
    sql: ${TABLE}.Q3_Created_c ;;
  }

  dimension: q3_quota {
    type: number
    value_format: "$#,##0"
    sql: ${TABLE}.Q3_Quota ;;
  }

# Q3 data section end
#########################################################################################################################

# Q4 section start

  dimension: q4_active {
    type: number
    value_format: "$#,##0"
    sql: ${TABLE}.Q4_Active ;;
  }

  dimension: q4_active_c {
    type: number
    sql: ${TABLE}.Q4_Active_c ;;
  }

  dimension: q4_created {
    type: number
    value_format: "$#,##0"
    sql: ${TABLE}.Q4_Created ;;
  }

  dimension: q4_created_c {
    type: number
    sql: ${TABLE}.Q4_Created_c ;;
  }

  dimension: q4_quota {
    type: number
    value_format: "$#,##0"
    sql: ${TABLE}.Q4_Quota ;;
  }

# Q4 data section end
#########################################################################################################################




  measure: count {
    type: count
    drill_fields: []
  }
}
