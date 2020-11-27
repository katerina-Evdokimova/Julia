interface_line(move!::Function) = begin
    movements!(side) = while move!(side)==true end
    movements!(side, num_steps::Integer) = for _ in 1:num_steps move!(side) end
    movements!(action::Function, side) = while move!(side)==true action() end
    movements!(action!::Function, side, num_steps::Integer) = for _ in 1:num_steps move!(side); action!() end

    function get_num_movements!(side)
        num_steps=0
        while move!(side)==true
            num_steps+=1
        end
        return num_steps
    end

    function get_num_movements!(action::Function, side)
        num_steps=0
        while move!(side)==true
            action()
            num_steps+=1
        end
        return num_steps
    end

    return (;movements!, get_num_movements!)
end
# Julia
