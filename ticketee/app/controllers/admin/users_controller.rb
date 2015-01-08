class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_projects, only: [:new, :create, :edit, :update]

  def index
    @users = User.order(:email)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    build_roles_for(@user)

    if @user.save
      flash[:notice] = "User has been created."
      redirect_to admin_users_path
    else
      flash.now[:alert] = "User has not been created."
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
    end

    ActiveRecord::Base.transaction do
      @user.roles.clear
      build_roles_for(@user)

      if @user.update(user_params)
        flash[:notice] = "User has been updated."
        redirect_to admin_users_path
      else
        flash.now[:alert] = "User has not been updated."
        render "edit"
        raise ActiveRecord::Rollback
      end
    end
  end

  def destroy
    if @user == current_user
      flash[:alert] = "You cannot delete yourself!"
    else
      @user.destroy
      flash[:notice] = "User has been deleted."
    end

    redirect_to admin_users_path
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :admin)
    end

    def set_user
      @user = User.find(params[:id])
    end

    def set_projects
      @projects = Project.all
    end

    def build_roles_for(user)
      role_data = params.fetch(:roles, [])
      role_data.each do |project_id, role_name|
        if role_name.present?
          user.roles.build(project_id: project_id, role: role_name)
        end
      end
    end
end
