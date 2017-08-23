class CreateCsvapis < ActiveRecord::Migration[5.0]
  def change
    create_table :csvapis do |t|
      t.string :filename
      t.string :recordid
      t.string :status
      t.string :fieldto
      t.string :site
      t.string :credentials
      t.string :export
      t.string :object

      t.timestamps
    end
  end
end
