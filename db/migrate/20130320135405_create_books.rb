class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.string :yomi
      t.integer :last
      t.string :desc

      t.timestamps
    end
  end
end
