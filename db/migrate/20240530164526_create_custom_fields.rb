class CreateCustomFields < ActiveRecord::Migration[7.1]
  def change
    create_table :custom_fields do |t|
      t.string :name, null: false
      t.integer :field_type, null: false
      t.references :tenant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
