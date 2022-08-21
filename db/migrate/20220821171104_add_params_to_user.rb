class AddParamsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :ssn, :integer
    add_column :users, :company, :string
  end
end
