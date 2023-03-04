function plot_means_struct_social(H0_data_V1,H0_data_V2,H0_data_V3,HA_data_V1,HA_data_V2,HA_data_V3,c_t_code,hyp_vers,order,status, social_asp)
%adjust data
dataset_h0={H0_data_V1,H0_data_V2,H0_data_V3};
dataset_ha={HA_data_V1,HA_data_V2,HA_data_V3};
% for g=1:3
%     dataset_h0{1,g}(1,1)=dataset_h0{1,g}(2,1);
%     dataset_h0{1,g}(5,1)=dataset_h0{1,g}(6,1);
%     dataset_h0{1,g}(9,1)=dataset_h0{1,g}(10,1);
%     dataset_h0{1,g}(13,1)=dataset_h0{1,g}(14,1);
%     
%     dataset_ha{1,g}(1,1)=dataset_h0{1,g}(1,1);
%     dataset_ha{1,g}(5,1)=dataset_h0{1,g}(5,1);
%     dataset_ha{1,g}(9,1)=dataset_h0{1,g}(9,1);
%     dataset_ha{1,g}(13,1)=dataset_h0{1,g}(13,1);
% end
fig_name=strcat('Hypothesis_',hyp_vers,'_',order,'_',social_asp);
fig=figure('name',fig_name);
x=1:16;

%plot V1
subplot(3,1,1);
V1H0=plot(x.',cell2mat(dataset_h0{1,1}),'b--');
hold on
V1Ha=plot(x.',cell2mat(dataset_ha{1,1}),'b');
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
h.XTickLabel={};
% h.XTickLabelRotation=270;
% xlabel('Tasks');
ylabel([status ' V_1']);
% title('V1');
legend('H_0','H_1','Location','best');
hold off

%plot V2
subplot(3,1,2);
V2H0=plot(x.',cell2mat(dataset_h0{1,2}),'r--');
hold on
V2Ha=plot(x.',cell2mat(dataset_ha{1,2}),'r');
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
h.XTickLabel={};
% h.XTickLabelRotation=270;
% xlabel('Tasks');
ylabel([status ' V_2']);
% title('V2');
% legend('H_0','H_1','Location','best');
axis tight;
hold off

%plot V3
subplot(3,1,3);
V3H0=plot(x.',cell2mat(dataset_h0{1,3}),'k--');
hold on
V3Ha=plot(x.',cell2mat(dataset_ha{1,3}),'k');
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
h.XTickLabel=c_t_code;
 
if strcmp(order,'Time')
    xlabel('Time Limit');
    h.XTickLabelRotation=270;
else
    xlabel('Level of Complexity');
end
ylabel([status ' V_3']);

% yLimits = get(gca,'YLim');
 x_vec=[2.25,6.25,10.25,14.25];
% if y_line(1,1)>0
% y_vec=[1.125*y_line(1,1),1.125*y_line(1,1),1.125*y_line(1,1),1.125*y_line(1,1)];
% else
%  y_vec=[0.15*y_line(1,2),0.15*y_line(1,2),0.15*y_line(1,2),0.15*y_line(1,2)];
% end 

%HyXII:
 y_vec=[0.92,0.92,0.92,0.92];

time_vec={'ineffective','moderate','tough','severe'};
compl_vec={'level 2','level 3','level 4','level 5'};
grey=[0.4 0.4 0.4];
for k=1:4
    if strcmp(order,'Time')
        %lablepoints(x_vec,y_vec,time_vec{1,:});
        text(x_vec(1,k),y_vec(1,k),compl_vec(1,k),'HorizontalAlignment','center','Color',grey,'FontWeight','bold');
    
        else
        text(x_vec(1,k),y_vec(1,k),time_vec(1,k),'HorizontalAlignment','center','Color',grey,'FontWeight','bold');
    end
    %lablepoints(x_vec,y_vec,compl_vec{1,:});
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