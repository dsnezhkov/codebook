class AddGuidanceToClassifications < ActiveRecord::Migration
  def change
	add_column :classifications, :guidance, :text
  end
end
