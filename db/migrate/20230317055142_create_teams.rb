# frozen_string_literal: true

class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :name, null: false, index: {unique: true}
      t.string :url, null: false, index: {unique: true}

      t.timestamps
    end
  end
end
