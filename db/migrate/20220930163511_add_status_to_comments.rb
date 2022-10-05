# frozen_string_literal: true

# class to establish comments status
class AddStatusToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :status, :string
  end
end
