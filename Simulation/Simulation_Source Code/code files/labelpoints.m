function [h, ext] = labelpoints (xpos, ypos, labels, varargin)
%  [h, ext] = labelpoints (xpos, ypos, labels, position, buffer, adjust_axes, varargin)
%
%   Given x and y position vectors (xpos, ypos) and given 
%     a vector of labels this script will label all data points 
%     and output the label handles in vector, h and the label extents in ext. 
%
% ***REQUIRED INPUTS (the basics)***************
%
%   'xpos' and 'ypos' are x and y position vectors for your labels.  xpos & ypos
%     should be the same length unless all lables fall along the same x or y line.
%     (see examples).
%
%   'labels' should be a cell or numerical array of the same length as xpos or ypos.
%     Alternatively it can be a string (or single number) that will be replicated  
%     for all labels (see examples).
%
%   Example: labelpoints([.1,.2,.3], [.2 .4 .6], {'lable 1' 'label 2' 'label 3'});
%
% *** OPTIONAL INPUTS **************************
%
%   'position' (optional) describes the position of the labels relative to their 
%     (x,y) location by entering one of the following abbreviated compass directions
%     in single quotes (default is 'NW'):   N, S, E, W, NE, NW, SE, SW, center, C
%
%   'buffer' (optional) is a number generally between 0:1 that adds distance between
%     the label and the plotted point where 0 (default) is 0 distance and 1 is 1/10th 
%     of the axis length.  Ignored for 'center' position.  The value can be greater than 
%     1 or less than 0 too where negative buffer will shift in the opposite direction.  
%
%   'adjust_axes' (optional, default=0): depending on the positioning of labels, 
%     some may fall beyond the axis limits. adjust_axes = 1 will re-adjust xlim 
%     & ylim slightly so labels are not beyond axis limits.
%
%   Example: labelpoints([.1,.2,.3], [.2 .4 .6], {'lable 1' 'label 2' 'label 3'}, 'SE', 0.2, 1);
%
% *** OPTIONAL PARAMETERS **************************
%
%   'stacked' (optional): Automatically stacks multiple labels so they are stacked 
%     vertically or horizontally. When using 'stacked' only the first xpos and ypos 
%     coordinates will be used to plot the 1st label and the following coordinates 
%     will be determined by the desired stack type.  Stack types include:
%       'down' - stacks vertically, downward. xpos and ypos indicate position of top most lable. (default)
%       'up'   - stacks vertically, upward.  xpos and ypos indicate position of bottom lable. 
%       'right'- stacks horizontally, rightward.  xpos and ypos indicate pos of left most label.
%       'left' - stacks horizontally, leftward. xpos and ypos indicate pos of right most lable. 
%     You can also adjust the spacing between the labels like this:
%       'down_1.5' increases the inter-label distance by x1.5(default is 1)
%       'left_0.5' decreases the inter-label distance by x0.5
%       Values >1 increase the distances, values between 0:1 cause labels to overlap.
%     Note that 'position', 'FontSize', and 'rotation' inputs still affect all lables. 
%     You cannot use any outliers when using 'stacked'.  The buffer also affects placement of the stack. 
%
%     Example:  labelpoints(0.5, 0.9, {'a','b','c','d','e','f','g'}, 'stacked', 'down')
%               labelpoints(0.1, 0.5, {'A','B','C','D','E','F','G'}, 'stacked', 'right_2.8')
%               labelpoints(0.3, 0.1, {'A','B','C','D','E','F','G'}, 'stacked', 'up')
%
%   This function includes optional parameters to identify and label only the outliers.
%   This can come in handy when there are many points and you are interested in labeling outliers only.
%   NaNs values will be ignored. There are several ways to identify outliers: (may require stats toolbox)  
%       'outliers_SD', N   -  will only label points that are greater than N standard deviations from 
%                             mean(xpos) or mean(ypos). Alternatively, label N standad deviations from 
%                             any (X,Y) point by making N a 3-element vector [N standard dev, X, Y].
%                           * Example: labelpoints(rand(1,100),rand(1,100),1:100,'outliers_SD', 1.5);
%                           * Example: labelpoints(rand(1,100),rand(1,100),1:100,'outliers_SD',[1.5,.8,.8]);        
%       'outliers_Q', N    -  will only label points that are greater than N times the interquartile range 
%                             of xpos or ypos.
%       'outliers_N', N    -  will calculate the distance of each point from the mean point(xpos,ypos) 
%                             and will label the N-furthest points. Alternatively, N can be a decimal
%                             to label N% of the points. Alternatively, label the N (or 0.N) furthest 
%                             points from any (X,Y) point by making N a 3-element vector [N, X, Y];
%                           * Example: labelpoints(rand(1,100),rand(1,100),1:100,'outliers_N', 8);     
%                           * Example: labelpoints(rand(1,100),rand(1,100),1:100,'outliers_N', 0.2);   
%                           * Example: labelpoints(rand(1,100),rand(1,100),1:100,'outliers_N', [8,.1,.1]); 
%       'outliers_lim', {[x1 x2; y1 y2]; 'and'}
%                          -  labels points that fall *outside* of a certain x or y range.
%                             In the example above, points will be labeled whose x values are not between 
%                             x1 and x2 'and' y values not between y1 and y2. The 'and' is a flag that 
%                             declares that each point must meet,both the x and y requirements.  
%                             Using 'or' instead of 'and' will label points that meet either x or y requirement 
%                             ('or' is default).  Using 'invert' will lable points that fall *within* the x and y 
%                             ranges.  Use inf or -inf in the x1,x2,y1,y2 values to have a limitless bound. 
%                           * Example: labelpoints(rand(1,100),rand(1,100),1:100,'c','outliers_lim', {[.5,.9,.5,.9]; 'and'}); 
%                                      hold on; rectangle('position', [.5,.5,.4,.4]); axis([0,1,0,1])
%                           * Example: Replace 'and' with 'or' above; then try 'invert'.
%       'outliers_lin', {slope, Y-int, type, N}
%                          -  label points that have high residual values according to a linear
%                             fit of the data.  Slope & Y-int are the slope and y intercept of the 
%                             line that is being compared to the data.  Outliers can either be 
%                             identified as 'N' standard deviations of the y value from the line
%                             when 'type' is 'SD':  example: {1,0,'SD',2}}.  Alternatively, the N 
%                             greatest residuals (when N>1) or N% of the greatest residuals (when N<1)
%                             can be chosen as outliers:  example: {1,0,'N', 10} or {1,0,'N',0.25}.
%                             The 'slope' and 'int' can be left out and the regression line will be
%                             calculated based on x,y values.  Example:  {'sd', 1.5} or {'','',n,0.3}.
%                           * Example: x=[0:0.01:1]; y=[0:0.01:1]+rand(1,101); labs=[1:101];plot(x,y, 'o');
%                              * labelpoints(x,y,labs,'outliers_lin',{'sd', 1.5});     
%                              * labelpoints(x,y,labs,'outliers_lin',{1,0,'sd',1.5});
%                              * labelpoints(x,y,labs,'outliers_lin',{'N', 3});                               
%
%   The following parameters may also be entered in any order
%     'FontSize', N -   font size of all labels
%     'Color', S    -   font color of all labels ('y' 'm' 'c' 'r' 'g' 'b' 'w' 'k') or RGB vector [x x x] 
%     'rotation', N -   will rotate the labels N degrees and will place center of label according to 'position' input.  
%                       (positive is counterclockwise). You might slightly increase buffer for rotated text. 
%
%   The interpreter is set to 'none' so that any underscores (_) will appear as underscores, etc. 
%   To change this parameter (or any text parameter), use the output which is a vector of handles for all text elements.  
%     Example:  h=labelpoints(....);  set(h, 'interpreter', 'latex');
%   If labelpoints is not writing to the desired axes, make the axes current before labeleing using axes(axis-handle).
%
% *** MORE EXAMPLES *********************************
%
%      %Make Fake Data:
%       x = 1:10;  y=rand(1,10); 
%       scatter(x,y)
%       labs = {'a' 'b' 'c' 'd' 'middle' 'f' 'g' 'h' 'i' 'last'};
%   
%      Label Examples
%       txt_h = labelpoints(x, y, labs);                                                                                                                                                        
%       txt_h = labelpoints(x, y, labs, 'E', 0.15);                                     
%       txt_h = labelpoints(x, y, labs, 'E', 0.15, 1);                                 
%       txt_h = labelpoints(x, y, labs, 'W', 0.15, 1, 'FontSize', 14, 'Color', 'r');    
%       txt_h = labelpoints(x, y, labs, 'W', 0.15, 1, 'FontSize', 12, 'Color', [0 .5 .1], 'rotation', 45);  
%       txt_h = labelpoints(min(xlim), max(ylim), labs, 'SE', .18, 'stacked', 'down');  
%       txt_h = labelpoints(max(xlim), min(ylim), 1:10, 'NW', .18, 'stacked', 'left_2.5');
% 
%      Also try these labels:
%       labs = [1:1:10];            
%       labs = {'Sofia' '' '' '' 'Bucharest' '' '' 'Belgrade' '' 'Ankara'}
%       labs = '*';              
%       labs = 'any string';
%
%      When all labels share same xpos or ypos
%         boxplot(1:10)
%         labelpoints(0.8, [3, 5.5, 8], {'25%' '50%' '75%'}, 'center');
%
%      More Outlier Examples
%       Generate Fake Data:
%            x = [rand(1,30), rand(1,8)*2];
%            y = [rand(1,30), rand(1,8)*2];
%            scatter(x, y)
%            labs = 1:38;
%        labelpoints(x, y, labs, 'N', 0.1, 1, 'outliers_N', 5);                  %will label 5 furthest points from mean(x,y)
%        labelpoints(x, y, labs, 'N', 0.1, 1, 'outliers_N', 0.1, 'Color', 'r');  %will label 10% of furthest points from mean 
%        labelpoints(x, y, labs, 'N', 0.1, 1, 'outliers_N', [8,1,0.25]);         %will label 8 furthest points from (1, 0.25)
%        labelpoints(x, y, labs, 'N', 0.1, 1, 'outliers_SD', 2);                 %will label all points > 2 SD from mean
%        labelpoints(x, y, labs, 'N', 0.1, 1, 'outliers_SD', [2,1,0.25]);        %will label all points > 2 SD from (1, 0.25)
%        labelpoints(x, y, labs, 'N', 0.1, 1, 'outliers_Q', 1.5);                %will label points greater that 1.5 x IQR
%        labelpoints(x, y, labs, 'N', 0.1, 1, 'outliers_lim', [0 1])             %will label points where x<0 or x>1 or y<0 or y>1
%        labelpoints(x, y, labs, 'N', 0.1, 1, 'outliers_lim', [-inf 1; -inf 0.5])  %...where x>1 or y>0.5
%        labelpoints(x, y, labs, 'N', 0.1, 1, 'outliers_lim', {[.4 1.2; 0.2 0.6]; 'and'}) %...where x<.4 or >1.2 AND y<0.2 or y>0.6
%        labelpoints(x, y, labs, 'N', 0.1, 1, 'outliers_lim', {[.4 1.2; 0.2 0.6]; 'invert'}) %...where x>.4 or <1.2 AND y>0.2 or y<0.6 
%        labelpoints(x, y, labs, 'N', 0.1, 1, 'outliers_lim', {[-inf inf; -inf 0.6]}) %Labeels any Y value greater than 0.6
%        labelpoints(x, y, labs, 'N', 'outliers_lin', {'sd',1})                  %will label all outliers that are 1sd from regression line  NOTE: MY FAKE DATA IS NOT LINEAR!
%        labelpoints(x, y, labs, 'N', 'outliers_lin', {1,0,'sd',1})              %will label all outliers that are 1sd from unity line (y=x)
%        labelpoints(x, y, labs, 'N', 'outliers_lin', {0,0.5,'N',5})             %will label the top 5 values furthest from y=0.5
% 
%   Alternative use: 
%     Density Distributions:
%       x = randn(1,100); y = 1:100;  
%       scatter(x,y)
%       labs = '|';
%       txt_h = labelpoints(x, 8, labs, 'center');
%
%     Single Labeling
%       x = 2004:2013;  y=rand(1,10); 
%       plot(x,y,'-o')
%       labs = 'acquisition';
%       labelpoints(x(3), y(3), labs, 'N', 0.2, 1);
%       labelpoints(2008.5, min(ylim), {['labelpoints.m   ', datestr(now, 'mm/dd/yy')]}, 'N', 0.3, 0, 'fontsize', 12, 'color', 'm');
% 
%     Use labels instead of markers
%       x = randn(1,15); y = randn(1,15);
%       labs = char('a'+(1:15)-1)';
%       labelpoints(x, y, labs, 'center', 0, 1, 'color', 'b');
%
%     Place notes on your plot
%       x = randn(1,100); y = 1:100;  
%       scatter(x,y); xlim([-6,4])
%       labelpoints(-6, 100, {date, 'New York', '8-day span', 'p<0.001', ' ', 'This is easy'}, 'SE', 0.3, 'stacked', 'down')
%
%  140331 v.1 
%  141115 v.2
%  151230 v.3
% Copyright (c) 2014, Adam Danz  adam.danz@gmail.com
%All rights reserved

