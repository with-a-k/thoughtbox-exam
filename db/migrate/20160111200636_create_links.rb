class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.boolean :read, default: false
      t.string :url
      t.string :title

      t.timestamps null: false
    end
  end
end
