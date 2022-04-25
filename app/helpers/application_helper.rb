module ApplicationHelper

    def device
        agent = request.user_agent
        return "tablet" if agent =~ /(tablet|ipad)|(android(?!.*mobile))/i
        return "mobile" if agent =~ /Mobile/
        return "desktop"
      end

      def client_side_app_settings
        site_settings = {
          title: SiteSettings.site_title,
          site_logo: SiteSettings.site_logo,
          public_site: SiteSettings.public_site,
          show_site_banner: SiteSettings.show_site_banner,
          site_banner_content: SiteSettings.site_banner_content
        }
      end
end
