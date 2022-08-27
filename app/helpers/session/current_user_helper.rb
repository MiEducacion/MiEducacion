# frozen_string_literal: true

module Session
  module CurrentUserHelper
    def current_user_dump
      u = current_user

      current_session = {
        id: u.id,
        display_name: u.profile.display_name,
        username: u.profile.username,
        biography: u.profile.biography,
        email: u.email,
        photo: u.gravatar_url,
        is_student: u.student?,
        is_teacher: u.teacher?,
        is_principal: u.principal?,
        is_admin: u.admin?,
        is_new_user: u.new_user,
        trusted: u.trusted?,
        moderator: u.moderator?,
        can_create_course: u.can_create_course?
      }

    end
  end
end
