#!/usr/bin/env ruby

exit_word = ['quit', 'q', 'exit']
except_word = [".","..",".gitkeep"]

puts "========== Your logs ========="

logs_path = File.expand_path("../../mylogs",__FILE__)

Dir.open(logs_path) do |dir|
  dir.each do |f|
    if !except_word.include?(f)
      puts f
    end
  end
end
puts "=============================="


puts "choose a log to view!"
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
