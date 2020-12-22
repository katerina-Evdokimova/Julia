function start(r::Robot)
     putmarker!(r)
    x=0
    y=0
    n=1

    if (isboder(r,Ost)==false && isboder(r,Sud)==true):
        arrx[1]=x
        arry[1]=y
        goOst(r,x, y, n, arrx, arry)
    end
    elseif
        if (isboder(r,Sud)==false && isboder(r,West)==true):
            arrx[1]=x-1
            arry[1]=y
            goSoud(r,x, y, n, arrx, arry)
        end
        elseif
            if (isboder(r,West)==false && isboder(r,Nord)==true):
                arrx[1]=x
                arry[1]=y+1
                goWest(r,x, y, n, arrx, arry)
            end
             elseif
                arrx[1]=x
                arry[1]=y
                goNord(r,x, y, n, arrx, arry)
            end
        end
    end
end
function goNord(r,x, y, n, arrx, arry):
    while (isboder(r,Nord)==false and isboder(r,Ost) and ismarker!(r)==false):
        y+=1
        move!(r,Nord)
    end
    if (ismarker!(r)==true):
        area=0
        for (int i =1; i<n; i++){
            x1=arrx[0]
            x2=arrx[i]
            x3=arrx[i+1]
            y1=arry[0]
            y2=arry[i]
            y3=arry[i+1]
            area+=(((x1-x3)*(y2-y3))-((x2-x3)*(y1-y3)))/2;
        end
    end
    elseif
        if (isboder(r,Nord)==true):
            n+=1
            push!(arrx,x)
            push!(arry,y+1) 
            goWest(r,x, y, n, arr)
        end
        elseif
            n+=1
            push!(arrx,x)
            push!(arry,y)
            goOst(r,x, y, n, arr)
        end
    end
end
function goWest(r,x, y, n, arrx, arry):
    while (isboder(r,West)==false and isboder(r,Nord)==true and ismarker!(r)==false):
        x-=1
        move!(r,West)
    end
    if (ismarker!(r)==true):
        area=0
        for (int i =1; i<n; i++){
            x1=arrx[0]
            x2=arrx[i]
            x3=arrx[i+1]
            y1=arry[0]
            y2=arry[i]
            y3=arry[i+1]
            area+=(((x1-x3)*(y2-y3))-((x2-x3)*(y1-y3)))/2;
        end
    end
    elseif
        if (isboder(r,West)==true):
            n+=1
            push!(arrx,x)
            push!(arry,y)
            goSoud(r,x, y, n, arr)
        end
        elseif
            n+=1
            push!(arrx,x)
            push!(arry,y+1)
            goNord(r,x, y, n, arr)
        end
    end
end
function goSoud(r,x, y, n, arrx, arry):
    while (isboder(r,Sud)==false and isboder(r,West)==true and ismarker!(r)):
        y-=1
        move!(r,Sud)
    end
    if (ismarker(r)==true):
        area=0
        for (int i =1; i<n; i++){
            x1=arrx[0]
            x2=arrx[i]
            x3=arrx[i+1]
            y1=arry[0]
            y2=arry[i]
            y3=arry[i+1]
            area+=(((x1-x3)*(y2-y3))-((x2-x3)*(y1-y3)))/2;
        end
    end
    elseif
        if (isboder(r,Sud)==true):
            n+=1
            push!(arrx,x-1)
            push!(arry,y)
            goOst(r,x, y, n, arr)
        h
        else:
            n+=1
            push!(arrx,x-1)
            push!(arry,y+1)
            goWest(r,x, y, n, arr)
        end
    end
end
function goOst(r,x, y, n, arrx, arry):
    while (isboder(r,Ost)==false and isboder(r,Sud)==true and ismarker(r)==false):
        x+=1
        move!(r,Ost)
    end
    if (ismarker(r)==true):
        area=0
        for (int i =1; i<n; i++){
            x1=arrx[0]
            x2=arrx[i]
            x3=arrx[i+1]
            y1=arry[0]
            y2=arry[i]
            y3=arry[i+1]
            area+=(((x1-x3)*(y2-y3))-((x2-x3)*(y1-y3)))/2;
        end
    else:
        if (isboder(r,Ost)==true):"поворот восток-север"
            n+=1
            arrx.append(x-1)
            arry.append(y+1)
            goNord(r,x, y, n, arr)
        else:
            n+=1
            arrx.append(x-1)
            arry.append(y)
            goSoud(r,x, y, n, arr)
        end
    end
end





