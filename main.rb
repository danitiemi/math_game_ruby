require './player'
require './question'

@repl_bool = true

puts ''
puts "Do you like math??? So... let's play!"
puts ''

print "Player 1 name: "
@player_name = gets.chomp
p1 = Player.new(@player_name)
p1.name = p1.name

print "Player 2 name: "
@player_name = gets.chomp
p2 = Player.new(@player_name)
p2.name = p2.name

puts ''
puts "Are you ready for it?"
puts ''

@player_turn = 0

while @repl_bool
    question = Question.new

    puts "---- NEW TURN ----"

    case @player_turn
        when 0
            print "#{p1.name}: "
        else 
            print "#{p2.name}: "
    end

    print question.question_display
    puts ''
    print '> '

    @player_answer = gets.chomp.to_i

    if @player_turn == 0 && question.answer_correct?(@player_answer)
        puts 'Yes! You are correct.'
        p1.score_point
        @player_turn += 1

    elsif @player_turn == 0 && !question.answer_correct?(@player_answer)
        puts 'Seriously? No!'
        p1.lose_life
        @player_turn += 1

    elsif @player_turn == 1 && question.answer_correct?(@player_answer)
        puts 'Yes! You are correct.'
        p2.score_point
        @player_turn -= 1
        
    elsif @player_turn == 1 && !question.answer_correct?(@player_answer)
        puts 'Seriously? No!'
        p2.lose_life
        @player_turn -= 1
    
    end

    puts "#{p1.name}: #{p1.lives}/3 vs #{p2.name}: #{p2.lives}/3"
    puts ''

    if p1.lives < 1 || p2.lives < 1
        puts "---- GAME OVER ----"

        if p1.lives < 1
            puts "#{p2.name} wins with a score of #{p2.lives}/3!"

        elsif p2.lives < 1
            puts "#{p1.name} wins with a score of #{p1.lives}/3"

        end

        puts ''
        puts 'Good Bye!'
        puts ''

        @repl_bool = false
    end

end


