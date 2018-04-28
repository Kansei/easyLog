load_path=File.expand_path("../",__FILE__)

require "#{load_path}/viewLogs"
require "#{load_path}/writeLog"

def check_argv
  file = $0.split("/")[-1]
  com = file.split(".")[0]
  if ARGV.size != 1
    STDERR.print "Usage: #{com} w/v (write or view)\n"
    exit
  end
end

check_argv

com = ARGV[0]

case com
when "w"
  write_log
when "v"
  view_log
else
  STDERR.print "command not found\n"
  STDERR.print "only 'w' or 'v'\n"
  exit
end
