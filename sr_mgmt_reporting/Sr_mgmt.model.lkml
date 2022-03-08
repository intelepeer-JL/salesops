connection: "sales_ops"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
include: "/**/*.view.lkml"




explore: v_booking_team_s5 {}
explore: v_booking_v2s5 {}
explore: v_booking_v2s6 {}
explore: v_commit_probable {}
explore: v_committed_probable_summary {}
explore: v_wo_w_analysis {}
explore: v_weekly_add {}

# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
