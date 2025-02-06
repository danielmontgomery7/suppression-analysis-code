function varargout = find_closest_value(varargin)
    % find the closest values of each of the elements in vector V within array A 
    % Input 1: Vector V
    % Input 2: Array A
    % Input 3: options ('closest', 'floor', 'ceil')
    % Output 1: index of closest values in array A
    % Output 2: closest value in B to each element in A
    % Output 3: difference between closest value and input values
    
%% Inputs
    V = varargin{1};
    A = varargin{2};
    if nargin == 3
        options = lower(string(varargin{3}));
    else
        options = "closest"; % default
    end

%% Calculations
    temp_mat = repmat(A,[1 length(V)]);
    difference = temp_mat-V.';

    if options == "floor" % only consider values of A smaller than each element of V
        difference(difference > 0) = nan;
    elseif options == "ceil"
        difference(difference < 0) = nan;
    end
        
    [minValue,closestIndex] = min(abs(difference));
    closestValue = A(closestIndex);
        
%% Outputs
    varargout{1} = closestIndex;
    varargout{2} = closestValue;
    varargout{3} = minValue;
    varargout{4} = options;