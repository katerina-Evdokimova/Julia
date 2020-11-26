#Задача11
# Julia
function mark_centers(r)
    num_steps = through_rectangles_into_angle(r,(Sud,West))
    num_steps_to_ost = sum(num_steps[1:2:end])
    num_steps_to_nord = sum(num_steps[2:2:end])

    movements!(r,Nord,num_steps_to_nord)
    putmarker!(r)
    num_steps_to_sud = movements!(r,Nord)

    movements!(r,Ost,num_steps_to_ost)
    putmarker!(r)
    num_steps_to_west = movements!(r,Ost)

    movements!(r,Sud,num_steps_to_sud)
    putmarker!(r)
    movements!(r,Sud)

    movements!(r,Sud,num_steps_to_west)
    putmarker!(r)
    movements!(r,Sud)

    movements!(r,(Ost,Nord),num_steps)
end 
