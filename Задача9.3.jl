module FindMarker
    export find_marker!

    using HorizonSideRobots
    include("../8/horizonside.jl")
    include("functional_robot.jl")
    function find_marker!(robot::Robot)
        robot = interface_protected_robot(robot)
        line = interface_line(robot.move!)

        function move_ifnomarker!(side)::Bool
             if robot.ismarker()
                  return  false
             end 
              move_unlimited_line!(side)
              return true
         end

        function move_unlimited_line!(side) 
             coordinate = 0 
             num_steps = 1 
             orthogonal = right(side) 
             back_side = orthogonal 
             while robot.isborder(side)
                 line.movements!(orthogonal,num_steps)   
                 if orthogonal == back_side 
                       coordinate += num_steps 
                 else
                        coordinate -= num_steps 
                 end
                 num_steps+=1 
                 orthogonal=inverse(orthogonal) 
             end   
             robot.move!(side) 
             if coordinate > 0 
                    back_side = inverse(back_ side)          
else
coordinate = -coordinate
end
line.movements!(back_side,coordinate)
end  

trajectories = interface_trajectories(robot)
trajectories.spiral!(move_ifnomarker!)
end
end 
