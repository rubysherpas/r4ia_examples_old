module Admin::BaseHelper
  def roles
    hash = {}
    Role.available_roles.each { |role| hash[role.titleize] = role }
    hash
  end
end
