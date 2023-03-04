function plot_heatmap(compl,ID, time_case, player_name)
%nachfolgende Funktion transformiert heatmap_matrix in verständliche Form
load('ID_struct.mat');
trans_heat_map=ID_struct.(strcat('num_',num2str(ID(1))));
for i=2:size(ID)
    trans_heat_map=trans_heat_map+ID_struct.(strcat('num_',num2str(ID(i))));
end

if compl<2
else
    trans_heat_map=trans_heat_map(1:compl*50+1,1:compl*100+1);
end

or=1;
or_str='';
trans_heat_map(trans_heat_map>200)=200;
if or==1
%only halts over 200 are interesting
trans_heat_map(trans_heat_map<200)=0;
or_str='halts over 200ms';
else
trans_heat_map(trans_heat_map>100 & trans_heat_map<200)=150;
trans_heat_map(trans_heat_map>0 & trans_heat_map<100)=75;
end

%transform heatmap_mtrix in picture format
if compl==2
    picture_mtrx_x=zeros(109,273);
    picture_mtrx_y=zeros(109,273);
    
    %x-tausch
    
    picture_mtrx_x(1:101,164:264)= trans_heat_map(:,101:201);
    picture_mtrx_x(1:101,18:118)= trans_heat_map(:,1:101);
    %y-tausch
    picture_mtrx_y(58:108,:)= picture_mtrx_x(51:101,:);
    picture_mtrx_y(2:52,:)= picture_mtrx_x(001:51,:);
end

%transformation when compl>2
if compl>2
    picture_mtrx_x=zeros(compl*56-3,compl*106-3);
    picture_mtrx_y=zeros(compl*56-3,compl*106-3);
    %x:401:501 --> 426:526
    % x:301:401 -->  320:420
    % x:201:301 -->  214:314
    % x:101:201 --> 108:208
    % x:001:101 --> 002:102
    if compl>4
        picture_mtrx_x(1:50*compl+1,426:526)= trans_heat_map(:,401:501);
    end
    
    if compl>3
        picture_mtrx_x(1:50*compl+1,320:420)= trans_heat_map(:,301:401);
    end
    
    if compl>2
        picture_mtrx_x(1:50*compl+1,214:314)= trans_heat_map(:,201:301);
    end
    if compl>1
        picture_mtrx_x(1:50*compl+1,108:208)= trans_heat_map(:,101:201);
        picture_mtrx_x(1:50*compl+1,002:102)= trans_heat_map(:,1:101);
    end
    
    %y-tausch
    %y:201:251 -->226:276
    % y:151:201 --> 170:220
    % y:101:151 --> 114:164
    % y:51:101 -->  58:108
    % y: -->  002:52
    
    
    if compl>4
        picture_mtrx_y(226:276,:)= picture_mtrx_x(201:251,:);
    end
    
    if compl>3
        picture_mtrx_y(170:220,:)= picture_mtrx_x(151:201,:);
    end
    
    if compl>2
        picture_mtrx_y(114:164,:)= picture_mtrx_x(101:151,:);
    end
    if compl>1
        picture_mtrx_y(58:108,:)= picture_mtrx_x(51:101,:);
        picture_mtrx_y(2:52,:)= picture_mtrx_x(001:51,:);
    end
    
end
switch time_case
    case 4
        tc_str='early';
    case 3
        tc_str='middle';
    case 2
        tc_str='late';
    case 1
        tc_str='const';
    otherwise
        tc_str='all time';
end

%plotting area
if compl<2
    fig_name=strcat('Mousemove_','all compl','_',tc_str,'_',player_name,' ',or_str);
    fig_title=strcat({'Mousemove -'},{' '},'all compl',{' '},tc_str,{' '},player_name,' ',or_str);
else
    fig_name=strcat('Mousemove_',num2str(compl),'_x_',num2str(compl),'_',tc_str,'_',player_name,' ',or_str);
    fig_title=strcat({'Mousemove -'},{' '},num2str(compl),{'x'},num2str(compl),{' '},tc_str,{' '},player_name,' ',or_str);
end
fig=figure('name',fig_name);
map_h = [1, 1, 1 %weiß
    0, 1, 0 %grün
    1, 1, 0 %gelb
    1,0,0]; %rot

axes1 = axes('Parent',fig);
heatmap(picture_mtrx_y, 'Colormap',colormap(map_h));

caxis( [0 200] );

h=colorbar(axes1,'southoutside', 'Ticks',[25,75,125,175],'TickLabels',{'0','1-100','101-200','>200'}, 'TickDirection', 'out');
h.Label.String = 'Duration Time [ms]';

title(fig_title, 'Color',[0.6,0.6,0.6],'FontSize',12 );
hold on;

switch compl
    case 5
        pichandle = imread('5x5_layer.png');
    case 4
        pichandle = imread('4x4_layer.png');
    case 3
        pichandle = imread('3x3_layer.png');
    case 2
        pichandle = imread('2x2_layer.png');
    otherwise
        pichandle = imread('5x5_layer.png');
end

I=imshow(pichandle);
alpha(I,'0.6');

savefig(fig_name);

%saveas(fig,fig_name, 'jpg');
saveas(fig,fig_name, 'meta');
close(fig);
end
