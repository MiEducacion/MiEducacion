# frozen_string_literal: true

class ServerController < ApplicationController
  layout false
  include ActionView::Helpers::DateHelper

  def status
    render json: server_status.to_json, content_type: "application/json"
  end

  private

  def server_status
    {
      booted_at: MiEducacion::BOOTED_AT.to_s,
      uptime: time_ago_in_words(MiEducacion::BOOTED_AT)
    }
  end
end
