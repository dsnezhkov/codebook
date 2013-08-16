class AddFieldsToFlaws < ActiveRecord::Migration
  def change
	add_column :flaws, :affects, :text
	add_column :flaws, :reference, :text
	add_column :flaws, :priority, :integer
  end
end
