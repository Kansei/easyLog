#!/usr/bin/env ruby

date = Time.now.strftime("%Y_%m_%d")
logs_path = File.expand_path("../../mylogs",__FILE__)
file_name = logs_path + "/" + date + ".txt"

exit_word = ['quit', 'q', 'exit']

puts '==========================='
puts '        start log          '
puts '==========================='

File.open(file_name, "a+") do |f|
  while true do
    print ">>"
    log = gets.chomp

    if exit_word.include?(log) then
      puts '==========================='
      puts '        finish log         '
      puts '==========================='
      break;
    elsif log == ""
    else
      time = "["+Time.now.strftime("%Y:%m:%d:%H:%M")+"] "
      f.puts time+log
    end
  end
end
