class Player
    attr_accessor(:name, :lives, :correct_answers)

    def initialize(id, lives=3)
        @name = name
        @lives = lives
        @correct_answers = 0
    end
    
    # gets 1 point for correct answer
    def score_point
        @correct_answers += 1
    end

    # lose 1 life for incorrect answer
    def lose_life
        @lives -= 1
    end
end