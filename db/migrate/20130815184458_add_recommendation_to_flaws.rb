class AddRecommendationToFlaws < ActiveRecord::Migration
  def change
	add_column :flaws, :recommendation, :text
  end
end
