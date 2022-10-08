# frozen_string_literal: true

class ExceptionsController < ApplicationController
    layout 'exception'

    def not_found
        render text: "not_found", status: 404
    end
end
