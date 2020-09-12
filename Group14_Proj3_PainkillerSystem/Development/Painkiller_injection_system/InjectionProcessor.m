classdef InjectionProcessor < handle
    
    properties
        patientApp
        physicianApp
        injectionDB
    end
    
    methods
        function [record,result] = createRecord(processor,way,pkAmount)
            record.way = way;
            record.painkillerAmount = pkAmount;
            if processor.physicianApp.time < 10 && processor.physicianApp.count < 10
                record.startTime = sprintf('0%d:0%d',processor.physicianApp.time,processor.physicianApp.count);
            elseif processor.physicianApp.time >= 10 && processor.physicianApp.count < 10
                record.startTime = sprintf('%d:0%d',processor.physicianApp.time,processor.physicianApp.count);
            elseif processor.physicianApp.time < 10 && processor.physicianApp.count >= 10
                record.startTime = sprintf('0%d:%d',processor.physicianApp.time,processor.physicianApp.count);
            else
                record.startTime = sprintf('%d:%d',processor.physicianApp.time,processor.physicianApp.count);
            end     
            result = 'Fail';
            switch way
                case 'Baseline'
                    if processor.physicianApp.PKperday < 3 && processor.physicianApp.PKperhour < 1
                        result = 'Success';
                        record.finishTime = '';
                    end
                case 'Bolus'
                    if processor.physicianApp.PKperday < 3 && 1 - processor.physicianApp.PKperhour >= pkAmount
                        result = 'Success';
                        record.finishTime = '';
                    end
            end
        end
        
        function displayMessage(processor,mes,who)
            switch who
                case 'Physician'
                    processor.physicianApp.Message.Text = [processor.physicianApp.Message.Text;{mes}];
                case 'Patient'
                    processor.patientApp.Message.Text = [processor.patientApp.Message.Text;{mes}];
            end
        end
        
    end
    
end