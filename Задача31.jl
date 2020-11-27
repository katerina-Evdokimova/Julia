#Задача31
function get_num_markers_lab(robot)
    num_steps, side_steps = move_to_start!(robot, (Sud,West))
    num_steps=reverse(num_steps)
    side_steps=reverse(side_steps)
    side = Ost
    num_markers = get_num_markers!(robot, side)
    while is_move_posible!(robot, Nord, side) == true
        move!(robot, Nord)
        movements!(robot,side)
        side = inverse(side)
        num_markers += get_num_markers!(robot, side)
    end
    move_to_start!(robot, (Sud,West))
    for (i,n) in enumerate(num_steps)
        movements!(robot, side_steps[i], n)
    end
    return num_markers
end

function get_num_markers!(robot, side)    
    nun_markers = ismarker(robot) ? 1 : 0
    while !isborder(robot,side)
        move!(robot,side)
        ismarker(robot) && num_markers += 1 # - это тоже самое, что и if ismarker(robot) num_markers += 1 end
    end
    return num_markers
end


function is_move_posible!(robot, move_side, find_side)
    while isborder(robot, move_side)
        if !isborder(robot, find_side) 
            move!(robot, find_side)
        else
            return false
        end
    end
    return true
end


function move_to_start(robot, start_side::Tuple)
    num_steps = Int[]
    side_steps = HorizoSide[]
    while !isborder(robot,start_side[2]) || is_posible!(robot, start_side[1], inverse(start_side[2]), num_steps, side_steps) # <=> Робот - не в стартовом углу
        for i in 1:2
            push!(num_steps, get_num_movements!(robot,start_side[i]))
            push!(side_steps, start_side[i])
        end
    end
    return num_steps, side_steps
end


function is_move_posible!(robot, move_side, find_side, num_steps::Vector, side_steps::Vector)

    num=0
    while isborder(robot, move_side)
        if !isborder(robot, find_side) 
            num += 1
            move!(robot,find_side)
        else
            push!(num_steps, num)
            push!(side_steps, find_side)
            return false
        end
    end
    push!(num_steps, num)
    push!(side_steps, find_side)

    return true
end
