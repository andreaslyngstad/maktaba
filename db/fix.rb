require 'open-uri'
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

open("tes") do |countries|
  File.open('tes2', 'w') do |f2|  
  
  
   countries.read.each_line do |country|
  n = country.chomp.split("|")
  c = n[0]
  
  f2.puts "country: " + c   

  
  n.delete_at(0)
  languages = n/3
  languages.each do |x| 
  l1 = x[0] 
  l1u = x[1]
  l1c = x[2]
  f2.puts l1 + ", " + l1u + ", " + l1c
  end  
  
end 

end  
end  