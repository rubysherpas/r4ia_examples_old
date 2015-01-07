class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.references :user, index: true
      t.string :role
      t.references :project, index: true

      t.timestamps null: false
    end
    add_foreign_key :roles, :users
    add_foreign_key :roles, :projects
  end
end
