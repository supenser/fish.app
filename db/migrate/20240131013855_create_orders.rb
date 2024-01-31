class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer      :reservation_id    , null: false
      t.integer      :fish_recipe_id    , null: false
      t.string       :telephone         , null: false
      t.references   :user , null: false, foreign_key: true
      t.timestamps
    end
  end
end
