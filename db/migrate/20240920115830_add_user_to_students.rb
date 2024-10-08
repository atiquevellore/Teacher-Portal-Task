# frozen_string_literal: true

class AddUserToStudents < ActiveRecord::Migration[7.1]
  def change
    add_reference :students, :user, null: false, foreign_key: true
  end
end
