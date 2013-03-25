class AddCompleteToBook < ActiveRecord::Migration
  def change
    add_column :books, :complete, :boolean, :null => false, :default => false
  end
end
