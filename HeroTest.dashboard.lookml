# - dashboard: herotest
#   title: Herotest
#   layout: newspaper
#   preferred_viewer: dashboards-next
#   tile_size: 100

#   filters:

#   elements:
#     - name: hello_world
#       type: looker_column
- dashboard: powers_dashboard_suresh
  title: HeroDemo
  layout: newspaper
  preferred_viewer: dashboards-next
  embed_style:
    background_color: "#5094fa"
    show_title: true
    title_color: "#3a4245"
    show_filters_bar: true
    tile_text_color: "#3a4245"
    text_tile_text_color: ''
  elements:
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: <img src="https://intelepeer.com/wp-content/uploads/2021/10/Text@2x.png"
      height="75%" width="75%">
    row: 0
    col: 12
    width: 12
    height: 18
  - name: Which Super Power Do You Have?
    type: text
    title_text: Which Super Power Do You Have?
    subtitle_text: ''
    body_text: ''
    row: 0
    col: 1
    width: 9
    height: 3
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: <img src="https://intelepeer.com/wp-content/uploads/2021/10/Reliability402x.png"
      height="60%" width="40%">
    row: 3
    col: 4
    width: 3
    height: 9
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: <img src="https://intelepeer.com/wp-content/uploads/2021/10/Visibility402x.png"
      height="60%" width="40%">
    row: 12
    col: 5
    width: 5
    height: 6
  - name: " (4)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: <img src="https://intelepeer.com/wp-content/uploads/2021/10/Flexibility402x.png"
      height="60%" width="40%">
    row: 3
    col: 0
    width: 4
    height: 9
  - name: " (5)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: <img src="https://intelepeer.com/wp-content/uploads/2021/10/Scalability402x.png"
      height="60%" width="40%">
    row: 12
    col: 0
    width: 5
    height: 5
  - name: " (6)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: <img src="https://intelepeer.com/wp-content/uploads/2021/10/Speed402x.png"
      height="20%" width="20%">
    row: 3
    col: 7
    width: 5
    height: 9
  - title: Super Power Totals
    name: Super Power Totals
    model: marketing_demo_2021
    explore: demo_data
    type: looker_column
    fields: [picture_reference.url, demo_data.count]
    sorts: [demo_data.count desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    y_axes: [{label: Total Powers, orientation: left, series: [{axisId: demo_data.count,
            id: demo_data.count, name: Demo Data}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_colors: {}
    series_labels: {}
    defaults_version: 1
    hidden_fields: []
    hidden_points_if_no: []
    listen: {}
    row: 26
    col: 0
    width: 24
    height: 9
  - title: Super Power Breakdown Total
    name: Super Power Breakdown Total
    model: marketing_demo_2021
    explore: demo_data
    type: marketplace_viz_cartoon::cartoon_vis
    fields: [demo_data.count, demo_data.result]
    sorts: [demo_data.count desc]
    limit: 500
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    chart_type: Pie
    value_labels: legend
    label_type: labPer
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 0
    series_types: {}
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    show_null_points: true
    interpolation: linear
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    query_fields:
      measures:
      - align: right
        can_filter: true
        category: measure
        default_filter_value:
        description:
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: Demo Data Count
        label_from_parameter:
        label_short: Count
        map_layer:
        name: demo_data.count
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: count
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format:
        view: demo_data
        view_label: Demo Data
        dynamic: false
        week_start_day: monday
        dimension_group:
        error:
        field_group_variant: Count
        measure: true
        parameter: false
        primary_key: false
        project_name: salesops
        scope: demo_data
        suggest_dimension: demo_data.count
        suggest_explore: demo_data
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/salesops/files/views%2Fdemo_data.view.lkml?line=50"
        permanent:
        source_file: views/demo_data.view.lkml
        source_file_path: salesops/views/demo_data.view.lkml
        sql:
        sql_case:
        filters:
        sorted:
          desc: true
          sort_index: 0
      dimensions:
      - align: left
        can_filter: true
        category: dimension
        default_filter_value:
        description:
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: false
        label: Demo Data Result
        label_from_parameter:
        label_short: Result
        map_layer:
        name: demo_data.result
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: string
        user_attribute_filter_types:
        - string
        - advanced_filter_string
        value_format:
        view: demo_data
        view_label: Demo Data
        dynamic: false
        week_start_day: monday
        dimension_group:
        error:
        field_group_variant: Result
        measure: false
        parameter: false
        primary_key: false
        project_name: salesops
        scope: demo_data
        suggest_dimension: demo_data.result
        suggest_explore: demo_data
        suggestable: true
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/salesops/files/views%2Fdemo_data.view.lkml?line=19"
        permanent:
        source_file: views/demo_data.view.lkml
        source_file_path: salesops/views/demo_data.view.lkml
        sql: "${TABLE}.result "
        sql_case:
        filters:
      table_calculations: []
      pivots: []
    listen: {}
    row: 18
    col: 12
    width: 12
    height: 8
  - title: Your Super Power
    name: Your Super Power
    model: marketing_demo_2021
    explore: demo_data
    type: single_value
    fields: [demo_data.time_stamp_time, picture_reference.url]
    sorts: [demo_data.time_stamp_time]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [demo_data.time_stamp_time]
    series_types: {}
    row: 18
    col: 0
    width: 12
    height: 8
