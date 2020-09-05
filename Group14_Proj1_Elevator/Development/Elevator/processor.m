classdef processor < handle
    properties
        firstui
        secondui
        thirdui
        leftelevator
        rightelevator
        Database
        
        %rightelev_floor
        leftelev_status%0=free 1=up 2=down 3=stop
        rightelev_status
        leftelev_m_s %0=moving 1 = stop
        rightelev_m_s
        %rightelev_status
        
        
    end
    
    methods
        function init(process)
            process.Database.left_floor = 1;
            process.Database.right_floor = 1;
            process.leftelev_status = 0;
            process.rightelev_status = 0;
            process.leftelev_m_s = 0;
            process.rightelev_m_s = 0;
            process.Database.left_exec = [];
            process.Database.right_exec = [];
            process.Database.up_waiting = [];
            process.Database.down_waiting = [];
            process.leftelevator.Lamp.Color = [1,0,0];
            process.rightelevator.Lamp.Color = [1,0,0];
        end
        
        function left_elev_button(process,num)
            if process.leftelev_status==0&&isempty(process.Database.left_exec)
                process.Database.left_exec(end+1)=num;
            elseif process.leftelev_status==1%up
                if num<=process.Database.left_floor
                    
                else
                    if num>process.Database.left_exec(1)
                        process.Database.left_exec(end+1)=num;
                    else
                        process.Database.left_exec(end+1)=process.Database.left_exec(1);
                        process.Database.left_exec(1)=num;
                    end
                end
            elseif process.leftelev_status==2%down
                if num>=process.Database.left_floor
                    
                else
                    if num<process.Database.left_exec(1)
                        process.Database.left_exec(end+1)=num;
                    else
                        process.Database.left_exec(end+1)=process.Database.left_exec(1);
                        process.Database.left_exec(1)=num;
                    end
                end
            end
        end
        
        function right_elev_button(process,num)
            if process.rightelev_status==0&&isempty(process.Database.right_exec)
                process.Database.right_exec(end+1)=num;
            elseif process.rightelev_status==1%up
                if num<=process.Database.right_floor
                    
                else
                    if num>process.Database.right_exec(1)
                        process.Database.right_exec(end+1)=num;
                    else
                        process.Database.right_exec(end+1)=process.Database.right_exec(1);
                        process.Database.right_exec(1)=num;
                    end
                end
            elseif process.rightelev_status==2%down
                if num>=process.Database.right_floor
                    
                else
                    if num<process.Database.right_exec(1)
                        process.Database.right_exec(end+1)=num;
                    else
                        process.Database.right_exec(end+1)=process.Database.right_exec(1);
                        process.Database.right_exec(1)=num;
                    end
                end
            end
        end
        
        function left_stop_button(process)
            process.leftelev_status = 3;
            process.Database.left_exec=[];
        end
        
        function right_stop_button(process)
            process.rightelev_status = 3;
            process.Database.right_exec=[]; 
        end
        
        function leftopen_button(process)
            if (process.leftelev_status==0||process.leftelev_m_s==1)
                if process.leftelevator.Lamp.Color==[1,0,0]
                    process.leftelevator.Lamp.Color = [1,1,0];
                    pause(0.5);
                    process.leftelevator.Lamp.Color = [0,1,0];%left door open
                    pause(5);
                    process.leftelevator.Lamp.Color = [1,1,0];
                    pause(0.5);
                    process.leftelevator.Lamp.Color = [1,0,0];
                end
            end            
        end
        
        function leftclose_button(process)
            if (process.leftelev_status==0||process.leftelev_m_s==1)        
                if process.leftelevator.Lamp.Color==[0,1,0]
                    process.leftelevator.Lamp.Color = [1,1,0];
                    pause(0.5);
                    process.leftelevator.Lamp.Color = [1,0,0];
                end
            end            
        end
        
        function rightopen_button(process)
            if (process.rightelev_status==0||process.rightelev_m_s==1)
                if process.rightelevator.Lamp.Color==[1,0,0]
                    process.rightelevator.Lamp.Color = [1,1,0];
                    pause(0.5);
                    process.rightelevator.Lamp.Color = [0,1,0];%left door open
                    pause(5);
                    process.rightelevator.Lamp.Color = [1,1,0];
                    pause(0.5);
                    process.rightelevator.Lamp.Color = [1,0,0];
                end
                
            end            
        end
        
        function rightclose_button(process)
            if (process.rightelev_status==0||process.rightelev_m_s==1)
                if process.rightelevator.Lamp.Color==[0,1,0]      
                    process.rightelevator.Lamp.Color = [1,1,0];
                    pause(0.5);
                    process.rightelevator.Lamp.Color = [1,0,0];
                end
                
            end            
        end
                        
        function add_left(process,num)
            if find(process.Database.left_exec==num)
                
            elseif process.leftelev_status == 1%up23
                process.Database.left_exec(1)=2;
                process.Database.left_exec(end+1)=3;
            elseif process.leftelev_status == 2%down21
                process.Database.left_exec(1)=2;
                process.Database.left_exec(end+1)=1;                
            end
        end
       
        function add_right(process,num)
            if find(process.Database.right_exec==num)
                
            elseif process.rightelev_status == 1%up23
                process.Database.right_exec(1)=2;
                process.Database.right_exec(end+1)=3;
            elseif process.rightelev_status == 2%down21
                process.Database.right_exec(1)=2;
                process.Database.right_exec(end+1)=1;
            end            
        end
        
        function add_up_waiting(process,num)
            switch num
                case 2
                    if process.Database.left_floor<=2 && process.leftelev_status == 1
                        process.add_left(num);
                    elseif process.Database.right_floor<=2 && process.rightelev_status == 1
                        process.add_right(num);
                    else
                        if find(process.Database.up_waiting==2)
                            %pass
                        else
                            process.Database.up_waiting(end+1)=2;
                            process.sort_up_waiting;
                        end
                    end
                case 3
                    if find(process.Database.up_waiting==3)
                        %pass
                    else
                        process.Database.up_waiting(end+1)=3;
                        process.sort_up_waiting;
                    end
            end
        end
        
        function add_down_waiting(process,num)
            switch num
                case 2
                    if process.Database.left_floor>2 && process.leftelev_status == 2
                        process.add_left(num);
                    elseif process.Database.right_floor>2 && process.rightelev_status == 2
                        process.add_right(num);                    
                    else
                        if find(process.Database.down_waiting==2)
                            %pass
                        else
                            process.Database.down_waiting(end+1)=2;
                            process.sort_down_waiting;
                        end
                    end
                case 1
                    if find(process.Database.down_waiting==1)
                        %pass
                    else
                        process.Database.down_waiting(end+1)=1;
                        process.sort_down_waiting;
                    end
            end 
        end
        
        function Timer(process)
            process.upd_DisP;
            process.upd_wait2exec;
            process.upd_eleStatus;
            process.upd_door;
            process.upd_eleF;
        end
        
        function upd_DisP(process)
            process.firstui.EditField_1.Value=process.Database.left_floor;
            process.firstui.EditField_2.Value=process.Database.right_floor;
            process.secondui.EditField_1.Value=process.Database.left_floor;
            process.secondui.EditField_2.Value=process.Database.right_floor;
            process.thirdui.EditField_1.Value=process.Database.left_floor;
            process.thirdui.EditField_2.Value=process.Database.right_floor;
            process.leftelevator.FloorGauge.Value=process.Database.left_floor;
            process.rightelevator.FloorGauge.Value=process.Database.right_floor;
        end
        
        function upd_wait2exec(process)
            if ~isempty(process.Database.up_waiting)%>0 23
                if ~isempty(process.Database.down_waiting)%>0 21
                    if process.leftelev_status ~= 0
                        if process.rightelev_status ~= 0
                            
                        else 
                            if abs(process.Database.right_floor - process.Database.up_waiting(1))<=abs(process.Database.right_floor - process.Database.down_waiting(1))
                                process.Database.right_exec = process.Database.up_waiting;
                                process.Database.up_waiting = [];
                            else
                                process.Database.right_exec = process.Database.down_waiting;
                                process.Database.down_waiting = [];
                            end
                        end
                    else %process.leftelev_status = 0
                        if process.rightelev_status ~= 0
                            if abs(process.Database.left_floor - process.Database.up_waiting(1))<=abs(process.Database.left_floor - process.Database.down_waiting(1))
                                process.Database.left_exec = process.Database.up_waiting;
                                process.Database.up_waiting = [];
                            else
                                process.Database.left_exec = process.Database.down_waiting;
                                process.Database.down_waiting = [];
                            end
                        else% both elev free
                            if abs(process.Database.up_waiting(1)-process.Database.left_floor)<=abs(process.Database.up_waiting(1)-process.Database.right_floor)
                                process.Database.left_exec = process.Database.up_waiting;
                                process.Database.up_waiting = [];
                                process.Database.right_exec = process.Database.down_waiting;
                                process.Database.down_waiting = [];
                            else
                                process.Database.right_exec = process.Database.up_waiting;
                                process.Database.up_waiting = [];
                                process.Database.left_exec = process.Database.down_waiting;
                                process.Database.down_waiting = [];
                            end
                        end
                                               
                    end
                else
                    if process.leftelev_status ~= 0
                        if process.rightelev_status ~= 0
                            
                        else
                            process.Database.right_exec = process.Database.up_waiting;
                            process.Database.up_waiting = [];
                        end
                    else
                        if process.rightelev_status ~= 0
                            process.Database.left_exec = process.Database.up_waiting;
                            process.Database.up_waiting = [];
                        else
                            if abs(process.Database.up_waiting(1)-process.Database.left_floor)<=abs(process.Database.up_waiting(1)-process.Database.right_floor)
                                process.Database.left_exec = process.Database.up_waiting;
                                process.Database.up_waiting = [];
                            else
                                process.Database.right_exec = process.Database.up_waiting;
                                process.Database.up_waiting = [];
                            end
                        end
                    end
                end
            else 
                if ~isempty(process.Database.down_waiting)
                    if process.leftelev_status ~= 0
                        if process.rightelev_status ~= 0
                        else
                            process.Database.right_exec = process.Database.down_waiting;
                            process.Database.down_waiting = [];
                        end
                    else
                        if process.rightelev_status ~= 0
                            process.Database.left_exec = process.Database.down_waiting;
                            process.Database.down_waiting = [];
                        else
                            if abs(process.Database.down_waiting(1)-process.Database.left_floor)<=abs(process.Database.down_waiting(1)-process.Database.right_floor)
                                process.Database.left_exec = process.Database.down_waiting;
                                process.Database.down_waiting = [];
                            else
                                process.Database.right_exec = process.Database.down_waiting;
                                process.Database.down_waiting = [];
                            end
                        end                        
                    end
                end                             
            end            
        end
        
         function upd_eleStatus(process)
            if isempty(process.Database.left_exec)
                process.leftelev_status=0;                
            elseif process.Database.left_floor>process.Database.left_exec(1)
                process.leftelev_status=2;
                process.leftelev_m_s = 0;
            elseif process.Database.left_floor<process.Database.left_exec(1)
                process.leftelev_status=1;
                process.leftelev_m_s = 0;
            elseif length(process.Database.left_exec)==1 && process.Database.left_exec(1)==process.Database.left_floor
                process.leftelev_status=0;
            elseif length(process.Database.left_exec)==2 && (process.Database.left_exec(1)==process.Database.left_floor||process.Database.left_floor<process.Database.left_exec(2))
                process.leftelev_status=1;
                process.leftelev_m_s = 1;
            elseif length(process.Database.left_exec)==2 && (process.Database.left_exec(1)==process.Database.left_floor||process.Database.left_floor>process.Database.left_exec(2))
                process.leftelev_status=2;
                process.leftelev_m_s =1;
            end
            
            if isempty(process.Database.right_exec)
                process.rightelev_status=0;                
            elseif process.Database.right_floor>process.Database.right_exec(1)
                process.rightelev_status=2;
                process.rightelev_m_s = 0;
            elseif process.Database.right_floor<process.Database.right_exec(1)
                process.rightelev_status=1;
                process.rightelev_m_s = 0;
            elseif length(process.Database.right_exec)==1 && process.Database.right_exec(1)==process.Database.right_floor
                process.rightelev_status=0;
            elseif length(process.Database.right_exec)==2 && (process.Database.right_exec(1)==process.Database.right_floor||process.Database.right_floor<process.Database.right_exec(2))
                process.rightelev_status=1;
                process.rightelev_m_s = 1;
            elseif length(process.Database.right_exec)==2 && (process.Database.right_exec(1)==process.Database.right_floor||process.Database.right_floor>process.Database.right_exec(2))
                process.rightelev_status=2;
                process.rightelev_m_s =1;
            end
        end
        
        function upd_door(process)
            if ~isempty(process.Database.left_exec)
                if process.Database.left_exec(1)==process.Database.left_floor
                    process.Database.left_exec(1)=[];
                    process.openDoor(1);
                    process.leftelev_m_s = 0;                
                end
            end
            if ~isempty(process.Database.right_exec)
                if process.Database.right_exec(1)==process.Database.right_floor
                    process.Database.right_exec(1)=[];
                    process.openDoor(2);
                    process.rightelev_m_s = 0;                
                end
            end
        end   
        
        function upd_eleF(process)
