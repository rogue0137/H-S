class UserPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end

  def index?
    @current_user.superadmin?
  end

  def show?
    @current_user.superadmin? or @current_user == @user
  end

  def update?
    @current_user.superadmin?
  end

  def destroy?
    return false if @current_user == @user
    @current_user.superadmin?
  end

  def permitted_attributes
    if @current_user.superadmin?
      [:role]
    else
      [:name, :email]
    end
  end

end