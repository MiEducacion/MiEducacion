class WizardController < ApplicationController
    include Wicked::Wizard

    layout "wizard"

    before_action :authenticate_user! 
    before_action :is_admin?
  
    steps :welcome, :confirm_profile, :find_friends
  
    def show
        @SiteSettings = "a"
      case step
      when :find_friends
        @friends = @user.find_friends
      end
      render_wizard
    end

    def update
        @SiteSettings = "a"
        case step
        when :confirm_password
          @user.update(user_params)
        end
        sign_in(@user, bypass: true) # needed for devise
        render_wizard @user
      end

    private
   
   def is_admin?
     unless current_user.has_role?(:admin)
        redirect_to "/not_found", status: 301
       
     end
   end

  end