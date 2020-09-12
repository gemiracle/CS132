classdef InjectionDB < handle
   
    properties
        recordingList = []
        processor
    end
    
    methods
        function regist(db,record)
            db.recordingList = [db.recordingList;record];
        end
        
        function dismissRecord(db)
            db.recordingList = [];
        end
        
        function getStart(db,target)
            switch target.way
                case 'Baseline'
                    while db.processor.physicianApp.PKperday < 3 && db.processor.physicianApp.PKperhour < 1 && db.processor.physicianApp.permit == 1
                        db.processor.physicianApp.PKperday = db.processor.physicianApp.PKperday + target.painkillerAmount;
                        db.processor.physicianApp.AmountD.Text = sprintf('%.2f ml',db.processor.physicianApp.PKperday);
                        db.processor.physicianApp.PKperhour = db.processor.physicianApp.PKperhour + target.painkillerAmount;
                        db.processor.physicianApp.AmountH.Text = sprintf('%.2f ml',db.processor.physicianApp.PKperhour);
                        pause(1);
                    end
                case 'Bolus'
                    db.processor.physicianApp.PKperday = db.processor.physicianApp.PKperday + target.painkillerAmount;
                    db.processor.physicianApp.AmountD.Text = sprintf('%.2f ml',db.processor.physicianApp.PKperday);
                    db.processor.physicianApp.PKperhour = db.processor.physicianApp.PKperhour + target.painkillerAmount;
                    db.processor.physicianApp.AmountH.Text = sprintf('%.2f ml',db.processor.physicianApp.PKperhour);
            end
        end
        
    end
    
end