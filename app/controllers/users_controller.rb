class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  # Use Knock to make sure the current_user is authenticated before completing request.
  #before_action :authorize_as_admin,  only: [:index, :destroy]
  before_action :authenticate_user,   only: [:update, :update_password, :current]
  before_action :authorize,           only: [:update]

  # Should work if the current_user is authenticated.
  # GET /users
  def index
    raise NotImplementedError

    @users = User.all
    json_response(@users)
  end

  # Call this method to check if the user is logged-in.
  # If the user is logged-in we will return the user's information.
  def current
    current_user.update!(:last_login => Time.now)
    json_response(current_user)
  end

  # Method to create a new user using the safe params we setup.
  # POST /users
  def create
    @user = User.create!(user_params)
    json_response(@user, :created)
  end

  def update_password
    if (current_password_is_correct(user_params[:actual_password]))
      current_user.update!(:password => user_params[:new_password], :password_confirmation => user_params[:password_confirmation])
      json_response(current_user)
    else
      raise "Senha atual não confere"
    end
  end

  # Method to update a specific user. User will need to be authorized.
  # TODO: Atualizacao do profile
=begin
  def update
    user = User.find(params[:id])
    if (user.update(:name => user_params[:name]))
      render json: {status: 200, message: 'Usuário atualizado com sucesso'}
    end
  end
=end

  def destroy
    raise NotImplementedError

    user = User.find(params[:id])
    if user.destroy
      render json: {status: 200, message: 'Usuário excluído com sucesso'}
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :email, :password, :password_confirmation, :actual_password, :new_password)
  end

  # Adding a method to check if current_user can update itself.
  # This uses our UserModel method.
  def authorize
    return_unauthorized unless current_user && current_user.can_modify_user?(params[:id])
  end

  def current_password_is_correct(new_password)
    return current_user.authenticate(new_password)
  end

end
