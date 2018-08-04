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

def write_log(setting_log)

  write_log_path = File.expand_path("../../logs/#{setting_log}.txt",__FILE__)

  unless File.exist?(write_log_path)
    exit
  end

  # 終了コマンド
  exit_word = ['quit', 'q', 'exit']

  puts_start

  File.open(write_log_path, "a") do |f|
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
