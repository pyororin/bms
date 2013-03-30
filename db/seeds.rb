# -*- encoding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require "csv"

CSV.foreach('db/books.csv', encoding: "Shift_JIS:UTF-8") do |row|
  Book.create(
    :id => row[0],
    :name => row[1],
    :yomi => row[2],
    :last => row[3],
    :desc => row[4],
    :complete => row[7],
    :user_id => row[8]
  )
end

CSV.foreach('db/users.csv', encoding: "Shift_JIS:UTF-8") do |row|
  User.create(
    :id => row[0],
    :email => row[1],
    :encrypted_password => row[2],
    :sign_in_count => row[6],
    :current_sign_in_at => row[7],
    :last_sign_in_at => row[8],
    :last_sign_in_ip => row[9]
  )
end
