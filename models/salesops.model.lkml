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






















# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Salesops"
