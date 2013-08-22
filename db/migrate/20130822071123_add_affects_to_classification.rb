class AddAffectsToClassification < ActiveRecord::Migration
  def change
	add_column :classifications, :affects, :text
  end
end
