#!/usr/bin/env ruby

exit_word = ['quit', 'q', 'exit']
except_word = [".","..",".gitkeep"]
count = 0

puts "========== Your logs ========="

logs_path = File.expand_path("../../mylogs",__FILE__)

Dir.open(logs_path) do |dir|
  dir.each do |f|
    count += 1
    if !except_word.include?(f)
      puts f
    end
  end

  if count == 3
    puts " Your log does not exist yet. "
    puts "=============================="
    exit
  end
end

puts "=============================="
puts "choose a log to view!"
print ">>"

log_name = gets.chomp

view_log = logs_path+"/"+log_name

if File.exist?(view_log)
  system('open '+ view_log)
elsif exit_word.include?(log_name)
  puts "see you!"
else
  puts "The log does not exist."
  puts ""
  system('viewLogs.rb')
end