% source: http://www.mathworks.com/matlabcentral/fileexchange/46891-labelpoints

% Changes history
%   11/02/14    if labels are entered as char, they are convered to cell
%   11/03/14    varargin added to accomodate auto_outlier feature
%   11/03/14    convert inputs to row vector if they are column vectors
%   11/04/14    now position in put is not case sensitive
%   11/04/14    now 1 label can be entered to label multiple points
%   11/04/14    now fontsize and color can be specified by params
%   11/05/14    changed 'outlier' to 'outlier_SD' and added 'outlier_Q'
%   11/07/14    added option to rotate test
%   11/15/14    added 'outliers_N' input option and cleaned up text rotation section.
%   11/19/14    curr_extent is not always a cell.  fixed.  
%   11/20/14    when outliers_N is selected N is min(N, lenght(xpos));
%   11/21/14    removes entire point and label when there is an 'inf' value
%   12/14/14    fixed 'curr_extent' in rotation section 
%   08/22/15    edited help file (buffer can be <>0/1)
%   09/01/15    commented-out warning that there are no outlier to label.
%   09/13/15    added outliers_lim option & set interpreter to none.
%   09/19/15    added ext output
%   09/20/15    removed validity check for color and allow 3-el vectors now. 
%   10/09/15    added if nargout > 0.  !! Changed outlier section to deal with NaNs.  
%               The code performs stats (ie, nanmedian, nanstd) on all data but when chosing labels, 
%               only considers xpos ypos pairs that do not have NaN. See pairIDX.
%               changed text rotation to always center and added 'factor' section.  
%   10/28/15    Changed outlier section from if/then to switch case. Added outlier_lin section!
%   12/21/15    Added 'stacked' input option - major addition, no change to previous functionality. 
%   12/30/15    adjustments to help section; combined 2 sections at beginning that deal with text rotation.
%               *Changed medians to means in outlier section.
%               *Added more flexibility to some outlier inputs so user can identify their own center.
%               *added option to use "c" instead of "center" for position.


