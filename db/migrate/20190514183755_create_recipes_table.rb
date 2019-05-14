class CreateRecipesTable < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name, null: false
      t.string :ingredients, null: false
      t.integer :cook_time
      t.timestamps
    end
  end
end
