class ChangeColumnsOnComment < ActiveRecord::Migration
  def change_table
	rename_column :comment, :body, :description
	rename_column :comment, :commenter, :title
	change_column :comment, :description, :text 
  end
end
