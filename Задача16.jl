# Julia
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
function mark_field(r)
     side=Ost
      mark_row(r,side)
      while isborder(r,side)==false
           move!(r,Nord)
           side=inverse(side)
           mark_row(r,side)
       end
end

function mark_row(r::Robot,side::HorizonSide)
       putmarker!(r)

      while move_if_posible!(r,side) == true
           putmarker!(r)
      end
end 
