# Define the database connection to be used for this model.
connection: "sales_ops"
include: "/views/*.view.lkml"
include: "/**/*.view.lkml"
# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: salesops_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}




persist_with: salesops_default_datagroup


explore: user {
}


explore: v_booking {}
explore: v_wo_w_analysis {}
explore: v_cpaa_s_adds {}
explore: v_opp_vel {}
explore: opportunityhistory {}
explore: opportunity_load {}
explore: stage_group {}

explore: Funnel_Analytics{
  view_name: opportunity_load
  join: user {
    relationship: many_to_one
    sql_on: ${opportunity_load.owner_id}= ${user.id} ;;
  }
  join: stage_group {
    relationship: many_to_one
    sql_on: ${opportunity_load.stage_name}=${stage_group.stage_name} ;;

  }
  join: account {
    relationship: many_to_one
    sql_on:
    ${opportunity_load.account_id}=${account.id};;

  }



}
explore: account{
  join: Partner {
    relationship: many_to_one
    sql_on: ${account.sales_partner__c}=${Partner.id} ;;
  }
}


















# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Salesops"
