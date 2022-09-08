class CreateGamerooms < ActiveRecord::Migration[6.1]
  def change
    create_table :gamerooms do |t|
      t.integer :password
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
