class RemoveAssetFromTickets < ActiveRecord::Migration
  def change
    remove_column :tickets, :asset, :string
  end
end
