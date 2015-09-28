# encoding utf-8
#Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).

arr = ['а','е','и','о','y','ы','э','ю','я']
hash = {} 
i = 0
('а'..'я').each do |letter| 
	i = i + 1
	hash[letter] = i if arr.include? letter
end

hash['ё'] = 3

puts hash


