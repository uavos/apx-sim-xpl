 
select = 1

function onMouseDown ( component , x , y , button , parentX , parentY )
    if button == MB_LEFT then
        
        if x >= 0 and x <= 50 and y >= 0 and y <= 50 then
            select = math.abs(select - 1)
        end
    end
    return false
end

function update()
    
    if select == 0 then
        aero_panel.visible = true
    else
        aero_panel.visible = false
    end
    
end
