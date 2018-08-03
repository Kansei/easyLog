def create_log(log_name)
  logs_path = File.join(File.dirname(__FILE__), "/../logs/")
  create_log_path = logs_path+log_name+".txt"
  if File.exist?(create_log_path)
    puts "#{log_name} log is already exist"
  else
    File.open(create_log_path, "w"){}
    puts "created: #{log_name} log"
  end
end
