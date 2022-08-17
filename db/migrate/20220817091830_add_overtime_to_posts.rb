class AddOvertimeToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :overtime_hours, :decimal, :default => 0.0
  end
end
