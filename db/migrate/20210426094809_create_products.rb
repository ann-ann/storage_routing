class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :reference
      t.string :category
      t.float :price

      t.timestamps
    end
  end
end
