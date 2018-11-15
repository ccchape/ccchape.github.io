require_relative 'ratings.rb'
require_relative 'sheet.rb'

pp values

values.each do |value|
  _, name, year, handle, inst, telegram, email = [
    "15/11/2018 16:47:45",
    "Emilio Wuerges",
    "2002",
    "wuerges",
    "UFFS",
    "@wuerges",
    "wuerges@gmail.com"
  ]
  user = User.new name, year.to_i, handle, inst, telegram, email

  user.load_data!

  pp user
end
