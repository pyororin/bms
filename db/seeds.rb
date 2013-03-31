# -*- encoding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require "csv"

CSV.foreach('db/users.csv', encoding: "Shift_JIS:UTF-8") do |row|
  ActiveRecord::Base.transaction do
    User.delete_all
    Book.delete_all
    @user = User.create!(
      :email => row[1],
      :password => row[13],
      :username => row[13]
    )
    CSV.foreach('db/books.csv', encoding: "Shift_JIS:UTF-8") do |row|
      @book = @user.books.create!(
        :name => row[1],
        :yomi => row[2],
        :last => row[3],
        :desc => row[4],
        :complete => row[7]
      )
    end
  end
end
