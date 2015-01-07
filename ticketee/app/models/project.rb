class Project < ActiveRecord::Base
  validates :name, presence: true

  has_many :tickets, dependent: :delete_all
  has_many :roles, dependent: :destroy
end
