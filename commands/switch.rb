def switch_log(log_name)
  logs_path = File.join(File.dirname(__FILE__), "/../logs/")
  switch_log_path = logs_path+log_name+".txt"

  if File.exist?(switch_log_path)
    setfile_path = File.join(File.dirname(__FILE__), '/../.set')
    File.open(setfile_path, "w") do |file|
      file.print log_name
    end
    puts "switched: #{log_name} log"
  else
    puts "#{log_name} log does not exist"
  end
end
