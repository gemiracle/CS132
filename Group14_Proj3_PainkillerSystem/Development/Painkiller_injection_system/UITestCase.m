classdef UITestCase < matlab.uitest.TestCase
    properties
        Patient
        Physician
    end
    
    methods (TestMethodSetup)
        function launchUI(testCase)
            testCase.Patient = PatientUI;
            testCase.Physician = PhysicianUI;
            
            Database = InjectionDB;
            Processor = InjectionProcessor;

            Processor.patientApp = testCase.Patient;
            Processor.physicianApp = testCase.Physician;
            Processor.injectionDB = Database;

            Database.processor = Processor;

            testCase.Patient.DB = Database;
            testCase.Patient.Pro = Processor;
            testCase.Patient.physician = testCase.Physician;

            testCase.Physician.DB = Database;
            testCase.Physician.Pro = Processor;
            testCase.Physician.patient = testCase.Patient;
            
            testCase.addTeardown(@delete,testCase.Physician);
            testCase.addTeardown(@delete,testCase.Patient);
        end
    end
    
    methods (Test)
        function test_Baseline_Hour_Day(testCase)
            testCase.type(testCase.Physician.BaselineamountEditField,0.05);
            pause(1);
            testCase.press(testCase.Physician.ConfirmButton);
            pause(1);
            testCase.press(testCase.Physician.StartButton);
            
            testCase.press(testCase.Physician.StartButton);
            pause(1);
            pause(13);
            
            testCase.verifyEqual(testCase.Physician.RecordList.Data{1},'Baseline');
            testCase.verifyEqual(testCase.Physician.BasePK,0.05);
            testCase.verifyEqual(testCase.Physician.PKperday,0);
            testCase.verifyEqual(testCase.Physician.PKperhour,0);
        end
        
        function test_BolusRequest(testCase)
            testCase.type(testCase.Physician.BolusamountEditField,0.5);
            pause(1);
            testCase.press(testCase.Physician.ChangeButton);
            pause(1);
            testCase.press(testCase.Patient.RequestButton);
            pause(1);
            testCase.press(testCase.Patient.RequestButton);
            pause(1);
            testCase.press(testCase.Patient.RequestButton);
            pause(3);
            
            testCase.verifyEqual(testCase.Physician.PKperhour,1);
            testCase.verifyEqual(testCase.Physician.RecordList.Data{1},'Bolus');
            testCase.verifyEqual(testCase.Physician.BoluPK,0.5);
        end
    end
    
end