%             a=0;
%             b=0;
            if ~isempty(process.Database.left_exec)
                if process.Database.left_floor==process.Database.left_exec(1)
                    process.openDoor(1);
                    process.Database.left_exec(1)=[];
                elseif process.Database.left_floor<process.Database.left_exec(1)                    
                    pause(0.75);
                    process.Database.left_floor=process.Database.left_floor+0.25;                                      
                elseif process.Database.left_floor>process.Database.left_exec(1)                  
                    pause(0.75);
                    process.Database.left_floor=process.Database.left_floor-0.25;                 
                end
            end
            if ~isempty(process.Database.right_exec)
                if process.Database.right_floor==process.Database.right_exec(1)
                    process.openDoor(2);
                    process.Database.right_exec(1)=[];
                elseif process.Database.right_floor<process.Database.right_exec(1)
                    pause(0.75);
                    process.Database.right_floor=process.Database.right_floor+0.25;                                                     
                elseif process.Database.right_floor>process.Database.right_exec(1)
                    pause(0.75);
                    process.Database.right_floor=process.Database.right_floor-0.25;                 
                end
            end
%             if a==0
%                 if b==0
%                 elseif b==1
%                     pause(0.75);
%                     process.Database.right_floor=process.Database.right_floor+0.1;   
%                 elseif b==2
%                     pause(0.75);
%                     process.Database.right_floor=process.Database.right_floor-0.1; 
%                 end
%             elseif a==1
%                 if b==0
%                     pause(0.75);
%                     process.Database.left_floor=process.Database.left_floor+0.1;   
%                 elseif b==1
%                     pause(0.75);
%                     process.Database.left_floor=process.Database.left_floor+0.1;    
%                     process.Database.right_floor=process.Database.right_floor+0.1; 
%                 elseif b==2
%                     pause(0.75);
%                     process.Database.left_floor=process.Database.left_floor+0.1;
%                     process.Database.right_floor=process.Database.right_floor-0.1; 
%                 end
%             elseif a==2
%                 if b==0
%                     pause(0.75);
%                     process.Database.left_floor=process.Database.left_floor-0.1; 
%                 elseif b==1
%                     pause(0.75);
%                     process.Database.left_floor=process.Database.left_floor-0.1; 
%                     process.Database.right_floor=process.Database.right_floor+0.1; 
%                 elseif b==2
%                     pause(0.75);
%                     process.Database.left_floor=process.Database.left_floor-0.1; 
%                     process.Database.right_floor=process.Database.right_floor-0.1; 
%                 end
%             end
            
        end
        
        function openDoor(process,num)           
            process.leftelev_m_s = 0;
            switch num
                case 1
                    process.leftelevator.Lamp.Color = [1,1,0];
                    pause(0.5);
                    process.leftelevator.Lamp.Color = [0,1,0];%left door open
                    pause(0.5);
                    process.leftelevator.Lamp.Color = [1,1,0];
                    pause(0.5);
                    process.leftelevator.Lamp.Color = [1,0,0];
                case 2
                    process.rightelevator.Lamp.Color = [1,1,0];
                    pause(0.5);
                    process.rightelevator.Lamp.Color = [0,1,0];%left door open
                    pause(0.5);
                    process.rightelevator.Lamp.Color = [1,1,0];
                    pause(0.5);
                    process.rightelevator.Lamp.Color = [1,0,0];
            end
            
        end
        
        function sort_up_waiting(process)%≈≈–Ú¬•≤„…œµƒ÷∏¡Óupwaiting list=23
            if length(process.Database.up_waiting)==1
                
            elseif length(process.Database.up_waiting)==2
                if process.Database.up_waiting(1)<process.Database.up_waiting(2)
                    
                else
                    temp = process.Database.up_waiting(1);
                    process.Database.up_waiting(1)=process.Database.up_waiting(2);
                    process.Database.up_waiting(2)=temp;
                end
            end
                
        end
        
        function sort_down_waiting(process)%≈≈–Ú¬•≤„…œµƒ÷∏¡Ódownwaiting list=23
            if length(process.Database.down_waiting)==1
                
            elseif length(process.Database.down_waiting)==2
                if process.Database.down_waiting(1)>process.Database.down_waiting(2)
                    
                else
                    temp = process.Database.down_waiting(1);
                    process.Database.down_waiting(1)=process.Database.down_waiting(2);
                    process.Database.down_waiting(2)=temp;
                end
            end
                
        end

            
            
    end
end
