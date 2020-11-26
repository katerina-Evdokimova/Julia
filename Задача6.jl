#Задача6
# Julia
function mark_innerrectangle_perimetr!(r::Robot, side::HorizonSide)
   if side == Nord
      direction_of_movement=(Nord,Ost,Sud, West)
      direction_to_border=(Ost,Sud,West,Nord)
   else 
       direction_of_movement=(Sud,Ost,Nord,West)
       direction_to_border=(Ost,Nord,West,Sud)
   end
   for i ∈ 1:4
      putmarkers!(r, direction_of_movement[i], direction_to_border[i])
   end
end
function mark_innerrectangle_perimetr!(r::Robot, side::HorizonSide)
   direction_of_movement, direction_to_border = get_directions(side)
   for i ∈ 1:4
     putmarkers!(r, direction_of_movement[i], direction_to_border[i])
   end
end

get_directions(side::HorizonSide) = if side == Nord
       return (Nord,Ost,Sud, West), (Ost,Sud,West,Nord)
    else
       return (Sud,Ost,Nord,West), (Ost,Nord,West,Sud)
    end
function putmarkers!(r::Robot, direction_of_movement::HorizonSide, direction_to_border::HorizonSide)
   while isborder(r,direction_to_border)==true
      move!(r,direction_of_movement)
   end
end

