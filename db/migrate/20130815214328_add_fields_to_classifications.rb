class AddFieldsToClassifications < ActiveRecord::Migration
  def change
	add_column :classifications, :reference, :text
  end
end
