def puts_start
  puts "========== Your logs ========="
end

def puts_end
  puts "=============================="
end

def print_logfile(path)
  except_word = [".","..",".gitkeep"]
  count = 0

  puts_start

  Dir.open(path) do |dir|
    dir.each do |f|
      count += 1
      if !except_word.include?(f)
        puts f
      end
    end

    if count == 3
      puts " Your log does not exist yet. "
      puts_end
      exit
    end
  end
  puts_end
end

def choose_log(path)
  exit_word = ['quit', 'q', 'exit']

  puts "choose a log to view!"
  print ">>"
  log_name = STDIN.gets.chomp

  view_log = path+"/"+log_name

  # ファイルが存在すればそのファイルを開く
  # 終了コマンドが打たれれば終了
  # それ以外の入力をするともう一度入力させる
  if File.exist?(view_log)
    system('open '+ view_log)
  elsif exit_word.include?(log_name)
    puts "see you!"
  else
    puts "The log does not exist."
    puts ""
    choose_log
  end
end

def list_log
  logs_path = File.expand_path("../../mylogs",__FILE__)

  # ログファイルの一覧表示
  print_logfile(logs_path)
  # 開くログファイルの選択
  choose_log(logs_path)
end

def view_today_log
  date = Time.now.strftime("%Y_%m_%d")
  logs_path = File.expand_path("../../mylogs",__FILE__)
  today_log = logs_path+"/"+date+".txt"

  if File.exist?(today_log)
    system('open '+ today_log)
  else
    STDERR.puts "Today's log does not exist yet."
  end
end
