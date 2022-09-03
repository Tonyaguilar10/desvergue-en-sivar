class ChangeNameToText < ActiveRecord::Migration[6.1]
  def change
    rename_column :challenges, :name, :text
  end
end
