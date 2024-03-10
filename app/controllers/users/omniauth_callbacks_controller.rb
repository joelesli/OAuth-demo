class Users::OmniauthCallbacksController < Devise::RegistrationsController
    def google
        # You need to implement the method below in your model (e.g. app/models/user.rb)
        omniauth_user_for_service("google", request)
    end

    def facebook
        # You need to implement the method below in your model (e.g. app/models/user.rb)
        omniauth_user_for_service("facebook", request)
    end

    def asana
        # You need to implement the method below in your model (e.g. app/models/user.rb)
        omniauth_user_for_service("asana", request)
    end

    def nhn
        # You need to implement the method below in your model (e.g. app/models/user.rb)
        omniauth_user_for_service("nhn", request)
    end

    def failure
        redirect_to root_path
    end


    private 

    def omniauth_user_for_service(service_name, request)
        @user = User.from_omniauth(request.env["omniauth.auth"])

        if @user.persisted?
            sign_in_and_redirect @user, event: :authentication # this will throw if @user is not activated
            set_flash_message(:notice, :signed_up, kind: service_name.capitalize) if is_navigational_format?
        else
            session["devise.#{service_name.downcase}_data"] = request.env["omniauth.auth"].except(:extra) # Removing extra as it can overflow some session stores
            set_flash_message(:notice, :failed, kind: service_name.capitalize) if is_navigational_format?
            redirect_to new_user_registration_url
        end
    end

end
