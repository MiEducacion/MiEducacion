class CoursesController < ApplicationController
  layout 'mieducacion_web'
  require 'action_view'
  include ActionView::Helpers::DateHelper


  def index

  @courses = Course.all

  respond_to do |format| 
          format.html
          format.json {         
              render json: {
              courses: @courses
              
          },
          content_type: 'application/json' }
  end 
  end
end