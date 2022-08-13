class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.date :date
      t.text :rationale
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
