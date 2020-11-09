class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :category_id, null: false 
      t.integer :status_id,   null: false 
      t.integer :burden_id,   null: false 
      t.integer :area_id,     null: false 
      t.integer :date_id,     null: false
      t.integer :price,       null: false
      t.text    :comments,    null: false
      t.string  :name,        null: false
      t.references :user,     null: false , foreign_key: true
      t.timestamps
    end
  end
end
