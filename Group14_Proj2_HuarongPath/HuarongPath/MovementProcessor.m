classdef MovementProcessor < handle
    
    properties
        uiApp
        GameDB
        MapDB
    end
    
    methods
        function setBlocks(process,map)
            A=map;
            len=process.GameDB.wid;
            [I,J] = find(A==1);X=len*(J-1);Y=len*(5-I);
            process.uiApp.Button1.Position=[X,Y,2*len,2*len];
            [I,J] = find(A==2);X=len*(J-1);Y=len*(5-I);
            process.uiApp.Button2.Position=[X,Y,len,2*len];
            [I,J] = find(A==3);X=len*(J-1);Y=len*(5-I);
            process.uiApp.Button3.Position=[X,Y,len,2*len];
            [I,J] = find(A==4);X=len*(J-1);Y=len*(5-I);
            process.uiApp.Button4.Position=[X,Y,len,2*len];
            [I,J] = find(A==5);X=len*(J-1);Y=len*(5-I);
            process.uiApp.Button5.Position=[X,Y,len,2*len];
            [I,J] = find(A==6);X=len*(J-1);Y=len*(5-I);
            process.uiApp.Button6.Position=[X,Y,2*len,len];
            [I,J] = find(A==71);X=len*(J-1);Y=len*(5-I);
            process.uiApp.Button7_1.Position=[X,Y,len,len];
            [I,J] = find(A==72);X=len*(J-1);Y=len*(5-I);
            process.uiApp.Button7_2.Position=[X,Y,len,len];
            [I,J] = find(A==73);X=len*(J-1);Y=len*(5-I);
            process.uiApp.Button7_3.Position=[X,Y,len,len];
            [I,J] = find(A==74);X=len*(J-1);Y=len*(5-I);
            process.uiApp.Button7_4.Position=[X,Y,len,len];               
        end
        
        function invalid(process)
            process.uiApp.Text1.Value='You can not move this block! Please try others!';
        end
        
        function [num]=stepAdd(process)
            process.GameDB.step=process.GameDB.step+1;
            num=process.GameDB.step;
        end
             
        function victory(process)
            [I,J]=find(process.GameDB.map==1);
            if I==5&&J==2
                process.uiApp.Text1.Value='You win! Congratulations! Please press restart or quit. Thanks for playing.';
            end
        end
        
        function init(process,num)
            process.GameDB.init;
            process.MapDB.init;
            switch num
                case 0
                    process.GameDB.level=[9 71 0 9;
                                        4 72 0 5;
                                        9 9 9 9;
                                        2 1 9 3;
                                        73 74 6 9];
                    process.GameDB.name='¾È¾È²Ü²Ù';
                    process.GameDB.solve='°¢°Í°¢°Í°¢°Í°¢°Í°¢°Í°¢°Í';
                case 1
                    process.GameDB.level=process.MapDB.map1;
                    process.GameDB.name=process.MapDB.name1;
                    process.GameDB.solve=process.MapDB.solve1;
                case 2
                    process.GameDB.level=process.MapDB.map2;
                    process.GameDB.name=process.MapDB.name2;
                    process.GameDB.solve=process.MapDB.solve2;
                case 3
                    process.GameDB.level=process.MapDB.map3;
                    process.GameDB.name=process.MapDB.name3;
                    process.GameDB.solve=process.MapDB.solve3;
                case 4
                    process.GameDB.level=process.MapDB.map4;
                    process.GameDB.name=process.MapDB.name4;
                    process.GameDB.solve=process.MapDB.solve4;
                case 5
                    process.GameDB.level=process.MapDB.map5;
                    process.GameDB.name=process.MapDB.name5;
                    process.GameDB.solve=process.MapDB.solve5;
                case 6
                    process.GameDB.level=process.MapDB.map6;
                    process.GameDB.name=process.MapDB.name6;
                    process.GameDB.solve=process.MapDB.solve6;
            end
            
            process.GameDB.map=process.GameDB.level;            
            process.setBlocks(process.GameDB.map);
            process.uiApp.displayMessage('Welcomes,please move blocks,choose level or random map!');
            process.uiApp.TextArea_2.Value=process.GameDB.name;
            process.uiApp.StepNumEditField.Value=process.GameDB.step;
        end
        
        function random(process)
            num = unidrnd(6);
            switch num
                case 1
                    process.GameDB.level=process.MapDB.map1;
                    process.GameDB.name=process.MapDB.name1;
                    process.GameDB.solve=process.MapDB.solve1;
                case 2
                    process.GameDB.level=process.MapDB.map2;
                    process.GameDB.name=process.MapDB.name2;
                    process.GameDB.solve=process.MapDB.solve2;
                case 3
                    process.GameDB.level=process.MapDB.map3;
                    process.GameDB.name=process.MapDB.name3;
                    process.GameDB.solve=process.MapDB.solve3;
                case 4
                    process.GameDB.level=process.MapDB.map4;
                    process.GameDB.name=process.MapDB.name4;
                    process.GameDB.solve=process.MapDB.solve4;
                case 5
                    process.GameDB.level=process.MapDB.map5;
                    process.GameDB.name=process.MapDB.name5;
                    process.GameDB.solve=process.MapDB.solve5;
                case 6
                    process.GameDB.level=process.MapDB.map6;
                    process.GameDB.name=process.MapDB.name6;
                    process.GameDB.solve=process.MapDB.solve6;
            end
            process.GameDB.init;
            process.GameDB.map=process.GameDB.level;
            process.setBlocks(process.GameDB.map);
            process.uiApp.displayMessage('Random mode, please move blocks!');
            process.uiApp.TextArea_2.Value=process.GameDB.name;
            process.uiApp.StepNumEditField.Value=process.GameDB.step;
        end
        
        function hint(process)
            process.uiApp.hint.HintTextArea.Value=process.GameDB.solve;
        end
        
        function level(process,num)
            process.init(num);
        end
        
        function restart(process)
            process.GameDB.init;
            process.GameDB.map=process.GameDB.level;
            process.setBlocks(process.GameDB.level);
            process.uiApp.displayMessage('Restart successful,please move blocks!');
            process.uiApp.TextArea_2.Value=process.GameDB.name;            
            process.uiApp.StepNumEditField.Value=process.GameDB.step;
        end
        
        function [able]=juddown(process,num)   
            switch num
                case 1  
                    [I,J] = find(process.GameDB.map==1);
                    if I<5 && process.GameDB.map(I+1,J)==0 && process.GameDB.map(I+1,J+1)==0
                        able=1;
                    else
                        able=0;
                    end
                case 6
                    [I,J] = find(process.GameDB.map==6);
                    if I<5 && process.GameDB.map(I+1,J)==0 && process.GameDB.map(I+1,J+1)==0
                        able=1;
                    else
                        able=0;
                    end
                case 2
                    [I,J] = find(process.GameDB.map==2);
                    if I<5 && process.GameDB.map(I+1,J)==0
                        able=1;
                    else
                        able=0;
                    end
                case 3
                    [I,J] = find(process.GameDB.map==3);
                    if I<5 && process.GameDB.map(I+1,J)==0
                        able=1;
                    else
                        able=0;
                    end
                case 4
                    [I,J] = find(process.GameDB.map==4);
                    if I<5 && process.GameDB.map(I+1,J)==0
                        able=1;
                    else
                        able=0;
                    end
                case 5
                    [I,J] = find(process.GameDB.map==5);
                    if I<5 && process.GameDB.map(I+1,J)==0
                        able=1;
                    else
                        able=0;
                    end               
                case 71
                    [I,J] = find(process.GameDB.map==71);
                    if I<5 && process.GameDB.map(I+1,J)==0
                        able=1;
                    else
                        able=0;
                    end 
                case 72
                    [I,J] = find(process.GameDB.map==72);
                    if I<5 && process.GameDB.map(I+1,J)==0
                        able=1;
                    else
                        able=0;
                    end  
                case 73
                    [I,J] = find(process.GameDB.map==73);
                    if I<5 && process.GameDB.map(I+1,J)==0
                        able=1;
                    else
                        able=0;
                    end
                case 74
                    [I,J] = find(process.GameDB.map==74);
                    if I<5 && process.GameDB.map(I+1,J)==0
                        able=1;
                    else
                        able=0;
                    end  
            end
        end
        
        function [able]=judup(process,num)          
            switch num
                case 1
                    [I,J] = find(process.GameDB.map==1);
                    if I>2 && process.GameDB.map(I-2,J)==0 && process.GameDB.map(I-2,J+1)==0
                        able=1;
                    else
                        able=0;
                    end
                case 2
                    [I,J] = find(process.GameDB.map==2);
                    if I>2 && process.GameDB.map(I-2,J)==0
                        able=1;
                    else
                        able=0;
                    end
                case 3
                    [I,J] = find(process.GameDB.map==3);
                    if I>2 && process.GameDB.map(I-2,J)==0
                        able=1;
                    else
                        able=0;
                    end
                case 4
                    [I,J] = find(process.GameDB.map==4);
                    if I>2 && process.GameDB.map(I-2,J)==0
                        able=1;
                    else
                        able=0;
                    end
                case 5
                    [I,J] = find(process.GameDB.map==5);
                    if I>2 && process.GameDB.map(I-2,J)==0
                        able=1;
                    else
                        able=0;
                    end
                case 6
                    [I,J] = find(process.GameDB.map==6);
                    if I>1 && process.GameDB.map(I-1,J)==0 && process.GameDB.map(I-1,J+1)==0
                        able=1;
                    else
                        able=0;
                    end
                case 71
                    [I,J] = find(process.GameDB.map==71);
                    if I>1 && process.GameDB.map(I-1,J)==0
                        able=1;
                    else
                        able=0;
                    end
                case 72
                    [I,J] = find(process.GameDB.map==72);
                    if I>1 && process.GameDB.map(I-1,J)==0
                        able=1;
                    else
                        able=0;
                    end
                case 73
                    [I,J] = find(process.GameDB.map==73);
                    if I>1 && process.GameDB.map(I-1,J)==0
                        able=1;
                    else
                        able=0;
                    end
                case 74
                    [I,J] = find(process.GameDB.map==74);
                    if I>1 && process.GameDB.map(I-1,J)==0
                        able=1;
                    else
                        able=0;
                    end
            end
        end
        
        function [able]=judleft(process,num)            
            switch num
                case 1
                    [I,J] = find(process.GameDB.map==1);
                    if J>1 && process.GameDB.map(I,J-1)==0 && process.GameDB.map(I-1,J-1)==0
                        able=1;
                    else
                        able=0;
                    end
                case 2
                    [I,J] = find(process.GameDB.map==2);
                    if J>1 && process.GameDB.map(I,J-1)==0 && process.GameDB.map(I-1,J-1)==0
                        able=1;
                    else
                        able=0;
                    end
                case 3
                    [I,J] = find(process.GameDB.map==3);
                    if J>1 && process.GameDB.map(I,J-1)==0 && process.GameDB.map(I-1,J-1)==0
                        able=1;
                    else
                        able=0;
                    end
                case 4
                    [I,J] = find(process.GameDB.map==4);
                    if J>1 && process.GameDB.map(I,J-1)==0 && process.GameDB.map(I-1,J-1)==0
                        able=1;
                    else
                        able=0;
                    end
                case 5
                    [I,J] = find(process.GameDB.map==5);
                    if J>1 && process.GameDB.map(I,J-1)==0 && process.GameDB.map(I-1,J-1)==0
                        able=1;
                    else
                        able=0;
                    end
                case 6
                    [I,J] = find(process.GameDB.map==6);
                    if J>1 && process.GameDB.map(I,J-1)==0
                        able=1;
                    else
                        able=0;
                    end
                case 71
                    [I,J] = find(process.GameDB.map==71);
                    if J>1 && process.GameDB.map(I,J-1)==0
                        able=1;
                    else
                        able=0;
                    end      
                case 72
                    [I,J] = find(process.GameDB.map==72);
                    if J>1 && process.GameDB.map(I,J-1)==0
                        able=1;
                    else
                        able=0;
                    end 
                case 73
                    [I,J] = find(process.GameDB.map==73);
                    if J>1 && process.GameDB.map(I,J-1)==0
                        able=1;
                    else
                        able=0;
                    end 
                case 74
                    [I,J] = find(process.GameDB.map==74);
                    if J>1 && process.GameDB.map(I,J-1)==0
                        able=1;
                    else
                        able=0;
                    end 
            end
        end
        
        function [able]=judright(process,num)            
            switch num
                case 1
                    [I,J] = find(process.GameDB.map==1);
                    if J<3 && process.GameDB.map(I,J+2)==0 && process.GameDB.map(I-1,J+2)==0
                        able=1;
                    else
                        able=0;
                    end
                case 2
                    [I,J] = find(process.GameDB.map==2);
                    if J<4 && process.GameDB.map(I,J+1)==0 && process.GameDB.map(I-1,J+1)==0
                        able=1;
                    else
                        able=0;
                    end
                case 3
                    [I,J] = find(process.GameDB.map==3);
                    if J<4 && process.GameDB.map(I,J+1)==0 && process.GameDB.map(I-1,J+1)==0
                        able=1;
                    else
                        able=0;
                    end
                case 4
                    [I,J] = find(process.GameDB.map==4);
                    if J<4 && process.GameDB.map(I,J+1)==0 && process.GameDB.map(I-1,J+1)==0
                        able=1;
                    else
                        able=0;
                    end
                case 5
                    [I,J] = find(process.GameDB.map==5);
                    if J<4 && process.GameDB.map(I,J+1)==0 && process.GameDB.map(I-1,J+1)==0
                        able=1;
                    else
                        able=0;
                    end
                case 6
                    [I,J] = find(process.GameDB.map==6);
                    if J<3 && process.GameDB.map(I,J+2)==0
                        able=1;
                    else
                        able=0;
                    end
                case 71
                    [I,J] = find(process.GameDB.map==71);
                    if J<4 && process.GameDB.map(I,J+1)==0
                        able=1;
                    else
                        able=0;
                    end      
                case 72
                    [I,J] = find(process.GameDB.map==72);
                    if J<4 && process.GameDB.map(I,J+1)==0
                        able=1;
                    else
                        able=0;
                    end
                case 73
                    [I,J] = find(process.GameDB.map==73);
                    if J<4 && process.GameDB.map(I,J+1)==0
                        able=1;
                    else
                        able=0;
                    end
                case 74
                    [I,J] = find(process.GameDB.map==74);
                    if J<4 && process.GameDB.map(I,J+1)==0
                        able=1;
                    else
                        able=0;
                    end
            end
        end
        
        function down(process,num)            
            len=process.GameDB.wid;
            switch num
                case 1
                    [I,J] = find(process.GameDB.map==1);
                    process.GameDB.map(I+1,J)=1;
                    process.GameDB.map(I+1,J+1)=9;
                    process.GameDB.map(I,J)=9;
                    process.GameDB.map(I-1,J)=0;
                    process.GameDB.map(I-1,J+1)=0;
                    [I,J] = find(process.GameDB.map==1);
                    X=len*(J-1);
                    Y=len*(5-I);
                    process.uiApp.Button1.Position=[X,Y,2*len,2*len];
                    process.uiApp.StepNumEditField.Value=process.stepAdd;
                    process.GameDB.resetBlock;
                    process.uiApp.displayMessage("²Ü²Ù moved down, please go on.");                           
                    process.victory;
                case 2
                    [I,J] = find(process.GameDB.map==2);
                    process.GameDB.map(I+1,J)=2;
                    process.GameDB.map(I,J)=9;
                    process.GameDB.map(I-1,J)=0;
                    [I,J] = find(process.GameDB.map==2);
                    X=len*(J-1);
                    Y=len*(5-I);
                    process.uiApp.Button2.Position=[X,Y,len,2*len];
                    process.uiApp.StepNumEditField.Value=process.stepAdd;
                    process.GameDB.resetBlock;
                    process.uiApp.displayMessage("ÕÅ·É moved down, please go on.");                           
                    process.victory;
                case 3
                    [I,J] = find(process.GameDB.map==3);
                    process.GameDB.map(I+1,J)=3;
                    process.GameDB.map(I,J)=9;
                    process.GameDB.map(I-1,J)=0;
                    [I,J] = find(process.GameDB.map==3);
                    X=len*(J-1);
                    Y=len*(5-I);
                    process.uiApp.Button3.Position=[X,Y,len,2*len];
                    process.uiApp.StepNumEditField.Value=process.stepAdd;
                    process.GameDB.resetBlock;
                    process.uiApp.displayMessage("Âí³¬ moved down, please go on.");                           
                    process.victory;
                case 4
                    [I,J] = find(process.GameDB.map==4);
                    process.GameDB.map(I+1,J)=4;
                    process.GameDB.map(I,J)=9;
                    process.GameDB.map(I-1,J)=0;
                    [I,J] = find(process.GameDB.map==4);
                    X=len*(J-1);
                    Y=len*(5-I);
                    process.uiApp.Button4.Position=[X,Y,len,2*len];
                    process.uiApp.StepNumEditField.Value=process.stepAdd;
                    process.GameDB.resetBlock;
                    process.uiApp.displayMessage("»ÆÖÒ moved down, please go on.");                           
                    process.victory;
                case 5
                    [I,J] = find(process.GameDB.map==5);
                    process.GameDB.map(I+1,J)=5;
                    process.GameDB.map(I,J)=9;
                    process.GameDB.map(I-1,J)=0;
                    [I,J] = find(process.GameDB.map==5);
                    X=len*(J-1);
                    Y=len*(5-I);
                    process.uiApp.Button5.Position=[X,Y,len,2*len];
                    process.uiApp.StepNumEditField.Value=process.stepAdd;
                    process.GameDB.resetBlock;
                    process.uiApp.displayMessage("ÕÔÔÆ moved down, please go on.");                           
                    process.victory;
                case 6
                    [I,J] = find(process.GameDB.map==6);
                    process.GameDB.map(I+1,J)=6;
                    process.GameDB.map(I+1,J+1)=9;
                    process.GameDB.map(I,J)=0;
                    process.GameDB.map(I,J+1)=0;
                    [I,J] = find(process.GameDB.map==6);
                    X=len*(J-1);
                    Y=len*(5-I);
                    process.uiApp.Button6.Position=[X,Y,2*len,len];
                    process.uiApp.StepNumEditField.Value=process.stepAdd;
                    process.GameDB.resetBlock;
                    process.uiApp.displayMessage("¹ØÓð moved down, please go on.");                           
                    process.victory;
                case 71
                    [I,J] = find(process.GameDB.map==71);
                    process.GameDB.map(I+1,J)=71;
                    process.GameDB.map(I,J)=0;
                    [I,J] = find(process.GameDB.map==71);
                    X=len*(J-1);
                    Y=len*(5-I);
                    process.uiApp.Button7_1.Position=[X,Y,len,len];
                    process.uiApp.StepNumEditField.Value=process.stepAdd;
                    process.GameDB.resetBlock;
                    process.uiApp.displayMessage("×ä moved down, please go on.");                           
                    process.victory;
                case 72
                    [I,J] = find(process.GameDB.map==72);
                    process.GameDB.map(I+1,J)=72;
                    process.GameDB.map(I,J)=0;
                    [I,J] = find(process.GameDB.map==72);
                    X=len*(J-1);
                    Y=len*(5-I);
                    process.uiApp.Button7_2.Position=[X,Y,len,len];
                    process.uiApp.StepNumEditField.Value=process.stepAdd;
                    process.GameDB.resetBlock;
                    process.uiApp.displayMessage("×ä moved down, please go on.");                           
                    process.victory;
                case 73
                    [I,J] = find(process.GameDB.map==73);
                    process.GameDB.map(I+1,J)=73;
                    process.GameDB.map(I,J)=0;
                    [I,J] = find(process.GameDB.map==73);
                    X=len*(J-1);
                    Y=len*(5-I);
                    process.uiApp.Button7_3.Position=[X,Y,len,len];
                    process.uiApp.StepNumEditField.Value=process.stepAdd;
                    process.GameDB.resetBlock;
                    process.uiApp.displayMessage("×ä moved down, please go on.");                           
                    process.victory;
                case 74
                    [I,J] = find(process.GameDB.map==74);
                    process.GameDB.map(I+1,J)=74;
                    process.GameDB.map(I,J)=0;
                    [I,J] = find(process.GameDB.map==74);
                    X=len*(J-1);
                    Y=len*(5-I);
                    process.uiApp.Button7_4.Position=[X,Y,len,len];
                    process.uiApp.StepNumEditField.Value=process.stepAdd;
                    process.GameDB.resetBlock;
                    process.uiApp.displayMessage("×ä moved down, please go on.");                           
                    process.victory;
            end            
        end
        
        function up(process,num)                     
            len=process.GameDB.wid;
            switch num
                case 1
                    [I,J] = find(process.GameDB.map==1);
                    process.GameDB.map(I-1,J)=1;
                    process.GameDB.map(I-2,J)=9;
                    process.GameDB.map(I-2,J+1)=9;
                    process.GameDB.map(I,J)=0;
                    process.GameDB.map(I,J+1)=0;
                    [I,J] = find(process.GameDB.map==1);
                    X=len*(J-1);
                    Y=len*(5-I);
                    process.uiApp.Button1.Position=[X,Y,2*len,2*len];
                    process.uiApp.StepNumEditField.Value=process.stepAdd;
                    process.GameDB.resetBlock;
                    process.uiApp.displayMessage("²Ü²Ù moved up, please go on.");                           
                    process.victory;
                case 2
                    [I,J] = find(process.GameDB.map==2);
                    process.GameDB.map(I-1,J)=2;
                    process.GameDB.map(I-2,J)=9;
                    process.GameDB.map(I,J)=0;
                    [I,J] = find(process.GameDB.map==2);
                    X=len*(J-1);
                    Y=len*(5-I);
                    process.uiApp.Button2.Position=[X,Y,len,2*len];
                    process.uiApp.StepNumEditField.Value=process.stepAdd;
                    process.GameDB.resetBlock;
                    process.uiApp.displayMessage("ÕÅ·É moved up, please go on.");                           
                    process.victory;
                case 3
                    [I,J] = find(process.GameDB.map==3);
                    process.GameDB.map(I-1,J)=3;
                    process.GameDB.map(I-2,J)=9;
                    process.GameDB.map(I,J)=0;
                    [I,J] = find(process.GameDB.map==3);
                    X=len*(J-1);
                    Y=len*(5-I);
                    process.uiApp.Button3.Position=[X,Y,len,2*len];
                    process.uiApp.StepNumEditField.Value=process.stepAdd;
                    process.GameDB.resetBlock;
                    process.uiApp.displayMessage("Âí³¬ moved up, please go on.");                           
                    process.victory;            
                case 4
                    [I,J] = find(process.GameDB.map==4);
                    process.GameDB.map(I-1,J)=4;
                    process.GameDB.map(I-2,J)=9;
                    process.GameDB.map(I,J)=0;
                    [I,J] = find(process.GameDB.map==4);
                    X=len*(J-1);
                    Y=len*(5-I);
                    process.uiApp.Button4.Position=[X,Y,len,2*len];
                    process.uiApp.StepNumEditField.Value=process.stepAdd;
                    process.GameDB.resetBlock;
                    process.uiApp.displayMessage("»ÆÖÒ moved up, please go on.");                           
                    process.victory;
                case 5
                    [I,J] = find(process.GameDB.map==5);
                    process.GameDB.map(I-1,J)=5;
                    process.GameDB.map(I-2,J)=9;
                    process.GameDB.map(I,J)=0;
                    [I,J] = find(process.GameDB.map==5);
                    X=len*(J-1);
                    Y=len*(5-I);
                    process.uiApp.Button5.Position=[X,Y,len,2*len];
                    process.uiApp.StepNumEditField.Value=process.stepAdd;
                    process.GameDB.resetBlock;
                    process.uiApp.displayMessage("ÕÔÔÆ moved up, please go on.");                           
                    process.victory;
                case 6
                    [I,J] = find(process.GameDB.map==6);
                    process.GameDB.map(I-1,J)=6;
                    process.GameDB.map(I-1,J+1)=9;
                    process.GameDB.map(I,J)=0;
                    process.GameDB.map(I,J+1)=0;
                    [I,J] = find(process.GameDB.map==6);
                    X=len*(J-1);
                    Y=len*(5-I);
                    process.uiApp.Button6.Position=[X,Y,2*len,len];
                    process.uiApp.StepNumEditField.Value=process.stepAdd;
                    process.GameDB.resetBlock;
                    process.uiApp.displayMessage("¹ØÓð moved up, please go on.");                           
                    process.victory;
                case 71
                    [I,J] = find(process.GameDB.map==71);
                    process.GameDB.map(I-1,J)=71;                    
                    process.GameDB.map(I,J)=0;
                    [I,J] = find(process.GameDB.map==71);
                    X=len*(J-1);
                    Y=len*(5-I);
                    process.uiApp.Button7_1.Position=[X,Y,len,len];
                    process.uiApp.StepNumEditField.Value=process.stepAdd;
                    process.GameDB.resetBlock;
                    process.uiApp.displayMessage("×ä moved up, please go on.");                           
                    process.victory;
                case 72
                    [I,J] = find(process.GameDB.map==72);
                    process.GameDB.map(I-1,J)=72;                    
                    process.GameDB.map(I,J)=0;
                    [I,J] = find(process.GameDB.map==72);
                    X=len*(J-1);
                    Y=len*(5-I);
                    process.uiApp.Button7_2.Position=[X,Y,len,len];
                    process.uiApp.StepNumEditField.Value=process.stepAdd;
                    process.GameDB.resetBlock;
                    process.uiApp.displayMessage("×ä moved up, please go on.");                           
                    process.victory;
                case 73
                    [I,J] = find(process.GameDB.map==73);
                    process.GameDB.map(I-1,J)=73;                    
                    process.GameDB.map(I,J)=0;
                    [I,J] = find(process.GameDB.map==73);
                    X=len*(J-1);
                    Y=len*(5-I);
                    process.uiApp.Button7_3.Position=[X,Y,len,len];
                    process.uiApp.StepNumEditField.Value=process.stepAdd;
                    process.GameDB.resetBlock;
                    process.uiApp.displayMessage("×ä moved up, please go on.");                           
                    process.victory;                    
                case 74
                    [I,J] = find(process.GameDB.map==74);
                    process.GameDB.map(I-1,J)=74;                    
                    process.GameDB.map(I,J)=0;
                    [I,J] = find(process.GameDB.map==74);
                    X=len*(J-1);
                    Y=len*(5-I);
                    process.uiApp.Button7_4.Position=[X,Y,len,len];
                    process.uiApp.StepNumEditField.Value=process.stepAdd;
                    process.GameDB.resetBlock;
                    process.uiApp.displayMessage("×ä moved up, please go on.");                           
                    process.victory;
            end
        end
        
        function left(process,num)                    
            len=process.GameDB.wid;
            switch num
                case 1
                    [I,J] = find(process.GameDB.map==1);
                    process.GameDB.map(I,J-1)=1;
                    process.GameDB.map(I-1,J-1)=9;
                    process.GameDB.map(I,J)=9;
                    process.GameDB.map(I,J+1)=0;
                    process.GameDB.map(I-1,J+1)=0;
                    [I,J] = find(process.GameDB.map==1);
                    X=len*(J-1);
                    Y=len*(5-I);
                    process.uiApp.Button1.Position=[X,Y,2*len,2*len];
                    process.uiApp.StepNumEditField.Value=process.stepAdd;
                    process.GameDB.resetBlock;
                    process.uiApp.displayMessage("²Ü²Ù moved left, please go on.");                           
                    process.victory;
                case 2
                    [I,J] = find(process.GameDB.map==2);
                    process.GameDB.map(I,J-1)=2;
                    process.GameDB.map(I-1,J-1)=9;
                    process.GameDB.map(I,J)=0;
                    process.GameDB.map(I-1,J)=0;
                    [I,J] = find(process.GameDB.map==2);
                    X=len*(J-1);
                    Y=len*(5-I);
                    process.uiApp.Button2.Position=[X,Y,len,2*len];
                    process.uiApp.StepNumEditField.Value=process.stepAdd;
                    process.GameDB.resetBlock;
                    process.uiApp.displayMessage("ÕÅ·É moved left, please go on.");                           
                    process.victory;
                case 3
                    [I,J] = find(process.GameDB.map==3);
                    process.GameDB.map(I,J-1)=3;
                    process.GameDB.map(I-1,J-1)=9;
                    process.GameDB.map(I,J)=0;
                    process.GameDB.map(I-1,J)=0;
                    [I,J] = find(process.GameDB.map==3);
                    X=len*(J-1);
                    Y=len*(5-I);
                    process.uiApp.Button3.Position=[X,Y,len,2*len];
                    process.uiApp.StepNumEditField.Value=process.stepAdd;
                    process.GameDB.resetBlock;
                    process.uiApp.displayMessage("Âí³¬ moved left, please go on.");                           
                    process.victory;
                case 4
                    [I,J] = find(process.GameDB.map==4);
                    process.GameDB.map(I,J-1)=4;
                    process.GameDB.map(I-1,J-1)=9;
                    process.GameDB.map(I,J)=0;
                    process.GameDB.map(I-1,J)=0;
                    [I,J] = find(process.GameDB.map==4);
                    X=len*(J-1);
                    Y=len*(5-I);
                    process.uiApp.Button4.Position=[X,Y,len,2*len];
                    process.uiApp.StepNumEditField.Value=process.stepAdd;
                    process.GameDB.resetBlock;
                    process.uiApp.displayMessage("»ÆÖÒ moved left, please go on.");                           
                    process.victory;
                case 5
                    [I,J] = find(process.GameDB.map==5);
                    process.GameDB.map(I,J-1)=5;
                    process.GameDB.map(I-1,J-1)=9;
                    process.GameDB.map(I,J)=0;
                    process.GameDB.map(I-1,J)=0;
                    [I,J] = find(process.GameDB.map==5);
                    X=len*(J-1);
                    Y=len*(5-I);
                    process.uiApp.Button5.Position=[X,Y,len,2*len];
                    process.uiApp.StepNumEditField.Value=process.stepAdd;
                    process.GameDB.resetBlock;
                    process.uiApp.displayMessage("ÕÔÔÆ moved left, please go on.");                           
                    process.victory;
                case 6
                    [I,J] = find(process.GameDB.map==6);
                    process.GameDB.map(I,J-1)=6;
                    process.GameDB.map(I,J)=9;
                    process.GameDB.map(I,J+1)=0;
                    [I,J] = find(process.GameDB.map==6);
                    X=len*(J-1);
                    Y=len*(5-I);
                    process.uiApp.Button6.Position=[X,Y,2*len,len];
                    process.uiApp.StepNumEditField.Value=process.stepAdd;
                    process.GameDB.resetBlock;
                    process.uiApp.displayMessage("¹ØÓð moved left, please go on.");                           
                    process.victory;
                case 71
                    [I,J] = find(process.GameDB.map==71);
                    process.GameDB.map(I,J-1)=71;                    
                    process.GameDB.map(I,J)=0;
                    [I,J] = find(process.GameDB.map==71);
                    X=len*(J-1);
                    Y=len*(5-I);
                    process.uiApp.Button7_1.Position=[X,Y,len,len];
                    process.uiApp.StepNumEditField.Value=process.stepAdd;
                    process.GameDB.resetBlock;
                    process.uiApp.displayMessage("×ä moved left, please go on.");                           
                    process.victory;
                case 72
                    [I,J] = find(process.GameDB.map==72);
                    process.GameDB.map(I,J-1)=72;                    
                    process.GameDB.map(I,J)=0;
                    [I,J] = find(process.GameDB.map==72);
                    X=len*(J-1);
                    Y=len*(5-I);
                    process.uiApp.Button7_2.Position=[X,Y,len,len];
                    process.uiApp.StepNumEditField.Value=process.stepAdd;
                    process.GameDB.resetBlock;
                    process.uiApp.displayMessage("×ä moved left, please go on.");                           
                    process.victory;
                case 73
                    [I,J] = find(process.GameDB.map==73);
                    process.GameDB.map(I,J-1)=73;                    
                    process.GameDB.map(I,J)=0;
                    [I,J] = find(process.GameDB.map==73);
                    X=len*(J-1);
                    Y=len*(5-I);
                    process.uiApp.Button7_3.Position=[X,Y,len,len];
                    process.uiApp.StepNumEditField.Value=process.stepAdd;
                    process.GameDB.resetBlock;
                    process.uiApp.displayMessage("×ä moved left, please go on.");                           
                    process.victory;
                case 74
                    [I,J] = find(process.GameDB.map==74);
                    process.GameDB.map(I,J-1)=74;                    
                    process.GameDB.map(I,J)=0;
                    [I,J] = find(process.GameDB.map==74);
                    X=len*(J-1);
                    Y=len*(5-I);
                    process.uiApp.Button7_4.Position=[X,Y,len,len];
                    process.uiApp.StepNumEditField.Value=process.stepAdd;
                    process.GameDB.resetBlock;
                    process.uiApp.displayMessage("×ä moved left, please go on.");                           
                    process.victory;
            end
        end
        
        function right(process,num)                       
            len=process.GameDB.wid;
            switch num
                case 1
                    [I,J] = find(process.GameDB.map==1);
                    process.GameDB.map(I,J+1)=1;
                    process.GameDB.map(I,J+2)=9;
                    process.GameDB.map(I-1,J+2)=9;
                    process.GameDB.map(I,J)=0;
                    process.GameDB.map(I-1,J)=0;
                    [I,J] = find(process.GameDB.map==1);
                    X=len*(J-1);
                    Y=len*(5-I);
                    process.uiApp.Button1.Position=[X,Y,2*len,2*len];
                    process.uiApp.StepNumEditField.Value=process.stepAdd;
                    process.GameDB.resetBlock;
                    process.uiApp.displayMessage("²Ü²Ù moved right, please go on.");                           
                    process.victory;
                case 2
                    [I,J] = find(process.GameDB.map==2);
                    process.GameDB.map(I,J+1)=2;
                    process.GameDB.map(I-1,J+1)=9;
                    process.GameDB.map(I,J)=0;
                    process.GameDB.map(I-1,J)=0;
                    [I,J] = find(process.GameDB.map==2);
                    X=len*(J-1);
                    Y=len*(5-I);
                    process.uiApp.Button2.Position=[X,Y,len,2*len];
                    process.uiApp.StepNumEditField.Value=process.stepAdd;
                    process.GameDB.resetBlock;
                    process.uiApp.displayMessage("ÕÅ·É moved right, please go on.");                           
                    process.victory;
                case 3
                    [I,J] = find(process.GameDB.map==3);
                    process.GameDB.map(I,J+1)=3;
                    process.GameDB.map(I-1,J+1)=9;
                    process.GameDB.map(I,J)=0;
                    process.GameDB.map(I-1,J)=0;
                    [I,J] = find(process.GameDB.map==3);
                    X=len*(J-1);
                    Y=len*(5-I);
                    process.uiApp.Button3.Position=[X,Y,len,2*len];
                    process.uiApp.StepNumEditField.Value=process.stepAdd;
                    process.GameDB.resetBlock;
                    process.uiApp.displayMessage("Âí³¬ moved right, please go on.");                           
                    process.victory;
                case 4
                    [I,J] = find(process.GameDB.map==4);
                    process.GameDB.map(I,J+1)=4;
                    process.GameDB.map(I-1,J+1)=9;
                    process.GameDB.map(I,J)=0;
                    process.GameDB.map(I-1,J)=0;
                    [I,J] = find(process.GameDB.map==4);
                    X=len*(J-1);
                    Y=len*(5-I);
                    process.uiApp.Button4.Position=[X,Y,len,2*len];
                    process.uiApp.StepNumEditField.Value=process.stepAdd;
                    process.GameDB.resetBlock;
                    process.uiApp.displayMessage("»ÆÖÒ moved right, please go on.");                           
                    process.victory;
                case 5
                    [I,J] = find(process.GameDB.map==5);
                    process.GameDB.map(I,J+1)=5;
                    process.GameDB.map(I-1,J+1)=9;
                    process.GameDB.map(I,J)=0;
                    process.GameDB.map(I-1,J)=0;
                    [I,J] = find(process.GameDB.map==5);
                    X=len*(J-1);
                    Y=len*(5-I);
                    process.uiApp.Button5.Position=[X,Y,len,2*len];
                    process.uiApp.StepNumEditField.Value=process.stepAdd;
                    process.GameDB.resetBlock;
                    process.uiApp.displayMessage("ÕÔÔÆ moved right, please go on.");                           
                    process.victory;
                case 6
                    [I,J] = find(process.GameDB.map==6);
                    process.GameDB.map(I,J+1)=6;
                    process.GameDB.map(I,J+2)=9;
                    process.GameDB.map(I,J)=0;
                    [I,J] = find(process.GameDB.map==6);
                    X=len*(J-1);
                    Y=len*(5-I);
                    process.uiApp.Button6.Position=[X,Y,2*len,len];
                    process.uiApp.StepNumEditField.Value=process.stepAdd;
                    process.GameDB.resetBlock;
                    process.uiApp.displayMessage("¹ØÓð moved right, please go on.");                           
                    process.victory;
                case 71
                    [I,J] = find(process.GameDB.map==71);
                    process.GameDB.map(I,J+1)=71;                    
                    process.GameDB.map(I,J)=0;
                    [I,J] = find(process.GameDB.map==71);
                    X=len*(J-1);
                    Y=len*(5-I);
                    process.uiApp.Button7_1.Position=[X,Y,len,len];
                    process.uiApp.StepNumEditField.Value=process.stepAdd;
                    process.GameDB.resetBlock;
                    process.uiApp.displayMessage("×ä moved right, please go on.");                           
                    process.victory;
                case 72
                    [I,J] = find(process.GameDB.map==72);
                    process.GameDB.map(I,J+1)=72;                    
                    process.GameDB.map(I,J)=0;
                    [I,J] = find(process.GameDB.map==72);
                    X=len*(J-1);
                    Y=len*(5-I);
                    process.uiApp.Button7_2.Position=[X,Y,len,len];
                    process.uiApp.StepNumEditField.Value=process.stepAdd;
                    process.GameDB.resetBlock;
                    process.uiApp.displayMessage("×ä moved right, please go on.");                           
                    process.victory;
                case 73
                    [I,J] = find(process.GameDB.map==73);
                    process.GameDB.map(I,J+1)=73;                    
                    process.GameDB.map(I,J)=0;
                    [I,J] = find(process.GameDB.map==73);
                    X=len*(J-1);
                    Y=len*(5-I);
                    process.uiApp.Button7_3.Position=[X,Y,len,len];
                    process.uiApp.StepNumEditField.Value=process.stepAdd;
                    process.GameDB.resetBlock;
                    process.uiApp.displayMessage("×ä moved right, please go on.");                           
                    process.victory;
                case 74
                    [I,J] = find(process.GameDB.map==74);
                    process.GameDB.map(I,J+1)=74;                    
                    process.GameDB.map(I,J)=0;
                    [I,J] = find(process.GameDB.map==74);
                    X=len*(J-1);
                    Y=len*(5-I);
                    process.uiApp.Button7_4.Position=[X,Y,len,len];
                    process.uiApp.StepNumEditField.Value=process.stepAdd;
                    process.GameDB.resetBlock;
                    process.uiApp.displayMessage("×ä moved right, please go on.");                           
                    process.victory;
            end
        end
        
        function button(process,num)
            process.GameDB.resetBlock;
            if num ==1
                if process.juddown(num)
                    process.down(num);
                elseif process.judup(num) 
                    process.up(num);
                elseif process.judleft(num)
                    process.left(num);                    
                elseif process.judright(num)
                    process.right(num);
                else
                    process.invalid;
                end                
            elseif num==2 || num==3 || num==4 || num==5
                if process.juddown(num)
                    if process.judup(num)
                        process.uiApp.displayMessage('Please click up or down.');
                        process.GameDB.block=num; 
                        process.GameDB.up=1;
                        process.GameDB.down=1;
                    else
                        process.down(num);                        
                    end                      
                elseif process.judup(num) 
                    process.up(num);                  
                elseif process.judleft(num)
                    process.left(num);                    
                elseif process.judright(num)
                    process.right(num);                   
                else
                    process.invalid;
                end  
            elseif num==6
                if process.judleft(num)
                    if process.judright(num)
                        process.uiApp.displayMessage('Please click left or right.');
                        process.GameDB.block=num;
                        process.GameDB.left=1;
                        process.GameDB.right=1;                        
                    else
                        process.left(num);
                    end
                elseif process.judup(num)
                    process.up(num);
                elseif process.juddown(num)
                    process.down(num);
                elseif process.judright(num)
                    process.right(num);
                else
                    process.invalid;
                end                        
            elseif num==71 || num==72 ||num==73 || num==74
                if process.judup(num)
                    if process.juddown(num)
                        process.uiApp.displayMessage('Please click up or down.');
                        process.GameDB.block=num;
                        process.GameDB.up=1;
                        process.GameDB.down=1;
                    elseif process.judleft(num)
                        process.uiApp.displayMessage('Please click up or left.');
                        process.GameDB.block=num;
                        process.GameDB.up=1;
                        process.GameDB.left=1;
                    elseif process.judright(num)
                        process.uiApp.displayMessage('Please click up or right.');
                        process.GameDB.block=num;
                        process.GameDB.up=1;
                        process.GameDB.right=1;
                    else
                        process.up(num);
                    end
                elseif process.juddown(num)
                    if process.judleft(num)
                        process.uiApp.displayMessage('Please click down or left.');
                        process.GameDB.block=num;
                        process.GameDB.down=1;
                        process.GameDB.left=1;
                    elseif process.judright(num)
                        process.uiApp.displayMessage('Please click down or right.');
                        process.GameDB.block=num;
                        process.GameDB.down=1;
                        process.GameDB.right=1;
                    else
                        process.down(num);
                    end
                elseif process.judleft(num)
                    if process.judright(num)
                        process.uiApp.displayMessage('Please click left or right.');
                        process.GameDB.block=num;
                        process.GameDB.left=1;
                        process.GameDB.right=1;
                    else
                        process.left(num);                       
                    end
                elseif process.judright(num)
                    process.right(num);
                else
                    process.invalid;
                end
            end
            
        end
        
    end
        
    
end