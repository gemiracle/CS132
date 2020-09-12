classdef UnitTestCase < matlab.unittest.TestCase
    methods (Test)
        function testRegist(testCase)
            re = PKrecord;
            re.way = 'Bolus';
            re.painkillerAmount = 0.2;
            re.startTime = '12:00';
            re.finishTime = '12:00';
            db = InjectionDB;
            db.regist(re);
            testCase.verifyEqual(re,db.recordingList(1));
        end
        
        function testDismiss(testCase)
            re = PKrecord;
            re.way = 'Bolus';
            re.painkillerAmount = 0.2;
            re.startTime = '12:00';
            re.finishTime = '12:00';
            db = InjectionDB;
            db.regist(re);
            db.dismissRecord();
            testCase.verifyEqual([],db.recordingList);
        end
        
        function testCreateBolus(testCase)
            ph = PhysicianUI;
            pro = InjectionProcessor;
            pro.physicianApp = ph;
            ph.Pro = pro;
            [record,result] = pro.createRecord('Bolus',0.2);
            testCase.verifyEqual('Bolus',record.way);
            testCase.verifyEqual(0.2,record.painkillerAmount);
            testCase.verifyEqual('Success',result);
            testCase.addTeardown(@delete,ph);
        end
        
        function testCreateBaseline(testCase)
            ph = PhysicianUI;
            pro = InjectionProcessor;
            pro.physicianApp = ph;
            ph.Pro = pro;
            [record,result] = pro.createRecord('Baseline',0.04);
            testCase.verifyEqual('Baseline',record.way);
            testCase.verifyEqual(0.04,record.painkillerAmount);
            testCase.verifyEqual('Success',result);
            testCase.addTeardown(@delete,ph);
        end
        
        function testdisplayMessagePhysician(testCase)
            ph = PhysicianUI;
            pa = PatientUI;
            pro = InjectionProcessor;
            pro.physicianApp = ph;
            pro.patientApp = pa;
            ph.Pro = pro;
            ph.patient = pa;
            pa.Pro = pro;
            pa.physician = ph;
            pro.displayMessage('Hello!','Physician');
            testCase.verifyEqual({'Hello!'},ph.Message.Text(end));
            testCase.addTeardown(@delete,ph);
            testCase.addTeardown(@delete,pa);
        end
        
        function testdisplayMessagePatient(testCase)
            ph = PhysicianUI;
            pa = PatientUI;
            pro = InjectionProcessor;
            pro.physicianApp = ph;
            pro.patientApp = pa;
            ph.Pro = pro;
            ph.patient = pa;
            pa.Pro = pro;
            pa.physician = ph;
            pro.displayMessage('Hello!','Patient');
            testCase.verifyEqual({'Hello!'},pa.Message.Text(end));
            testCase.addTeardown(@delete,ph);
            testCase.addTeardown(@delete,pa);
        end
        
    end
end