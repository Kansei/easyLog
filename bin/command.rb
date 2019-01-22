require 'fileutils'

class Command
  def write
    exit_word = ['quit', 'q', 'exit']

    File.open(create_log_path, 'a') do |f|
      puts_start
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

  def view(date)
    log_path = File.expand_path("../../history/#{date}.txt",__FILE__)

    if File.exist?(log_path)
      system('vim '+ log_path)
    else
      STDERR.puts "#{date} does not have Hitori Goto."
    end
  end

  def list
    log_path = File.expand_path("../../history", __FILE__)
    logs =  Dir.glob("#{log_path}/*.txt")
    logs.map! do |log|
      log = log.split("#{log_path}/")[-1]
      log.split(".")[0]
    end
    puts logs
  end

  private

  def puts_start
    puts '====== Hitori Goto ======'
  end

  def puts_finish
    puts '========================='
  end

  def create_log_path
    log_path = File.expand_path("../../history/#{Time.now.strftime("%Y%m")}.txt",__FILE__)
    return log_path
  end
end
