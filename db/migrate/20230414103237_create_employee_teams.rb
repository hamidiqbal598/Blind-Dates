class CreateEmployeeTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :employee_teams, id: :uuid do |t|
      t.references :employee, null: false, foreign_key: true, type: :uuid
      t.references :team, null: false, foreign_key: true, type: :uuid
      t.index [:employee_id, :team_id]
      t.index [:team_id, :employee_id]
      t.timestamps
    end

  end
end
