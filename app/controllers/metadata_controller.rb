# frozen_string_literal: true

class MetadataController < ApplicationController
  layout false

  def webmanifest
    expires_in 1.minutes
    render json: default_webmanifest.to_json, content_type: 'application/manifest+json'
  end

  private

  def default_webmanifest
    display = 'standalone'
    {
      name: SiteSettings.site_title,
      short_name: SiteSettings.pwa_shortname,
      display: display,
      start_url: '/',
      background_color: '#FFF',
      theme_color: '#4527a0',
      icons: [
        {
          src: SiteSettings.app_icon,
          sizes: '512x512',
          type: 'image/png',
          purpose: 'maskable'
        }
      ]
    }
  end
end
