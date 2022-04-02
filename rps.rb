require 'io/console'

module Rps

  class << self

    def set(player:, enemy:)
      puts 'じゃんけん...(press g or c or p)'

      loop do
        enemy.sign = ['g', 'c', 'p'].sample
        loop do
          player.sign = STDIN.noecho{gets.chomp}
          break if player.sign == 'g'||player.sign == 'c'||player.sign == 'p'
          print "Press g or c or p.\nじゃんけん...\n"
        end
        print "#{enemy.name}...#{gcp_table(enemy.sign)}\n"
        print "#{player.name}...#{gcp_table(player.sign)}\n"
        result = match(ps: player.sign, cs: enemy.sign)

        if result == 1
          player.win += 1
          enemy.lose += 1
          print "勝ち！\n#{player.win}勝#{player.lose}敗\n\n"
          break
        elsif result == 2
          player.lose += 1
          enemy.win   += 1
          print "負け！\n#{player.win}勝#{player.lose}敗\n\n"
          break
        end

        puts 'あいこで...(press g or c or p)'
      end
    end

    def match(ps:, cs:)
        win  = ((ps=='g')&&(cs=='c'))||((ps=='c')&&(cs=='p'))||((ps=='p')&&(cs=='g'))
        even = ps == cs
        return win ? 1 : (even ? 0 : 2) # 引き分け：0、勝ち：1、負け：2
    end

    def gcp_table(sign)
      case sign
      when 'g'
        'グー'
      when 'c'
        'チョキ'
      when 'p'
        'パー'
      else
        puts 'Press g or c or p. Bye.'
        exit
      end
    end

    def result(player:)
      w_or_l = player.win > player.lose ? '勝ち' : '負け'
      puts "\n\n\n結果\n#{player.win}勝#{player.lose}敗で#{player.name}の#{w_or_l}"
    end

  end
end
