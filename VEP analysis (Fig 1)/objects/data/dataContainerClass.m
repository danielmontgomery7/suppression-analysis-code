classdef dataContainerClass < handle
    
    % stores the channels of extracellular data for all imported files
    
    properties
        container = extracellularDataClass.empty()
    end
        
    methods
        
        function self = dataContainerClass()
        end
        
        function add_extracellular_data(self, extracellularDataClass)
            self.container(end+1) = extracellularDataClass;
        end
        
        function data = get_extracellular_data(self)
            data = self.container;
        end
        
        function data = find_extracellular_data(self, labels_to_find)
            data = self.get_extracellular_data();
            data_bool = false(1, length(data));
            for i = 1:length(data)
                data_bool(i) = data(i).contains_labels(labels_to_find);
            end
            data = data(data_bool);
        end
        
    end
    
end