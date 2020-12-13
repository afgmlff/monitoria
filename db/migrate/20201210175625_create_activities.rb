# frozen_string_literal: true

class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.belongs_to :user, foreign_key: true
      t.string :subject
      t.datetime :start_date
      t.datetime :end_date
      t.string :status

      t.timestamps
    end
  end
end
