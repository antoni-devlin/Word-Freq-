system "clear"
puts "Welcome to Word[Freq]!"
puts "Written by Antoni Devlin"
puts "@devils_inn"
puts
puts "--Contents of 'texts' directory--"
puts
system "ls texts"
puts
puts
print "Pleases enter the path of the file you wish to analyse: "
print "e.g: two_cities.txt"
input_file_name = gets.chomp
input_file = File.open("texts/#{input_file_name}", "r")

print "Please enter the path of the file you wish to write results to: "
print "e.g: results.txt; word_frequency .csv"
output_file_name = gets.chomp
output_file = File.open("results/#{output_file_name}", "w")

# print "How would you like to output?"
# puts "(T)ext or (C)sv?"
# file_ext = gets.chomp
# file_ext = file_ext.downcase

# if file_ext == "t" || file_ext == "text" || file_ext == "txt" || file_ext == ".txt"
# 	output_file_name = "#{output_file_name}.txt"
# 	puts output_file_name
# elsif file_ext == "c"||file_ext == "csv"||file_ext == ".csv"
# 	output_file_name = "#{output_file_name}.csv"
# else
# 	puts "File_ext error."
# 	exit
# end



# print file_ext
#
# exit

frequency = Hash.new(0)


input_file.read.downcase.scan(/\b[a-zA-Z]{2,16}\b/) {|word| frequency[word] = frequency[word] + 1}

frequency.keys.sort.each{|key| output_file.print key, ",", frequency[key], "\n"}
puts
puts
puts "Success!"
puts "Results have been saved in #{output_file_name}!"
puts
exit
