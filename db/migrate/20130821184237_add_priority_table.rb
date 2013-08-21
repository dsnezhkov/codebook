class AddPriorityTable < ActiveRecord::Migration
  def change
	create_table :priorities do |t|
		t.integer :prioritynumber
		t.string :priorityname
	end
  end
end
