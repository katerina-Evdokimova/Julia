function interface_trajectories(robot)

  function snake!(move_fold!::Function, fold_direct::HorizonSide, general_direct::HorizonSide)
    if move_fold!(fold_direct)==false
      return
    end
    while !robot.isborder(general_direct)
      robot.move!(general_direct)
      fold_direct = inverse(fold_direct)
      if move_fold!(fold_direct)==false
        return
      end
    end
  end 

  function labirint_snake!(move_fold!::Function, fold_direct::HorizonSide, general_direct::HorizonSide)

    function to_next_fold!(general_direct)::Bool 
      
      prew_direct = fold_direct
      fold_direct = inverse(fold_direct) 
      while robot.isborder(general_direct)
        if !robot.isborder(fold_direct)
          robot.move!(fold_direct)
        else
          return false 
        end
      end
      
      robot.move!(general_direct) #!!!
      while !robot.isborder(prew_direct)
        robot.move!(prew_direct)
      end
      return true
    end 

    if move_fold!(fold_direct)==false
      return
    end
    while to_next_fold!(general_direct)==true
      if move_fold!(fold_direct)==false
        return
      end
    end
  end 

  function spiral!(move_act!::Function)

    function next_round!(side, max_num_steps::Integer) 
      if side in (Sud, Nord)
        max_num_steps+=1
      end
      return max_num_steps
    end 

    function move_direct!(move_act!::Function, side, max_num_steps::Integer)
    
      num_steps=0
      while (num_steps <= max_num_steps)
        if move_act!(side) == false
          return false
        end
        num_steps+=1
      end
      return true
    end 
    side = Nord
    max_num_steps = 1
    while move_direct!(move_act!, side, max_num_steps) == true
      max_num_steps = next_round!(side, max_num_steps)
      side=left(side)
    end
  end 
  function comb!(there_and_back!::Function, clove_direct::HorizonSide, general_direct::HorizonSide)

    function to_next_clove!(general_direct)
      if !robot.isborder(general_direct)
        robot.move!(general_direct)
        return true
      else
        return false
      end
    end 

    there_and_back!(clove_direct)
    while to_next_clove!(general_direct) && there_and_back!(clove_direct)
    end
  end 
  return (;snake!, labirint_snake!, comb!, spiral!)
end 
# Julia
