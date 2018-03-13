module ApplicationHelper
    # The method below changes the Title dynamically #
    def full_title(page_title = "")
      default_title = "Defence Foces Booking Application"
      if page_title.empty?
          default_title
      else
          "#{page_title} | #{default_title}"
      end
    end
    
    # This method uses the strftime mechanism to change the time format and is referenced in show and index.html.erb #
    
    def time_format(booking_for)
        booking_for.strftime("%A, %d %b %Y %l:%M %p")
    end
end