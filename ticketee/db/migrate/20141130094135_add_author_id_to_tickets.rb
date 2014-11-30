class AddAuthorIdToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :author_id, :integer
  end
end
