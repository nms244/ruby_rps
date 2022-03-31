require_relative 'rps'

class Player
  attr_accessor :name
  attr_accessor :win
  attr_accessor :lose
  attr_accessor :sign

  def initialize(name:)
    @name = name
    @win  = 0
    @lose = 0
  end

end

cpu = Player.new(name: 'CPU')
you = Player.new(name: 'あなた')

loop do
  print '何本勝負？(press 1 or 3 or 5)：'
  @roundNum = gets.chomp.to_i
  puts ''
  break if @roundNum == 1||@roundNum == 3||@roundNum == 5
  puts "Press 1 or 3 or 5.\n"
end

@roundNum.times do |i|
  puts "#{i+1}本目"
  Rps.set(player: you, enemy: cpu)
end

Rps.result(player: you)
