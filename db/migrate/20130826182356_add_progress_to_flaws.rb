class AddProgressToFlaws < ActiveRecord::Migration
  def change
	add_column :flaws, :progress, :integer
  end
end
