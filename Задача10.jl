function move_and_get_temperature_of_row!(r::Robot, side::HorizonSide)
 number = 0
 sum = 0  
    while !isborder(r,side)
        move!( r, side)
        if ismarker(r)
 sum += temperature(r)
 number += 1
        end
    end
    return number, sum
end

function get_average_temperature!(r::Robot)
    side = Nord
    sum = 0
    number = 0
    while !isborder(r, Ost) && (!isborder(r, Nord) || !isborder(r, Sud))
        delta_number, delta_sum = move_and_get_temperature_of_row!(r, side)
        number += delta_number
        sum += delta_sum
        move!(r, Ost)
        side = inverse(side)
    end

    if isborder(r, Nord)
        while !isborder(r, Sud)
            delta_number, delta_sum = move_and_get_temperature_of_row!(r, Sud)
            number += delta_number
            sum += delta_sum
        end
    else
        while !isborder(r, Nord)
            delta_number, delta_sum = move_and_get_temperature_of_row!(r, Nord)
            number += delta_number
            sum += delta_sum
        end
    end

    average_temperature = sum/number
    return average_temperature
end
