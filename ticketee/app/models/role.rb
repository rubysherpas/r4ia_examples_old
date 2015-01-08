class Role < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  def self.available_roles
    ['manager', 'editor', 'viewer']
  end
end
