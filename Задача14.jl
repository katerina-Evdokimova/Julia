#Задача14
 
function move_if_possible!(r::Robot, direct_side::HorizonSide)::Bool
   orthogonal_side = next(direct_side)
   reverse_side = reverse(orthogonal_side)
   num_steps=0
   while isborder(direct_side) == true
      if isborder(r, orthogonal_side) == false 
          move(r, orthogonal_side)
          num_steps += 1
      else
        break
      end
    end
    if isborder(r,direct_side) == false
       while isborder(r,reverse_side) == true
           move!(r,direct_side)
       end 
       result = true
    else
       result = false 
    end
    move!(r,reverse_side)
    return result
end
movements!(r::Robot, side::HorizonSide, num_steps::Int) =
for _ in 1:num_steps
    move_if_posible!(r,side)
end 

