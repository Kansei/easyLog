def puts_start
  puts '==========================='
  puts '        start log          '
  puts '==========================='
end

def puts_finish
  puts '==========================='
  puts '        finish log         '
  puts '==========================='
end

def create_filename
  date = Time.now.strftime("%Y_%m_%d")
  logs_path = File.expand_path("../../mylogs",__FILE__)
  file_name = logs_path + "/" + date + ".txt"
  return file_name
end

def write_log

  filename = create_filename

  # 終了コマンド
  exit_word = ['quit', 'q', 'exit']

  puts_start

  File.open(filename, "a") do |f|
    while true do
      # 改行を取り除いたキーボード入力
      print ">>"
      log = STDIN.gets.chomp

      # 終了コマンドが入力されたか確認
      if exit_word.include?(log) then
        puts_finish
        break;
      elsif log == ""
        # 何も打ち込まれなかった場合はファイルに書き込まない
      else
        # ログを打った時間を取得しlogと一緒にファイルに書き込む
        time = "["+Time.now.strftime("%Y:%m:%d:%H:%M")+"] "
        f.puts time+log
      end
    end
  end
end
