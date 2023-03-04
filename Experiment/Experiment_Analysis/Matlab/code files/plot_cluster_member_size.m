%zeichnet die Größenentwicklung der Typencluster nach
load('cluster_member_entwicklung.mat');
load('cluster_behavior_type_match.mat');

spielnamen=unique(ergebnisuebersicht_v1{:,2});
spieleranz=zeros(48,1);
cluster_auswahl_name={'ges' 'akqoZD' 'akqmZD' 'verarboZD' 'verarbmZD' 'entsch'};
typen_string={'Type A','Type B','Type C','Type D','Type E','Type F'};
time_vec={'ineffective','moderate','tough','severe'};
compl_vec={'level 2','level 3','level 4','level 5'};
order='Time';
co=[      0    0.4470    0.7410;
    0.8500    0.3250    0.0980;
    0.9290    0.6940    0.1250;
    0.4940    0.1840    0.5560;
    0.4660    0.6740    0.1880;
    0.3010    0.7450    0.9330;
    0.6350    0.0780    0.1840]; %color vector of MatLab default

for i=1:3
    switch i
        case 1
            dataset=ergebnisuebersicht_v1;
            for j=1:size(spielnamen)
                G = regexp(dataset.(2),spielnamen{j},'match');
                F=~cellfun('isempty', G);
                spieleranz(j,1)=sum(F);
            end
            offset_r=0;
        case 2
            dataset=ergebnisuebersicht_v2;
            for j=1:size(spielnamen)
                G = regexp(dataset.(2),spielnamen{j},'match');
                F=~cellfun('isempty', G);
                spieleranz(j+16,1)=sum(F);
            end
            offset_r=16;
        case 3
            
            dataset=ergebnisuebersicht_v3;
            for j=1:size(spielnamen)
                G = regexp(dataset.(2),spielnamen{j},'match');
                F=~cellfun('isempty', G);
                spieleranz(j+32,1)=sum(F);
            end
            offset_r=32;
    end
    
    
    for j=1:6 %Anzahl Heuristikeinteilungen; 1 ges 2 akqoZD 3 akqmZD 4 verarboZD 5 verarbmZD 6 entsch
        fig_name=strcat('v',num2str(i),'_Power_Types_',cluster_auswahl_name{j});
        fig=figure;
        no_diff=true;
        
        switch j
            case 1
                offset_c=0;
            case 2
                offset_c=6;
            case 3
                offset_c=12;
            case 4
                offset_c=18;
            case 5
                offset_c=24;
            case 6
                offset_c=30;
        end
        
%specify dataset
        diff_vec=spieleranz(1+offset_r:16+offset_r,1) - sum(cluster_mem_entwickl(1+offset_r:16+offset_r,1+offset_c:6+offset_c),2);
        diff_vec(diff_vec<0)=0;
        data_set=cluster_mem_entwickl(1+offset_r:16+offset_r,1+offset_c:6+offset_c);
        idx_zeros=find(sum(data_set)==0);
        idx_keep=find(sum(data_set)>0);
        data_set(:,idx_zeros)=[];
%         plot(cluster_mem_entwickl(1:16,1));    
        color_spec={'b','r','y','k'};
        if sum(diff_vec)>0
        bar_var=bar([data_set,diff_vec]);
        no_diff=false;
        else
            bar_var=bar(data_set);
        
        end
        
        
        for f=1:size(data_set,2)
%         bar_var(f).FaceColor=color_spec{f};
        temp_co=num2cell(co(idx_keep(f),:),2);
        bar_var(f).FaceColor=temp_co{1,1};
        end
        
        if no_diff
        else
            bar_var(size(data_set,2)+1).FaceColor='k';
        end
%         hold on
%         bar(diff_vec);
%         ax1 = subplot(2,1,1);
%         bar(ax1,y)
%         
%         ax2 = subplot(2,1,2);
%         bar(ax2,y,'stacked')
%         mesh_data=[cluster_mem_entwickl(1:4,j),cluster_mem_entwickl(5:8,j),cluster_mem_entwickl(9:12,j),cluster_mem_entwickl(13:16,1)];
%         bar3(mesh_data);
xlim([1 16]);
x_line=[4.5 4.5];
y_line=ylim;
x_l=line(x_line,y_line,'lineWidth', 1.5,'LineStyle','--');
x_l.Color=[0,0, 0, 0.5];
x_line=[8.5 8.5];
x1_l=line(x_line,y_line,'lineWidth', 1.5,'LineStyle','--');
x1_l.Color=[0,0, 0, 0.5];
x_line=[12.5 12.5];
x2_l=line(x_line,y_line,'lineWidth', 1.5,'LineStyle','--');
x2_l.Color=[0,0, 0, 0.5];

h=gca;
set(h,'xtick',1:16);
h.XTickLabel=[time_vec,time_vec,time_vec,time_vec];
 
if strcmp(order,'Time')
    xlabel('Time Limit');
    h.XTickLabelRotation=270;
else
    xlabel('Level of Complexity');
end
ylabel('Type Power');

% yLimits = get(gca,'YLim');
  x_vec=[2.25,6.25,10.25,14.25];
if y_line(1,1)>0
y_vec=[1.125*y_line(1,1),1.125*y_line(1,1),1.125*y_line(1,1),1.125*y_line(1,1)];
else
 y_vec=[0.9*y_line(1,2),0.9*y_line(1,2),0.9*y_line(1,2),0.70*y_line(1,2)];
end 


grey=[0.4 0.4 0.4];
for k=1:4
    if strcmp(order,'Time')
        %lablepoints(x_vec,y_vec,time_vec{1,:});
        text(x_vec(1,k),y_vec(1,k),compl_vec(1,k),'HorizontalAlignment','center','Color',grey,'FontWeight','bold');
    
        else
        text(x_vec(1,k),y_vec(1,k),time_vec(1,k),'HorizontalAlignment','center','Color',grey,'FontWeight','bold');
    end
%     lablepoints(x_vec,y_vec,compl_vec{1,:});
end

if no_diff
    legend(typen_string(idx_keep));
else
legend([typen_string(idx_keep),'no cast']);
end
% title('V3');
% legend('H_0','H_1','Location','best');
axis tight;
hold off



savefig(fig_name);

%saveas(fig,fig_name, 'jpg');
saveas(fig,fig_name, 'meta');
close(fig);

    end
    
end
