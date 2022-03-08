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
  }

  dimension: cpaa_s {
    type: number
    sql: ${TABLE}.CPaaS ;;
  }

  dimension: cpaa_s2 {
    type: number
    sql: ${TABLE}.CPaaS2 ;;
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
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_mrg_amount {
    type: sum
    sql: ${mrg_amount} ;;
  }

  measure: average_mrg_amount {
    type: average
    sql: ${mrg_amount} ;;
  }

  dimension: mrg_incremental {
    type: number
    sql: ${TABLE}.MRG_Incremental ;;
  }

  dimension: mrpf {
    type: number
    sql: ${TABLE}.MRPF ;;
  }

  dimension: mrpfcount {
    type: number
    sql: ${TABLE}.MRPFCount ;;
  }

  dimension: new_logo {
    type: number
    sql: ${TABLE}.NewLogo ;;
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
  }

  dimension: quota {
    type: number
    sql: ${TABLE}.quota ;;
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
  }

  dimension: upside {
    type: number
    sql: ${TABLE}.Upside ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.UserID ;;
  }

  dimension: voice {
    type: number
    sql: ${TABLE}.Voice ;;
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
