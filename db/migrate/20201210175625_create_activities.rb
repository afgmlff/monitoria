class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.belongs_to :user, foreign_key: true
      t.string :subject
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
