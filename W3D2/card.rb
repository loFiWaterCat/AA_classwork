class  Card

    attr_reader :value, :revealed 

    def initialize(value)
    @value = value
    @revealed = false
    end

    def hide
    @revealed = false
    end

    def reveal
    @revealed = true
    end
    
    def print
        if @revealed == true
            return @value
        else
            return " "
        end
    end



    def ===(card2)
    return true if @value == card2.value
    end
    
end