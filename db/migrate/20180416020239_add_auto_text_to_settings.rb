class AddAutoTextToSettings < ActiveRecord::Migration[5.0]
  def change
    add_column :settings, :auto_text, :string
  end
end