%%
% Check Class of 'labels'
    %If 'labels' are numerical, convert to cell
    if isnumeric(labels) == 1
        labels = num2cell(labels); 
    end

    % if 'labels' are char, convert to cell
    if ischar(labels)
        labels = cellstr(labels);
    end
    
% if all labels share the same xpos or ypos (only 1 value entered in 1 of the position vectors)
    if length(xpos)==1 && length(ypos)>1
        xpos = repmat(xpos, size(ypos));
    elseif length(ypos)==1 && length(xpos)>1
        ypos = repmat(ypos, size(xpos));
    end
    
% if only one lable is entered for all points, replicate it
    if length(labels)==1 && length(xpos) > 1
        labels = repmat(labels, [1, length(xpos)]);
    end
    
% ensures xpos, ypos, and labels are all row vectors 
    if iscolumn(xpos);      xpos = xpos';       end
    if iscolumn(ypos);      ypos = ypos';       end
    if iscolumn(labels);    labels = labels';   end

%By this point, xpos, ypos and labels should all be same length EXCEPT if optional input 'stacked' is used
% indicate error otherwise.
    if isequal(length(xpos), length(ypos), length(labels)) == 0 && sum(strcmp('stacked', varargin))==0
        error('xpos, ypos, and labels must all be the same length unless using one input for labels.')
    end
    
