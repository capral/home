#Заполнить массив числами от 10 до 100 с шагом 5
r = (10..100.to_i)
#arr = r.to_a.
#arr.keep_if { |a| a % 5 == 0 } 
arr = 10.step(100,5).to_a
puts "#{arr}"
