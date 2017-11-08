class AddFieldnameToCsvapis < ActiveRecord::Migration[5.0]
  def change
    add_column :csvapis, :fieldname, :string
  end
end
