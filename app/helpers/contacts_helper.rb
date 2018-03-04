module ContactsHelper

    # The sort_link method takes 2 arguments. The first, column, is the name of the column you wish to sort by. 
    # The next, title is the text based title of the column. This can be anything. If title is nil, the method 
    # will use the actual column name in Title Case. The rest of the code generates the css classes and the 
    # hyperlink. This gets returned to our view, which injects it on the page. 


      def sort_link(column, title = nil)
        title ||= column.titleize
        direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
        icon = sort_direction == "asc" ? "glyphicon glyphicon-chevron-up" : "glyphicon glyphicon-chevron-down"
        icon = column == sort_column ? icon : ""
        link_to "#{title} <span class='#{icon}'></span>".html_safe, {column: column, direction: direction}
      end


end
