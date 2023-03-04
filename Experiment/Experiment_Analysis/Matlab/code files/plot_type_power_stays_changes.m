%diese Methode plottet die Ergebnisse der Wechsel der Typen in den Spielen

load('alle_typen_wechsel_und_bleiben.mat');
load('type_size.mat');
cluster_auswahl_name={'ges', 'akqoZD', 'akqmZD', 'verarboZD', 'verarbmZD', 'entsch'};
version={'v1','v2','v3'};

co=[      0    0.4470    0.7410;
    0.8500    0.3250    0.0980;
    0.9290    0.6940    0.1250;
    0.4940    0.1840    0.5560;
    0.4660    0.6740    0.1880;
    0.3010    0.7450    0.9330;
    0.6350    0.0780    0.1840];
compl_vec=num2cell([2 3 4 5 2 3 4 5 2 3 4 5 2 3 4 5]);
time_vec={'ineffective', 'moderate', 'tough', 'severe', 'ineffective', 'moderate', 'tough', 'severe','ineffective', 'moderate', 'tough', 'severe','ineffective', 'moderate', 'tough', 'severe' };
compl_time_vec=[compl_vec;time_vec];
order_vec=[1:16;1,5,9,13,2,6,10,14,3,7,11,15,4,8,12,16]';
label={'Complexity','Time Limit'};
compl_txt_vec={'level 2','level 3','level 4','level 5'};
ylabelstring={'Type Power','ratio Remain','ratio Switch'};
all_bleiben_names = fieldnames(all_bleiben);
all_wechsel_names = fieldnames(all_wechsel);
all_type_size_names=fieldnames(type_size);
relay=0;
tick=1;
for i=1:size(all_bleiben_names,1)
    switch i
        case 7
            relay=6;
            tick=2;
        case 13
            tick=1;
        case 19
            relay=12;
            tick=2;
        case 25
            tick=1;
        case 31
            relay=18;
            tick=2;
    end
    
    
    %     for tick=1:2 %für 2 Perspektiven
    fig_name=strcat('Typenentwicklung_',all_bleiben_names{i},'_nb');
    fig=figure('name',fig_name);
    
    for j=1:3 %für 3 Subplots
        switch j
            case 1
                
                abs_data=type_size.(all_type_size_names{i-relay});
                abs_data=abs_data(order_vec(:,tick),:);
                type_power=abs_data;
                type_power(:,sum(type_power)==0)=[]; 
            case 2
                abs_data=all_bleiben.(all_bleiben_names{i});
                
                
            case 3
                abs_data=all_wechsel.(all_wechsel_names{i});
        end
        
        if j<3
            subplot_handle=subplot(7,1,[2*j-1:2*j]);
        else
            subplot_handle=subplot(7,1,[5:7]);
        end
        %abs_data=abs_data(order_vec(:,m),:);
        abs_idx=find(sum(abs_data));
        abs_data(:,sum(abs_data)==0)=[]; 
        
        max_val=round(max(abs_data,[],2));
        rel_data=abs_data./type_power(:,1:size(abs_data,2)); %NaN-handling?
%         peak_data.(struct_field)=find(rel_data>mean(rel_data,1)+std(rel_data,1));
%         mean_std=mean(rel_data,1)+std(rel_data,1);
        idx_peak=zeros(size(rel_data));
        temp_rel_data=rel_data;
        temp_rel_data(isnan(temp_rel_data))=0;
        mean_std=mean(temp_rel_data,1)+std(temp_rel_data,1);
        for q=1:size(rel_data,2)
        idx_peak(:,q)=temp_rel_data(:,q)>=mean_std(q);
        end
        %plot peaks: 
%         rel_data(isnan(rel_data))=0;
% rel_data=find(rel_data(rel_data>(mean(rel_data,1)+std(rel_data,1))));
%         rel_data(rel_data>1)=1;
        point_str=num2cell(max_val);
        %                 hnd= plot(plot_data(:,order_vec(j,:))');
        if j==1
            hnd= plot(abs_data);
        else
            hnd= plot(rel_data);
            if j==3
            hold on
            temp_rel_data=rel_data.*idx_peak;
            temp_rel_data(temp_rel_data==0)=nan;
            hng=plot(temp_rel_data,'d');
            set(hng, {'color'}, num2cell(co(abs_idx,:),2));
            
            hold off
            end
        end
        set(hnd, {'color'}, num2cell(co(abs_idx,:),2));
        xlim([0 17]);
        
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
        %             set(hnd, {'color'}, num2cell(co(type_list,:),2));
        
        h=gca;
        
        
        
        
        
        x_vec=[2.25,6.25,10.25,14.25];
        if y_line(1,1)>0
            y_vec=[1.125*y_line(1,1),1.125*y_line(1,1),1.125*y_line(1,1),1.125*y_line(1,1)];
        else
            y_vec=[0.15*y_line(1,2),0.15*y_line(1,2),0.15*y_line(1,2),0.15*y_line(1,2)];
        end
        grey=[0.4 0.4 0.4];
        for k=1:4
            if tick==1
                %lablepoints(x_vec,y_vec,time_vec{1,:});
                text(x_vec(1,k),y_vec(1,k),time_vec(1,k),'HorizontalAlignment','center','Color',grey,'FontWeight','bold');
            else
                text(x_vec(1,k),y_vec(1,k),compl_txt_vec(1,k),'HorizontalAlignment','center','Color',grey,'FontWeight','bold');
                
            end
            %                     lablepoints(x_vec,y_vec,num2str(compl_vec(1,1:4)));
        end
        % title('V3');
        % legend('H_0','H_1','Location','best');
        ylim([-0.1 max(1.2, y_line(2)*1.2)]);
        
        alp=cellfun(@num2str,point_str,'UniformOutput',false);
        alp_2=max(cellfun(@length,alp));
        
        if alp_2>3
            labelpoints(1:16, max(1, y_line(2)), point_str, 'N','rotation', 270);
        else
            labelpoints(1:16, max(1, y_line(2)), point_str, 'N');
        end
        
        
        h.YLabel.String=ylabelstring{1,j};
        
        if j==3
            h.XTick=1:16;
            h.XTickLabel=compl_time_vec(tick,:);
            
            if tick==2
                h.XTickLabelRotation=-45;
            end
            h.XLabel.String=label{1,tick};
            legend_text=cell(1,size(abs_data,2));
            for n=1:size(abs_data,2)
                legend_text(1,n)=strcat({'Type '},char(abs_idx(n)+64));
            end
            legend(legend_text,'Orientation','horizontal','Location','southoutside');
            
            
            p = get(subplot_handle,'position');
            
            
            % %                     if j==1
            % %                     p(4)=   p(4)*0.9; %height
            % %
            % %                         p(2)=0.7;
            %                         p(4) = 0.175;%p(2)+0.07;
            % %                     else
            % %                         p(2)=0.2;%p(2)*0.85;
            % %                         %                         p(2)=0.05;
            % %                         p(4)=p_old(4);
            % %                     end
            %
            %                     set(subplot_handle, 'position', p);
            %                             axis tight;
            %                     hold off
            %                     p_old=p;
        else
        set(h,'xtick',[]);
        end
    end
    savefig(strcat(fig_name,'.fig'));
    
    %saveas(fig,fig_name, 'jpg');
    saveas(fig,fig_name, 'meta');
    close(fig);
    %     end
end