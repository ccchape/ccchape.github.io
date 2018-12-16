require_relative 'sheet.rb'
require 'open-uri'
require 'json'

class User
  attr_reader :name, :year, :handle, :inst, :telegram, :email
  
  def initialize(name, year, handle, inst, telegram, email)
    @name = name
    @year = year
    @handle = handle
    @inst = inst
    @telegram = telegram
    @email = email
    @ratings = []
  end

  def load_data!
    url = 'https://codeforces.com/api/user.rating?handle=%s' % @handle
    data = open(url) { |f| f.read }
    result = JSON.parse(data)["result"]

    @ratings = result.sort_by { |v| v["contestId"] }.collect { |v| v["newRating"].to_i }
  end

  def rating
      if @ratings.any?
          @ratings.last
      else
          0
      end
  end
end
