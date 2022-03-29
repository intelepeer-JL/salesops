# The name of this view in Looker is "V Booking V2s5"
view: v_booking_v2s5 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `test-and-poc.salesops_sf.v_booking_v2s5`
    ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.ID ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: close_month {
    type: time
    timeframes: [
      raw,
      date,
      month_name,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_year,
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
  # This dimension will be called "Cpaa S" in Explore.

  dimension: Inbound {
    type: number
    sql: ${TABLE}.Inbound ;;
    value_format: "$#,##0"
  }

  dimension: Outbound {
    type: number
    sql: ${TABLE}.Outbound ;;
    value_format: "$#,##0"
  }

  dimension: Inbound_c {
    type: number
    sql: ${TABLE}.Inbound_c ;;
  }

  dimension: Outbound_c {
    type: number
    sql: ${TABLE}.Outbound_c ;;
  }


  dimension: cpaa_s {
    type: number
    sql: ${TABLE}.CPaaS ;;
    value_format: "$#,##0"
  }

  dimension: cpaa_s2 {
    type: number
    sql: ${TABLE}.CPaaS2 ;;
    value_format: "$#,##0"
  }

  dimension: cpaa_s2c {
    type: number
    sql: ${TABLE}.CPaaS2c ;;
  }

  dimension: cpaa_sc {
    type: number
    sql: ${TABLE}.CPaaSc ;;
  }

  dimension_group: month {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      fiscal_quarter,
      quarter_of_year,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.month ;;
  }

  dimension: mrg_amount {
    type: number
    sql: ${TABLE}.MRG_Amount ;;
    value_format: "$#,##0"
  }

  dimension: Role {
    type: string
    sql: ${TABLE}.Role ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_mrg_amount {
    type: sum
    sql: ${mrg_amount} ;;
    value_format: "$#,##0"
  }

  measure: average_mrg_amount {
    type: average
    sql: ${mrg_amount} ;;
    value_format: "$#,##0"
  }

  dimension: mrg_incremental {
    type: number
    sql: ${TABLE}.MRG_Incremental ;;
    value_format: "$#,##0"
  }

  dimension: mrpf {
    type: number
    sql: ${TABLE}.MRPF ;;
    value_format: "$#,##0"
  }

  dimension: mrpfcount {
    type: number
    sql: ${TABLE}.MRPFCount ;;
  }

  dimension: oppowner_id {
    type: string
    sql: ${TABLE}.OppownerId ;;
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

  dimension: roleid {
    type: string
    sql: ${TABLE}.roleid ;;
  }

  dimension: sq_department {
    type: string
    sql: ${TABLE}.SQ_department ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.Rep_status ;;
  }

  dimension: total_booking {
    type: number
    sql: ${TABLE}.total_booking ;;
    value_format: "$#,##0"
  }

  dimension: voice {
    type: number
    sql: ${TABLE}.Voice ;;
    value_format: "$#,##0"
  }

  dimension: voicec {
    type: number
    sql: ${TABLE}.Voicec ;;
  }

  dimension: NewLogo {
    type: number
    sql: ${TABLE}.NewLogo ;;
    value_format: "$#,##0"
  }

  dimension: New_Logoc {
    type: number
    sql: ${TABLE}.New_Logoc ;;
  }

  dimension: Expansion {
    type: number
    sql: ${TABLE}.Expansion ;;
    value_format: "$#,##0"
  }

  dimension: Expansionc {
    type: number
    sql: ${TABLE}.Expansionc ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }

  # added dimenstions and measures that are not from BigQuery

  dimension: Quarter {
    type:  string
    sql: concat(${month_quarter_of_year},"-",${month_year}) ;;
  }

  dimension: closemthgroup {
    type: string
    sql:concat(format_date("%B",${month_date})," ",format_date("%Y",${month_date})) ;;
    order_by_field: close_month_date

  }

  measure: quota_percent {
    type: number
    value_format: "0.00%"
    sql: (sum(${total_booking})/nullif(sum(${quota}),0)) ;;
  }
  measure: avg_v {
    type: number
    sql: sum(${voice})/nullif(sum(${voicec}),0) ;;
    value_format: "$#,##0"
  }

  measure: avg_1_0 {
    type: number
    sql: sum(${cpaa_s})/nullif(sum(${cpaa_sc}),0) ;;
    value_format: "$#,##0"
  }

  measure: avg_2_0 {
    type: number
    sql: sum(${cpaa_s2})/nullif(sum(${cpaa_s2c}),0) ;;
    value_format: "$#,##0"
  }

  measure: avg_MRPF {
    type: number
    sql: sum(${mrpf})/nullif(sum(${mrpfcount}),0) ;;
    value_format: "$#,##0"
  }

  measure: avg_tot {
    type: number
    sql: sum(${total_booking})/nullif((${tot_counts}),0) ;;
    value_format: "$#,##0"
  }

  measure: avg_NL {
    type: number
    sql: sum(${NewLogo})/nullif(sum(${New_Logoc}),0) ;;
    value_format: "$#,##0"
  }

  measure: avg_EXP {
    type: number
    sql: sum(${Expansion})/nullif(sum(${Expansionc}),0) ;;
    value_format: "$#,##0"
  }

  measure: avg_IB {
    type: number
    sql: sum(${Inbound})/nullif(sum(${Inbound_c}),0) ;;
    value_format: "$#,##0"
  }

  measure: avg_OB {
    type: number
    sql: sum(${Outbound})/nullif(sum(${Outbound_c}),0) ;;
    value_format: "$#,##0"
  }

  measure: tot_counts {
    type: number
    sql: sum(ifnull(${voicec},0)+ifnull(${cpaa_sc},0)+ifnull(${cpaa_s2c},0)) ;;
  }

  measure: PercentIncr {
    type: number
    sql: sum(${mrg_incremental})/nullif(sum(${total_booking}),0) ;;
  }




}