%if an 'inf' value is entered, this will eliminate that entire point and label
    xinf = find(xpos==inf);
    yinf = find(ypos==inf);
    findinf = [xinf yinf];
    if ~isempty(findinf)
        xpos(findinf)=[];
        ypos(findinf)=[];
        labels(findinf) = [];
    end       
    
%Validate inputs and optional parameters
  %for help, see https://www.mathworks.com/help/matlab/ref/inputparser.addparameter.html#inputarg_validationFcn
  % and https://www.mathworks.com/help/matlab/ref/validateattributes.html
    validPositions = {'N' 'NE' 'E' 'SE' 'S' 'SW' 'W' 'NW' 'center' 'C'};
    checkPosition = @(x) any(validatestring(x, validPositions));

    p = inputParser;
    p.FunctionName = mfilename;
    addRequired(p, 'xpos', @isnumeric);
    addRequired(p, 'ypos', @isnumeric);
    addRequired(p, 'labels');
    addOptional(p, 'position', 'NW', checkPosition);
    addOptional(p, 'buffer', 0, @isnumeric);
    addOptional(p, 'adjust_axes', 0, @isnumeric);

    addParameter(p, 'outliers_SD', 3, @isnumeric);
    addParameter(p, 'outliers_Q', 1.5, @isnumeric);
    addParameter(p, 'outliers_N', 1, @isnumeric);
    addParameter(p, 'outliers_lim', [0,0;0,0]);
    addParameter(p, 'outliers_lin', {'SD',1});
    
    addParameter(p, 'stacked', 'down');

    addParameter(p, 'FontSize', 10, @isnumeric);
    addParameter(p, 'Color', 'k');
    addParameter(p, 'rotation', 0, @isnumeric);
    parse(p, xpos, ypos, labels, varargin{:})

