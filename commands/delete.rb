def delete_log(log_name, setting_log)
  logs_path = File.join(File.dirname(__FILE__), "/../logs/")
  delete_log_path = logs_path+log_name+".txt"
  if setting_log == log_name
    puts "#{log_name} iog is setting now"
    puts "can not delete"
  elsif File.exist?(delete_log_path)
    puts "Are yo sure? [y/n]"
    answer = STDIN.gets.chomp
    if answer == "y"
      File.delete(delete_log_path)
      puts "deleted: #{log_name} log"
    else
      puts "cancel deleting #{log_name} log"
    end
  else
    puts "#{log_name} log does not exist"
  end
end


