module WorkshopApi
  module V1
    class Users < BaseV1
      namespace :users do
        params do
          requires :user, type: Hash do
            requires :email, type: String, regexp: User::EMAIL_REGEXP
            requires :password, type: String
          end
        end
        post do
          entity = User.new(declared_params[:user])

          if entity.save
            present :token, 'sadsadsadsadas'
            present :entity, entity,
                    with: WorkshopApi::Entities::UserEntity::Me
          else
             error!(entity.errors.messages, 422)
          end
          #binding.pry
        end
        namespace :me do
          get :me do
            # current_user
          end

          params do

          end
          put :me do

          end
        end
      end
    end
  end
end