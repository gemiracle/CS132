classdef GameDB < handle
    
    properties
        solve
        level
        map
        name
        wid
        step
        block
        up
        down
        left
        right
        mprocessor
        
    end
    
    methods
        function init(DB) 
            DB.block=0; 
            DB.up=0;
            DB.down=0;
            DB.left=0;
            DB.right=0;
            DB.wid=64;            
            DB.step=0;
            
        end
        function resetBlock(DB)
            DB.block=0;
            DB.up=0;
            DB.down=0;
            DB.left=0;
            DB.right=0;
        end
    end
    
    
end