function moves_universal_to_marker!(r::Robot, side::HorizonSide, num_steps::Int)
    det = 1
    stepsDone = 0
    while det != 0 && stepsDone < num_steps
        if ismarker(r) == true
           return 
        end
        isStepDone = move_if_possible!(r, side)
        if isStepDone == false
            det = evade_border!(r, side)
            stepsDone += det
        else
            stepsDone += 1
        end
    end
end

function move_snake_to_find_marker!(r::Robot)
    num_steps = 1
    while ismarker(r) == false
        for side_of_movement in (Nord, Ost, Sud, West)
            moves_universal_to_marker!(r, side_of_movement, num_steps)
            if side_of_movement == Ost || side_of_movement == West
                num_steps += 1
            end
        end
    end
end
