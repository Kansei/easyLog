def view_log(log_name)
  log_path = File.join(File.dirname(__FILE__), "/../logs/#{log_name}.txt")

  if File.exist?(log_path)
    system('vim '+ log_path)
  else
    STDERR.puts "#{log_name} does not exist."
  end
end
