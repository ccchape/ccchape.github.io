require_relative 'ratings.rb'
require_relative 'sheet.rb'
require 'liquid'

CURRENT_YEAR = 2018

# pp values

users = values.collect do |value|
  _, name, year, handle, inst, telegram, email = value
  user = User.new name, year.to_i, handle, inst, telegram, email

  user.load_data!

  user
end

users.sort_by! { |u| u.rating }
users.reverse!

#senior = users.select { |u| u.year < CURRENT_YEAR }
senior = users
junior = users.select { |u| u.year >= CURRENT_YEAR }
prodigio = users.select { |u| u.year > CURRENT_YEAR }


def print_table(users)
  s = ["| Nome | Handle do Codeforces | Rating do Codeforces |"]
  s.append "| ------------- |-------------| ------------:|"

  users.each do |u|
    s.append "| %s | %s | %s |" % [u.name, u.handle, u.rating ]
  end

  if users.empty?
    s.append "| | | |"
  end

  s.join "\n"
end

open("senior_table.md", "w") { |f| f.puts print_table senior }
open("junior_table.md", "w") { |f| f.puts print_table junior }
open("prodigio_table.md", "w") { |f| f.puts print_table prodigio }
