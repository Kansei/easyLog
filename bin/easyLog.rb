Dir[File.join(File.dirname(__FILE__), '/../commands/*.rb')].each { |file| require(file) }

# create (log) プロジェクトごとにログを作れる
# delete (log) ログを消す
# switch (log) ログを切り替えれる
# list ログの一覧を確認できる
# write ログを書く
# view (log)ログの中身を見れる

def check_argv
  command = $0.split("/")[-1].split(".")[0]
  if ARGV.size > 2
    STDERR.puts "Usage: #{command} w/v/l/s/d/c [log_name]\n"
    exit
  end
end

def read_setfile
  setfile_path = File.join(File.dirname(__FILE__), '/../.set')
  setting_log = File.open(setfile_path, "r") do |file|
      file.read.chomp
    end
end

def is_exist?(log_name)
  if log_name.nil?
    STDERR.puts "Please enter log name"
    exit
  end
end

def main(argv)
  sub_command = argv[0]
  log_name = argv[1]
  setting_log = read_setfile
  case sub_command
  when "w"
    write_log(setting_log)
  when "v"
    log_name ||= setting_log
    view_log(log_name)
  when "s"
    is_exist?(log_name)
    switch_log(log_name)
  when "d"
    is_exist?(log_name)
    delete_log(log_name, setting_log)
  when "c"
    is_exist?(log_name)
    create_log(log_name)
  when "l"
    list_log(setting_log)
  else
    STDERR.puts "command not found"
    STDERR.puts "only w/v/l/s/d/c"
  end
end

check_argv
main(ARGV)

