def print_logfiles(path, setting_log)
  puts "========== Your logs ========="

  path = (File.join(File.dirname(__FILE__), '/../logs/'))

  dir = Dir.glob(path+"*.txt")
  dir.each do |f|
    log_name = f.split("/")[-1].split(".")[0]
    space = (log_name == setting_log) ? "* " : "  "
    puts space + log_name
  end

  puts "=============================="
end

def list_log(setting_log)
  logs_path = File.join(File.dirname(__FILE__), "/../logs/")
  print_logfiles(logs_path, setting_log)
end
