# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
puts "Start"
require 'active_record/fixtures'
require 'open-uri'
puts "Make Array method..."
class Array
  def / len
  a = []
  each_with_index do |x,i|
  a << [] if i % len == 0
  a.last << x
  end
  a
  end
end
puts "done"
puts "Deleting Countries and languages"
Country.delete_all
Language.delete_all
Author.delete_all
puts "done"
puts "opening inserts"
open("db/seed_data/paths") do |countries|
  countries.read.each_line do |country|
    n = country.chomp.split("|")
    c = n[0]
    p = n[1]
    
    country = Country.create!(:name => c, :path => p)
    puts "Made country : #{country.name}"
end
end
open("db/seed_data/about") do |lines|
  lines.read.each_line do |line|
    n = line.chomp.split("|")
    c = n[0]
    a = n[1]
    country = Country.find_by_name( c )

    country.update_attributes!(:description => a)

    puts "adding about on : #{country.name}"
end
end
open("db/seed_data/colors") do |lines|
  lines.read.each_line do |line|
    n = line.chomp.split("|")
    c = n[0]
    color = n[1]
    country = Country.find_by_name( c )

    country.update_attributes!(:color => color)

    puts "adding color : #{color } on : #{country.name}"
end
end
open("db/seed_data/languages") do |lines|
  lines.read.each_line do |line|
    n = line.chomp.split("|")
    c = n[0]
    country = Country.find_by_name(c)
    n.delete_at(0)

    langs = n/3
    
    langs.each do |x|
      name = x[0] 
      speakers = x[1]
      comment = x[2]
      language = Language.find_or_create_by_name(:name => name)
      puts "#{country.name} => Find or Create : #{language.name}"
    end 
    
    langs.each do |y|
    name = y[0] 
    speakers = y[1]
    comment = y[2]
    l = Language.find_by_name(name)
    language_in_country = LanguageInCountry.create!(:speakers_in_country => speakers, :comment => comment, :country_id => country.id, :language_id => l.id )
   puts "Made Language_in_country : #{language_in_country.country.name} => #{language_in_country.language.name}"
    end
end
end
open("db/seed_data/author") do |lines|
  lines.read.each_line do |line|
    n = line.chomp.split("|")
    c = n[0]
    country = Country.find_by_name(c)
    n.delete_at(0)
    author_data = n/3

    author_data.each do |y|
    name = y[0]
    life = y[1]
    bio = y[2]

    author = Author.create!(:name => name, :birth_death => life, :bio => bio, :country_id => country.id)
    puts "#{country.name} : #{author.name}   "
    end
end
end
Setting.create!(:instructions => "placeholder", :first_page => "placeholder")
Language.all.each do |l|
  l.common = false 
  l.save
end
User.create!(:name => "Admin", :password => "123456", :is_admin => true, :country_id => 2, :points => 200, :email => "andreas@lizz.no")

puts "Complete"
