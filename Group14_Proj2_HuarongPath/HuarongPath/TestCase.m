classdef TestCase < matlab.uitest.TestCase
    properties
        userUI
        GameDatabase
        MapDatabase
        Processor
       
    end
    
    methods (TestMethodSetup)
    
        function launchUI(testCase)
            testCase.userUI = UserUI;                  
            testCase.GameDatabase = GameDB;
            testCase.MapDatabase = MapDB;
            testCase.Processor = MovementProcessor;

            testCase.Processor.uiApp = testCase.userUI;
            testCase.Processor.GameDB = testCase.GameDatabase;
            testCase.Processor.MapDB = testCase.MapDatabase;

            testCase.GameDatabase.mprocessor = testCase.Processor;
            testCase.MapDatabase.mprocessor = testCase.Processor;

            testCase.userUI.movementProcessor = testCase.Processor;
            
            testCase.addTeardown(@delete,testCase.userUI);
        end
    end
    
    methods (Test)
        %测试Game Level,方向按键和不合法输入反馈功能
         function test_selectLevel_directionKey_illegalSelect(testCase)
             testCase.press(testCase.userUI.GameLevelButton)
             pause(1);
             testCase.press(testCase.userUI.level.Button3);
             pause(1);             
             testCase.verifyEqual(testCase.userUI.TextArea_2.Value,{'齐头并前'});
             testCase.press(testCase.userUI.Button1);
             pause(1);
             testCase.verifyEqual(testCase.userUI.Text1.Value,{'You can not move this block! Please try others!'});
             testCase.press(testCase.userUI.Button6);
             pause(1);
             testCase.press(testCase.userUI.Button7_2);
             pause(1);
             testCase.press(testCase.userUI.Button7_2);
             pause(1);
             testCase.press(testCase.userUI.leftButton);
             pause(1);
             testCase.verifyEqual(testCase.userUI.Text1.Value,{'Please click up or right.'});
             testCase.press(testCase.userUI.upButton);
             pause(1);
             testCase.verifyEqual(testCase.userUI.Text1.Value,{'卒 moved up, please go on.'});
         end
        
        %测试random及restart功能
        function test_random(testCase)
            testCase.Processor.init(1);
            testCase.press(testCase.userUI.RandomButton);
            pause(1)  
            testCase.press(testCase.userUI.RandomButton);
            pause(1)
            testCase.press(testCase.userUI.RandomButton);
            pause(1)
            testCase.verifyEqual(testCase.userUI.Text1.Value,{'Random mode, please move blocks!'});
            testCase.press(testCase.userUI.RestartButton);
            pause(1)
            testCase.verifyEqual(testCase.userUI.StepNumEditField.Value,0);
        end
        
        %测试victory()及步数统计器
        function test_Win_stepNum(testCase)
            testCase.press(testCase.userUI.Test)
            pause(0.5);
            testCase.press(testCase.userUI.Button7_1)
            pause(0.5);
            testCase.press(testCase.userUI.Button7_2)
            pause(0.5);
            testCase.press(testCase.userUI.rightButton)
            pause(0.5);
            testCase.press(testCase.userUI.Button4)
            pause(0.5);
            testCase.press(testCase.userUI.Button2)
            pause(0.5);
            testCase.press(testCase.userUI.Button2)
            pause(0.5);
            testCase.press(testCase.userUI.upButton)
            pause(0.5);
            testCase.press(testCase.userUI.Button1)
            pause(0.5);
            testCase.press(testCase.userUI.Button3)
            pause(0.5);
            testCase.press(testCase.userUI.Button5)
            pause(0.5);
            testCase.press(testCase.userUI.Button7_1)
            pause(0.5);
            testCase.press(testCase.userUI.Button7_2)
            pause(0.5);
            testCase.press(testCase.userUI.Button3)
            pause(0.5);
            testCase.press(testCase.userUI.Button6)
            pause(0.5);
            testCase.press(testCase.userUI.Button7_4)
            pause(0.5);
            testCase.press(testCase.userUI.Button7_3)
            pause(0.5);
            testCase.press(testCase.userUI.Button7_4)
            pause(0.5);
            testCase.press(testCase.userUI.Button7_3)
            pause(0.5);
            testCase.press(testCase.userUI.rightButton)
            pause(0.5);
            testCase.press(testCase.userUI.Button1)
            pause(0.5);
            testCase.press(testCase.userUI.Button4)
            pause(0.5);
            testCase.press(testCase.userUI.Button2)
            pause(0.5);
            testCase.press(testCase.userUI.Button7_2)
            pause(0.5);
            testCase.press(testCase.userUI.Button7_1)
            pause(0.5);
            testCase.press(testCase.userUI.Button7_2)
            pause(0.5);
            testCase.press(testCase.userUI.Button7_1)
            pause(0.5);
            testCase.press(testCase.userUI.leftButton)
            pause(0.5);
            testCase.press(testCase.userUI.Button3)
            pause(0.5);
            testCase.press(testCase.userUI.Button5)
            pause(0.5);
            testCase.press(testCase.userUI.Button6)
            pause(0.5);
            testCase.press(testCase.userUI.Button7_3)
            pause(0.5);
            testCase.press(testCase.userUI.Button7_3)
            pause(0.5);
            testCase.press(testCase.userUI.rightButton)
            pause(0.5);
            testCase.press(testCase.userUI.Button1)
            pause(3);
            testCase.verifyEqual(testCase.userUI.Text1.Value,{'You win! Congratulations! Please press restart or quit. Thanks for playing.'});
            testCase.verifyEqual(testCase.userUI.StepNumEditField.Value,29);
        end
    end
    
end