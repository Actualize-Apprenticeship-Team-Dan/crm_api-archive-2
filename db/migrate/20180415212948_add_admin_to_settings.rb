class AddAdminToSettings < ActiveRecord::Migration[5.0]
  def change
    add_column :settings, :admin_id, :integer
  end
end
