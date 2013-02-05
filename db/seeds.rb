# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

(Date.new(Date.today.year, 1, 1)..Date.new(Date.today.year, 12, 31)).each do |d|
	Day.create(date: d, day: d.day, month: d.month, year: d.year, cwday: d.cwday, cweek: d.cweek, yday: d.yday)
end