%calculate buffer
    a = axis/10;% I've somewhat arbitrarily divided by 10 to make 'buffer' more sensitive
    u1 = 0;     %x offset
    u2 = 0;     %y offset
    
%assign position
    switch upper(p.Results.position) 
        case 'E',       va = 'middle'; ha = 'left';         u1 = a(2)-a(1);         
        case 'W',       va = 'middle'; ha = 'right';        u1 = (a(2)-a(1))*-1;
        case 'N',       va = 'bottom'; ha = 'center';       u2 = a(4)-a(3);
        case 'S',       va = 'top';    ha = 'center';       u2 = (a(4)-a(3))*-1;
        case 'NE',      va = 'bottom'; ha = 'left';         u1 = (a(2)-a(1))/2;     u2 = (a(4)-a(3))/2;
        case 'NW',      va = 'bottom'; ha = 'right';        u1 = (a(2)-a(1))*-0.5;  u2 = (a(4)-a(3))/2;
        case 'SE',      va = 'top';    ha = 'left';         u1 = (a(2)-a(1))/2;     u2 = (a(4)-a(3))*-0.5;
        case 'SW',      va = 'top';    ha = 'right';        u1 = (a(2)-a(1))*-0.5;  u2 = (a(4)-a(3))*-0.5;
        case {'CENTER', 'C'},  va = 'middle'; ha = 'center'; 
    end
    
%Factor in buffer
    u1 = u1*p.Results.buffer;   %applied to X
    u2 = u2*p.Results.buffer;   %applied to Y
    
%adjust u1, u2 if rotation is enabled 
%  rotation centers text on data point no matter what the position input is. 
%  so here we increase the distance from the point a tad to compensate for the lack of true alignment. 
    if p.Results.rotation~=0           
        factor = 1.2; %arbitrary, 1=no change, <1 means shift toward dot, >1 means shift away from dot. 
        u1 = u1*factor;
        u2 = u2*factor;
        %if we are rotating the text, we'll initially plot it centered - this must happen before plotting lablels.
        va = 'middle'; ha = 'center';
    end
    
