# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: v_booking_v2s3 {
  hidden: no

  join: v_booking_v2s3__term {
    view_label: "V Booking V2s3: Term"
    sql: LEFT JOIN UNNEST(${v_booking_v2s3.term}) as v_booking_v2s3__term ;;
    relationship: one_to_many
  }

  join: v_booking_v2s3__mugterm {
    view_label: "V Booking V2s3: Mugterm"
    sql: LEFT JOIN UNNEST(${v_booking_v2s3.mugterm}) as v_booking_v2s3__mugterm ;;
    relationship: one_to_many
  }

  join: v_booking_v2s3__contract_term {
    view_label: "V Booking V2s3: Contractterm"
    sql: LEFT JOIN UNNEST(${v_booking_v2s3.contract_term}) as v_booking_v2s3__contract_term ;;
    relationship: one_to_many
  }

  join: v_booking_v2s3__term2 {
    view_label: "V Booking V2s3: Term2"
    sql: LEFT JOIN UNNEST(${v_booking_v2s3.term2}) as v_booking_v2s3__term2 ;;
    relationship: one_to_many
  }





}

# The name of this view in Looker is "V Booking V2s3"
view: v_booking_v2s3 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `salesops_sf.v_booking_v2s3`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Accnt Link" in Explore.

  dimension: Type_Of_Sale {
    type: string
    sql: ${TABLE}.Type_Of_Sale ;;
  }

  dimension: accnt_link {
    type: string
    sql: ${TABLE}.accnt_link ;;
  }

  dimension: SAP_ID {
    type: string
    sql: ${TABLE}.SAP_ID__c ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}.AccountId ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}.AccountName ;;
  }

  dimension: account_owner {
    type: string
    sql: ${TABLE}.AccountOwner ;;
  }

  dimension: account_owner_id {
    type: string
    sql: ${TABLE}.AccountOwnerId ;;
  }

  dimension: arr {
    type: number
    sql: ${TABLE}.ARR ;;

  }

  dimension: closemthgroup {
    type: string
    sql:concat(format_date("%B",${close_date})," ",format_date("%Y",${close_date})) ;;
    order_by_field: close_month

  }

  dimension: Quarter {
    type:  string
    sql: concat(${close_quarter},"-",${close_year}) ;;
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

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: contract_term {
    hidden: yes
    sql: ${TABLE}.ContractTerm ;;
  }

  dimension: opp_term {
    hidden: yes
    sql: ${TABLE}.Opp_Term ;;
  }

  dimension: cpaa_s_opp_type {
    type: string
    sql: ${TABLE}.CPaaS_Opp_Type ;;
  }

  dimension: IB_OB {
    type: string
    sql: ${TABLE}.IB_OB ;;
  }

  dimension: cpaa_sbuild {
    type: string
    sql: ${TABLE}.CPaaSbuild ;;
  }

  dimension: cpaas_products__c {
    type: string
    sql: ${TABLE}.CPAAS_Products__c ;;
  }

  dimension: dept {
    type: string
    sql: ${TABLE}.Dept ;;
  }

  dimension: expected_mrg_arg_amount__c {
    type: string
    sql: ${TABLE}.Expected_MRG_ARG_Amount__c ;;
  }

  dimension: mrg_amount {
    type: number
    sql: ${TABLE}.MRG_Amount ;;
  }

  dimension: mrg_amount_converted__c {
    type: number
    sql: ${TABLE}.MRG_Amount_Converted__c ;;
  }

  dimension: mrg_incremental {
    type: number
    sql: ${TABLE}.MRG_Incremental ;;
  }

  dimension: mrpf {
    type: number
    sql: ${TABLE}.MRPF ;;
  }

  dimension: mrr {
    type: number
    sql: ${TABLE}.MRR ;;
  }

  dimension_group: mug_aug_amount_last_updated__c {
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
    sql: ${TABLE}.MUG_AUG_Amount_Last_Updated__c ;;
  }

  dimension: mugterm {
    hidden: yes
    sql: ${TABLE}.MUGTerm ;;
  }

  dimension: net_mug_aug_change__c {
    type: number
    sql: ${TABLE}.Net_MUG_AUG_Change__c ;;
  }

  dimension: new_logo {
    type: number
    sql: ${TABLE}.New_Logo ;;
  }

  dimension: opp_filter {
    type: yesno
    sql: ${TABLE}.OppFilter ;;
  }

  dimension: opp_id {
    type: string
    sql: ${TABLE}.OppId ;;
  }

  dimension: opp_link {
    type: string
    sql: ${TABLE}.opp_link ;;
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
    sql: ${TABLE}.OppOwnerId ;;
  }

  dimension: opp_type {
    type: string
    sql: ${TABLE}.Opp_type ;;
  }

  dimension: product {
    type: string
    sql: ${TABLE}.Product ;;
  }

  dimension: sales_partner {
    type: string
    sql: ${TABLE}.Sales_Partner ;;
  }

  dimension: stage_group {
    type: string
    sql: ${TABLE}.StageGroup ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.Status ;;
  }

  dimension: sub_agent {
    type: string
    sql: ${TABLE}.Sub_Agent ;;
  }

  dimension: term {
    hidden: yes
    type: number
    sql: ${TABLE}.term ;;
  }

  dimension: term2 {
    hidden: yes
    type: number
    sql: ${TABLE}.term2 ;;
  }

  dimension: total_cpaa_s_mrc__c {
    type: number
    sql: ${TABLE}.Total_CPaaS_MRC__c ;;
  }

  dimension: upsell_cross {
    type: number
    sql: ${TABLE}.UpsellCross ;;
  }

  dimension: value_filter {
    type: yesno
    sql: ${TABLE}.Value_Filter ;;
  }

  measure: count {
    type: count
    drill_fields: [opp_name, account_name]
  }
}

# The name of this view in Looker is "V Booking V2s3 Term"
view: v_booking_v2s3__term {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "V Booking V2s3 Term" in Explore.

  dimension: v_booking_v2s3__term {
    type: number
    sql: v_booking_v2s3__term ;;
  }
}

# The name of this view in Looker is "V Booking V2s3 Mugterm"
view: v_booking_v2s3__mugterm {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "V Booking V2s3 Mugterm" in Explore.

  dimension: v_booking_v2s3__mugterm {
    type: string
    sql: v_booking_v2s3__mugterm ;;
  }
}

# The name of this view in Looker is "V Booking V2s3 Contract Term"
view: v_booking_v2s3__contract_term {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "V Booking V2s3 Contract Term" in Explore.

  dimension: v_booking_v2s3__contract_term {
    type: string
    sql: v_booking_v2s3__contract_term ;;
  }


}


# The name of this view in Looker is "V Booking V2s3 Opp Term"
view: v_booking_v2s3__opp_term {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "V Booking V2s3 Opp Term" in Explore.

  dimension: v_booking_v2s3__opp_term {
    type: string
    sql: v_booking_v2s3__opp_term ;;
  }


}


# The name of this view in Looker is "V Booking V2s3 Term2"
view: v_booking_v2s3__term2 {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "V Booking V2s3 Term2" in Explore.

  dimension: v_booking_v2s3__term2 {
    type: number
    sql: v_booking_v2s3__term2 ;;
  }
}
