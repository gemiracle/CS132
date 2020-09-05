classdef TestCase < matlab.uitest.TestCase
    properties
        ff
    end
    methods (TestMethodSetup)
    
        function launchUI(testCase)
            testCase.ff=FirstUI;
            
            testCase.addTeardown(@delete,testCase.ff);
            testCase.addTeardown(@delete,testCase.ff.s);
            testCase.addTeardown(@delete,testCase.ff.T);
            testCase.addTeardown(@delete,testCase.ff.lui);
            testCase.addTeardown(@delete,testCase.ff.rui);
        end
    end
    
    methods (Test)  
        function test4(testCase)%%%
            testCase.verifyEqual(testCase.ff.lui.FloorGauge.Value,1);
            testCase.verifyEqual(testCase.ff.rui.FloorGauge.Value,1);
        end
        function test1(testCase)%%%
            testCase.press(testCase.ff.lui.Button_3);
            pause(5);
            testCase.verifyEqual(testCase.ff.lui.FloorGauge.Value,3);
        end
        function test2(testCase)%%%
            testCase.press(testCase.ff.T.DOWNButton);
            pause(3);
            testCase.press(testCase.ff.s.DOWNButton);
            pause(3);
            testCase.verifyEqual(testCase.ff.lui.FloorGauge.Value,2);
        end
        function test3(testCase)%%%
            testCase.verifyEqual(testCase.ff.lui.FloorGauge.Value,testCase.ff.EditField_1.Value);
        end
        
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
end