#! /usr/bin/env ruby

load_path=File.expand_path("../",__FILE__)

require "#{load_path}/bin/command.rb"

def check_argv
  file = $0.split("/")[-1]
  com = file.split(".")[0]
  if ARGV.size != 1
    STDERR.print "Usage: #{com} w/v/l (write or view, list)\n"
    exit
  end
end

def main(argv)
  com = Command.new
  command = argv[0]
  date = argv[1]

  case command
  when "w"
    com.write
  when "v"
    date ||= Time.now.strftime("%Y%m")
    com.view(date)
  when "l"
    com.list
  else
    STDERR.puts "command not found"
    STDERR.puts "only w/v/l"
  end
end

check_argv
main(ARGV)
