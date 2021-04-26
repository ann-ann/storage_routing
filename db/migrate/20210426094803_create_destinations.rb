class CreateDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :destinations do |t|
      t.string :names
      t.string :references
      t.string :categories
      t.float :prices

      t.timestamps
    end
  end
end
