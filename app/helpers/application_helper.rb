module ApplicationHelper
    def alert_for(flash_type)
        { success: 'alert-success text-center',
          error: 'alert-danger text-center',
          alert: 'alert-warning text-center',
          notice: 'alert-info text-center', 
          info: 'alert-info text-center'
        }[flash_type.to_sym] || flash_type.to_s
      end

      def mobile_device
        agent = request.user_agent
        return "tablet" if agent =~ /(tablet|ipad)|(android(?!.*mobile))/i
        return "mobile" if agent =~ /Mobile/
        return "desktop"
      end
end
