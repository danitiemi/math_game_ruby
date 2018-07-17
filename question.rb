class Question 
    attr_reader(:correct_answer)

   
    # new question is generated for each turn 
    # by picking two numbers between 1 and 20
    def initialize
        @first_number = rand(1..20)
        @second_number = rand(1..20)
        
     # simple math addition problems
        @correct_answer = @first_number + @second_number
    end
    
    def question_display
        "What does #{@first_number} plus #{@second_number} equal?"
    end

    # must answer correctly or lose a life.
    def answer_correct?(player_answer)
        if player_answer == @correct_answer
            true
        else
            false
        end
    end
end
