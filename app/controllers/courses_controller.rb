class CoursesController < ApplicationController
  layout 'application'
  require 'action_view'
  include ActionView::Helpers::DateHelper

  before_action :public_site?

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


def getCourse

  @course = Course.find(params[:id])

  respond_to do |format| 
          format.html
          format.json {         
              render json: {
              course: @course
              
          },
          content_type: 'application/json' }
  end 
end




  def newCourse

    @course = Course.new({
      :name => params[:name],
      :teachers => params[:teachers],
      :private => params[:private]
    })
    
    @course.save
  
    respond_to do |format| 
            format.json {         
                render json: {
                  course: @course
                  }, content_type: 'application/json', status: 200 }
          
    end 

end

private
   
def public_site?
     redirect_to "/login_required", status: 301 unless SiteSettings.public_site || current_user
end

end