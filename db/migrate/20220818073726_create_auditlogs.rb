class CreateAuditlogs < ActiveRecord::Migration[7.0]
  def change
    create_table :auditlogs do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :status, default: 0
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
