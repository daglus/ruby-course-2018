module WorkshopApi
  module V1
    class Auth < BaseV1
      namespace :auth do
        params do
          requires :email, type: String, regexp: User::EMAIL_REGEXP
          requires :password, type: String
        end
        post do
          entity = User.authenticate(declared_params[:email], declared_params[:password])

          if entity.present?
            payload = { user_id: entity.id }
            token = JWT.encode payload, Rails.application.secrets.secret_key_base, 'HS256'

            present :token, token
            present :entity, entity, with: WorkshopApi::Entities::UserEntity::Me
          else
            unauthorized!
          end
        end
      end
    end
  end
end