# frozen_string_literal: true

class DeviseCreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees, id: :uuid do |t|
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :role, default: "user"
      t.string :designation, index: true
      t.boolean :wants_to_go_lunch, index: true
      t.string :name, index: true
      t.string :department, index: true
      t.datetime :remember_created_at
      t.timestamps null: false
    end

    add_index :employees, :email,                unique: true
    add_index :employees, :role
  end
end
