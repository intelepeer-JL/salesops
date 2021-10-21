- dashboard: testing_dashboard_lookml
  title: Testing Dashboard Lookml
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: marketing super powers color testing_Suresh
    name: marketing super powers color testing_Suresh
    model: marketing_demo_2021
    explore: demo_data
    type: looker_column
    fields: [picture_reference.url, demo_data.count]
    pivots: [picture_reference.url]
    sorts: [picture_reference.url]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 659c9337-8353-47ed-ac0f-ffa24f6fd7c3
      palette_id: 5908f3aa-da7a-4cb0-8752-643ed5e5d64d
      options:
        steps: 5
    y_axes: [{label: Total Powers, orientation: left, series: [{axisId: demo_data.count,
            id: demo_data.count, name: Demo Data}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_colors:
      https://intelepeer.com/wp-content/uploads/2021/10/Flexibility402x.png - demo_data.count: "#ff00cc"
      https://intelepeer.com/wp-content/uploads/2021/10/Scalability402x.png - demo_data.count: "#7839f3"
      https://intelepeer.com/wp-content/uploads/2021/10/Reliability402x.png - demo_data.count: "#2b92ff"
      https://intelepeer.com/wp-content/uploads/2021/10/Visibility402x.png - demo_data.count: "#11efe3"
      https://intelepeer.com/wp-content/uploads/2021/10/Speed402x.png - demo_data.count: "#141564"
    series_labels: {}
    #label_color: ["#5980DC", "#717073", "#5BBF21", "#141654", "#FF8700"]
    defaults_version: 1
    hidden_fields: []
    hidden_points_if_no: []
    row:
    col:
    width:
    height:
