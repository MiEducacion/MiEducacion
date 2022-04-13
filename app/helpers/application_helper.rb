module ApplicationHelper

    def device
        agent = request.user_agent
        return "tablet" if agent =~ /(tablet|ipad)|(android(?!.*mobile))/i
        return "mobile" if agent =~ /Mobile/
        return "desktop"
      end

      def client_side_app_settings
        site_settings = {
          title: SiteSettings.site_title
        }
      end
end
