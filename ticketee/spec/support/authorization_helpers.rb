module AuthorizationHelpers
  def assign_role!(user, role, project)
    Role.create!(user: user, role: role, project: project)
  end
end

RSpec.configure do |c|
  c.include AuthorizationHelpers
end
