# frozen_string_literal: true

class CoursesController < ApplicationController
  layout "application"
  require "action_view"
  include ActionView::Helpers::DateHelper

  before_action :public_site?

  def index
    @courses = Course.all
    respond_to do |format|
      format.html
      format.json do
        render json: {
          courses: @courses

        },
               content_type: "application/json"
      end
    end
  end

  def course
    @course = Course.find(params[:id])

    respond_to do |format|
      format.html
      format.json do
        render json: {
          course: @course

        },
               content_type: "application/json"
      end
    end
  end

  def new_course
    @course = Course.new({
                           name: params[:name],
                           teachers: params[:teachers],
                           private: params[:private]
                         })

    @course.save

    respond_to do |format|
      format.json do
        render json: {
          course: @course
        }, content_type: "application/json", status: 200
      end
    end
  end

  private

  def public_site?
    redirect_to "/login_required", status: 301 unless !Settings::LMS.private || current_user
  end
end
