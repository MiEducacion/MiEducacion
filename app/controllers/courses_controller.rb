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
    course = Course.create(course_params)
    course.teacher_ids << current_user.id

    respond_to do |format|
      format.json do
        if course.valid?
          render json: {
            course: course
          }, content_type: "application/json", status: 200
        else
          render json: { errors: course.errors.full_messages },
                 status: :not_acceptable end
      end
    end
  end

  private

  def public_site?
    redirect_to "/login-required", status: 301 unless Settings::General.public || current_user
  end

  def course_params
    params.permit(:name, :private, :teacher_ids)
  end
end