% Index (1/0) of all paired data (ie, if 1 or both coordinates are NaN, pairIDX(i) is 0.
% This may be used in identifying outliers but should NOT be used to calculate stats on xpos or ypos
    pairIDX = ~isnan(xpos) & ~isnan(ypos);

%% stacked text section (should come before outlier section)
if sum(strcmp('stacked', varargin))==1
    %if optional input 'stacked' is being used, make sure user isn't confused by using option incompatable params
    %if more than 1 xpos or ypos is entered...
    if length(xpos)>1 || length(ypos)>1                     
        warning('Only the first xpos and ypos will be used to initiate stacked text');
    end
    %if outliers are entered in input, remove them from varargin
    if ~isempty(cell2mat(regexp(varargin(cellfun(@ischar, varargin)), 'outlier')))      
        warning('Cannot use stacked and outlier input parameters at the same time.  Outliers input will be ignored');
        tempvarargin = varargin;
        tempvarargin(cellfun(@isnumeric, tempvarargin)) = {'temp_replace'};    %numeric values prevent use of regexp()
        varargIDX = find(~cellfun(@isempty,regexp(tempvarargin, 'outlier')));
        varargin([varargIDX, varargIDX+1]) = [];    %removes outlier input and its associated param from vararin
    end
    
    %internal parameter defaults
    spacing = 1;
    stacktype = lower(p.Results.stacked); 
    
    %detect if user added optional spacing parameter (example: 'down_1.5')
    %if detected, this separates the stacktype from spacing 
    if ~isempty(strfind(stacktype, '_'))
        spacing = str2double(stacktype(strfind(stacktype, '_')+1:end));
        stacktype = stacktype(1:strfind(stacktype, '_')-1);
    end
    
    %Check that user entered a valid stacktype
    if ~any(strcmp(stacktype, {'up', 'down', 'left', 'right'}))
        error('Text stacking options are:  up, down, left, or right (not case sensitive)');
    end        
    
    %labels=labels{1};
    %clear xpos and ypos vectors after initial points
    nlabs = length(labels); %number of labels
    xpos(min(2, nlabs):nlabs) = nan;
    ypos(min(2, nlabs):nlabs) = nan;
    
   %get xpos and ypos for all other lables
    for s = 2:nlabs
        
        %Temperarily plot the s-1 label, get its position, then delete it.
        temphand = text(xpos(s-1)+u1 , ypos(s-1)+u2, labels(s-1), 'VerticalAlignment',va, 'HorizontalAlignment',ha, 'FontSize', p.Results.FontSize);
        tempextnt = get(temphand, 'extent');
%         delete(temphand)
        
        %Calculate xpos and ypos for label S (this came from stackedtext.m which is now obsolete)
        switch stacktype
            case 'down'
                xpos(s) = xpos(s-1);
                ypos(s) = ypos(s-1) - tempextnt(4)*spacing;
            case 'right'
                ypos(s) = ypos(s-1);
                xpos(s) = xpos(s-1) + tempextnt(3)*spacing;
            case 'up'
                xpos(s) = xpos(s-1);
                ypos(s) = ypos(s-1) + tempextnt(4)*spacing;
            case 'left'
                ypos(s) = ypos(s-1);
                xpos(s) = xpos(s-1) - tempextnt(3)*spacing;
        end %switch  
        
    end %for s = 2
    
end %if sum()
    

%% Outlier section
%If outliers parameters are selected
    outlierNames = {'outliers_SD', 'outliers_Q', 'outliers_N', 'outliers_lim', 'outliers_lin'}; %add new outlier options here
    outlier_flag = false;
    %identify if/which outlier inputs is (or isn't) present
    for c = 1:length(outlierNames)
        if sum(strcmp(varargin, outlierNames{c}))>0;
            outlier_flag = true;  
            outliertype = varargin{strcmp(varargin, outlierNames{c})};  %cell naming outlier type
        end
    end
    %executes chosen outlier type.  The idea is that each case (or type) serves the purpose of identifying what outliers to keep. 
    %so the output of each subsection is the 'outlier_idx' variable which is an index of all lables'
    if outlier_flag 
        switch outliertype
            
            case 'outliers_SD'
                SDs = p.Results.outliers_SD(1);
                % if user specified the 'center' of her data:
                if length(p.Results.outliers_SD) > 1
                    Xcnt = p.Results.outliers_SD(2);
                    Ycnt = p.Results.outliers_SD(3);
                else % if user did not specify center of her data:
                    Xcnt = nanmean(xpos);
                    Ycnt = nanmean(ypos);
                end
                outlier_idx = logical(abs(xpos - Xcnt) > SDs*nanstd(xpos)  |  abs(ypos - Ycnt) > SDs*nanstd(ypos)); %index of outliers
            
            case 'outliers_Q'
                xbounds = [prctile(xpos,25) - p.Results.outliers_Q * iqr(xpos) , prctile(xpos, 75) + p.Results.outliers_Q * iqr(xpos)];   %[lower upper] bounds of outliers
                ybounds = [prctile(ypos,25) - p.Results.outliers_Q * iqr(ypos) , prctile(ypos, 75) + p.Results.outliers_Q * iqr(ypos)];   %[lower upper] bounds of outliers
                outlier_idx = logical(ypos<ybounds(1) | ypos>ybounds(2) |  xpos<xbounds(1) | xpos>xbounds(2));
            
            case 'outliers_lim'
                %assign limits and qualifier
                limvars = p.Results.outliers_lim; %ie, {[5 5; 5 5]; 'or'}
                if iscell(limvars)
                    lims = limvars{1}; 
                    if size(limvars,1) == 1 %default
                        qualifier = 'or';
                    else  qualifier = lower(limvars{2});
                    end
                else
                    lims = limvars;
                    qualifier = 'or';
                end

                if size(lims,1) == 1
                    lims = [lims;lims];
                end

                x_outliers = xpos<lims(1,1) | xpos>lims(1,2);
                y_outliers = ypos<lims(2,1) | ypos>lims(2,2);
                switch qualifier
                    case 'or'
                        outlier_idx = x_outliers | y_outliers;
                    case 'and'
                        outlier_idx = x_outliers & y_outliers;
                    case 'invert'
                        x_outliers = xpos>lims(1,1) & xpos<lims(1,2);
                        y_outliers = ypos>lims(2,1) & ypos<lims(2,2);
                        outlier_idx = x_outliers & y_outliers;
                    otherwise
                        error('The inputs you entered for Outliers_lim wasn''t recognized.')
                end
                
            case 'outliers_N'
                Npts = p.Results.outliers_N(1);
                % if user specified the 'center' of her data:
                if length(p.Results.outliers_N) > 1
                    Xcnt = p.Results.outliers_N(2);
                    Ycnt = p.Results.outliers_N(3);
                else % if user did not specify center of her data:
                    Xcnt = nanmean(xpos);
                    Ycnt = nanmean(ypos);
                end
                if p.Results.outliers_N<1;  
                    N = ceil(length(xpos(pairIDX)) * Npts); 
                else
                    N = min(Npts, length(xpos(pairIDX)));        %ensures that user cannot label more outliers than coordinates.
                end
                 meanpoint = repmat([Xcnt Ycnt], [length(xpos),1]);
                 paired = horzcat(xpos', ypos');
                 distances = (((meanpoint(:,1)-paired(:,1)).^2)  +  ((meanpoint(:,2)-paired(:,2)).^2)).^(1/2);       %all distances from mean
                 [sorted, idx] = sort(distances, 'descend');
                 idx = idx(~isnan(sorted)); %this is to ignore any NaN values in xpos or ypos that would cause an nan distance. 
                 outlier_idx = false(1,length(xpos));
                 outlier_idx(idx(1:N))=1; 
                 
            case 'outliers_lin'
                %user can either enter {slope, yint, outlier type, threshold} -or- {outlier type, threshold}
                %here we control for what user entered or didn't enter
                linvars = p.Results.outliers_lin; %ie, {1,1.1,'sd',1} or {'sd',1}
                if isnumeric(linvars{1}) && ~isempty(linvars{1}) %if user entered own slope and y-int
                    slope = linvars{1};
                    yint = linvars{2};
                    outtype = upper(linvars{3}); %outlier type (sd or n)
                    outthresh = linvars{4};      %threshold (values > threshold are outliers)
                else
                    %calculated slope and y-int of the (x,y) data.
                    if isempty(linvars{1}); linvars = linvars([3,4]); end
                    slope = nansum((xpos-nanmean(xpos)).*(ypos-nanmean(ypos))) / nansum((xpos-nanmean(xpos)).^2);       
                    yint = nanmean(ypos) - (slope * nanmean(xpos));                     %refline(slope,yint)   %To test
                    outtype = upper(linvars{1});
                    outthresh = linvars{2};
                end
                %now calculate residuals (linear estimate - y val)^2
                Yest = slope*xpos + yint;
                resid = (Yest - ypos).^2;
                %now sort residuals > to < similar to 'outliers_N'
                [sorted, idx] = sort(resid, 'descend');
                idx = idx(~isnan(sorted)); %this is to ignore any NaN values in xpos or ypos that would cause an nan distance. 
                %finally, chose the outliers based on chosen method
                if strcmp(outtype, 'SD')
                    outlier_idx = idx(1:sum(nanstd(sorted)*outthresh <= sorted));     %figure; plot(sorted, 'o'); addhorz(nanstd(sorted)*outthresh);  %to view sorted outliers and treshold
                elseif strcmp(outtype, 'N')
                    if outthresh<1;  
                        N = ceil(length(idx) * outthresh); 
                    else
                        N = min(outthresh, length(idx));        %ensures that user cannot label more outliers than coordinates.
                    end
                    outlier_idx = idx(1:N);
                end
        end %outlier switch
        
        xpos = xpos(outlier_idx);               
        ypos = ypos(outlier_idx);
        labels = labels(outlier_idx);

%         if any(outlier_idx) == 0;           %dispay msg if there are no outliers to label
%             mfile = [mfilename,'.m'];
%             disp(['There are no outliers to label in ', mfile,'.'])
%             disp('Change outlier value for less sensitivity; See help file.'); 
%         end
    end %outlier_flag
%%

%Label points
    hand = text(xpos+u1 , ypos+u2, labels, 'VerticalAlignment',va, 'HorizontalAlignment',ha, 'FontSize', p.Results.FontSize, 'color', p.Results.Color);
    extnt = get(hand, 'extent');
    
%Rotate text if specified
    if p.Results.rotation~=0           %if rotation input is something other than 0  (use to be:  sum(strcmp(varargin, 'rotation')) == 1 )
        xl = xlim;      yl = ylim;                          %In case text rotation auto adjusts axes.
        curr_extent = get(hand, 'extent');                     %Need to store current center point of all labels since text rotation relocates position
        if iscell(curr_extent); curr_extent = cell2mat(curr_extent); end
        hold on
        curr_position = [curr_extent(:,1)+(curr_extent(:,3)/2),curr_extent(:,2)+(curr_extent(:,4)/2)];          %uses extent to locate center of label
        set(hand, 'rotation', p.Results.rotation, 'VerticalAlignment','middle', 'HorizontalAlignment','center');  	%note: text rotation changes alignment which is why they need to be centered back to specifications.
        for i = 1:length(hand)                                 %after rotation, reposition lables back to desired location 
            set(hand(i), 'position', curr_position(i,:))
        end
        set(gca, 'xlim', xl); set(gca, 'ylim', yl);         %In case text rotation auto adjusts axes.
    end     
    
%Determine if any labels go beyond axis limits and adjust if desired  (adjust_axes = 0 or 1)
    if p.Results.adjust_axes == 1   &&   ~isempty(hand)    
        x_adj = sign(u1+0.0000001);                 %the addition is to avoid '0'
        y_adj = sign(u2+0.0000001);                 %the addition is to avoid '0'

        labelextent = get(hand, 'extent');
        if isequal(class(labelextent),'cell')
           labelextent = cat(1, labelextent{:});
        end
        xl = xlim;      yl = ylim;
        lablimX = [min(labelextent(:,1)), max(labelextent(:,1)+(labelextent(:,3).*x_adj))] +u1;
        lablimY = [min(labelextent(:,2)), max(labelextent(:,2)+(labelextent(:,4).*y_adj))] +u2;

        xlim([min(min(xl), min(lablimX)), max(max(xl), max(lablimX))])
        ylim([min(min(yl), min(lablimY)), max(max(yl), max(lablimY))])
    end
    
%Turn off Latex interpreter to avoid subscripts with an underscore is used in a label
    set(hand, 'interpreter', 'none')
    
%Outputs
if nargout > 0 
    h   = hand;
    ext = extnt;
end
     
end


%% Notes
% a video (not mine) explaining this method:  http://blogs.mathworks.com/videos/2012/05/30/how-to-label-a-series-of-points-on-a-plot-in-matlab/
% Text properties :  http://www.mathworks.com/help/matlab/ref/text_props.html
% info on input parsing:  http://www.mathworks.com/help/matlab/matlab_prog/parse-function-inputs.html
%                   and   http://www.mathworks.com/help/matlab/ref/inputparser-class.html
% Outlier info : https://docs.oracle.com/cd/E17236_01/epm.1112/cb_statistical/frameset.htm?ch07s02s10s01.html

% future ideas:
    % add the ability to plot text in reference to the figure rather than an axis. Example:
    %    axes('position', [0.001, 0.001, 0.9, 0.1]);
    %    text(0.1, 0.2, sprintf('%s.mat  ( %s )', mfilename, date), 'interpreter', 'none', 'fontsize', 8)
    %    axis off;
    % get hold stats and return it at end :  holdstat = ishold(axh);  Then at end:  if holdstat == 1; holdstat='on'; else holdstat='off'; end;  hold (axh, holdstat);
        
% Note:  For polor plots, polor.m does a lot of behind-the-scenes conversion so this labelpoints func won't work with polar. 
%       Instead, follow this example :
%         h = polar(PSA,PST,'.'); % easiest way to get handle to plot
%         x = get(h,'XData');
%         y = get(h,'YData');
%         text(x,y, ' \leftarrow foo');  % puts same text next to every point
%         text(x(3),y(3),' \leftarrow three'); % puts text next to specific point