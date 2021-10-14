# The name of this view in Looker is "Picture Reference"
view: picture_reference {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `test-and-poc.marketing_demo_2021.PictureReference`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Image Jpg" in Explore.

  dimension: image_jpg {
    type: string
    sql: ${TABLE}.ImageJpg ;;
  }

  dimension: image_png {
    type: string
    sql: ${TABLE}.ImagePng ;;
  }

  dimension: power_key {
    type: string
    sql: ${TABLE}.PowerKey ;;
  }

  dimension: row_num {
    type: number
    sql: ${TABLE}.RowNum ;;
  }

  # dimension: looker_image {
  #   type: string
  #   sql: ${TABLE}.homepage_url;;
  #   html: <img src="https://intelepeer.com/wp-content/uploads/2021/10/Flexibility-100.jpg/{{value}}" /> ;;
  # }

  # A measure is a field that uses a SQL aggregate function. Here are count, sum, and average
  # measures for numeric dimensions, but you can also add measures of many different types.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: count {
    type: count
    drill_fields: []
  }

  # These sum and average measures are hidden by default.
  # If you want them to show up in your explore, remove hidden: yes.

  measure: total_row_num {
    type: sum
    hidden: yes
    sql: ${row_num} ;;
  }

  measure: average_row_num {
    type: average
    hidden: yes
    sql: ${row_num} ;;
  }
}
