class CreateBlindDates < ActiveRecord::Migration[7.0]
  def change
    create_table :blind_dates, id: :uuid do |t|
      t.references :team, null: false, foreign_key: true, type: :uuid
      t.datetime :date
      t.string :restaurant

      t.timestamps
    end
  end
end
