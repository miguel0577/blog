# frozen_string_literal: true

# class to establish the article owner
class AddOwnerToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :owner, :integer
  end
end
