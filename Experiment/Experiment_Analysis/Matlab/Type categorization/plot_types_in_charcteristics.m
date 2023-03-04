%plot type center Entwicklung für ein Merkmal
load('type_centers.mat');
load('type_power.mat');
load('alternative_typecasting.mat');

cc_names = fieldnames(type_power);
cluster_auswahl_name={'ges', 'akqoZD', 'akqmZD', 'verarboZD', 'verarbmZD', 'entsch'};
type_size=struct();
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
order_vec=[1:16;1,5,9,13,2,6,10,14,3,7,11,15,4,8,12,16];
label={'Complexity','Time Limit'};
compl_txt_vec={'level 2','level 3','level 4','level 5'};
for a=1:3 %Experimentversionen
    for b=1:6 %Clustertypen
        type_size_fname=strcat('Typen_',version{a},'_',cluster_auswahl_name{b});
        %     fig=figure('name',fig_name);
        cluster_name=cluster_auswahl_name{b};
        search_expression=strcat(version{a},'(\w*)',cluster_name,'(\w*)');
        G = regexp(cc_names,search_expression,'match');
        F=~cellfun('isempty', G);
        temp_cluster_list=sort(cc_names(F));
        
        for c=1:size(temp_cluster_list,1)
            diff_vec=zeros(1,6-size(type_power.(temp_cluster_list{c}),2));
            erg_vec=horzcat(type_power.(temp_cluster_list{c}), diff_vec);
            if c==1
                type_size.(type_size_fname)=erg_vec;
            else
                type_size.(type_size_fname)=vertcat(type_size.(type_size_fname),erg_vec);
            end
        end
        
        
    end
    
end

type_size_names = fieldnames(type_size);
type_center_names= fieldnames(type_centers);

for d=1:3 %Experimentversionen
    for e=1:6 %Clustertypen
        search_expression=strcat(version{d},'_',cluster_auswahl_name{e},'(\w*)');
        G = regexp(type_center_names,search_expression,'match');
        F=~cellfun('isempty', G);
        temp_center_list=sort(type_center_names(F));
        
        search_expression=strcat(version{d},'_',cluster_auswahl_name{e});
        G = regexp(type_size_names,search_expression,'match');
        F=~cellfun('isempty', G);
        temp_size_list=type_size_names(F);
        
        switch e
            case 1
                no_spaltennamen_kurz={'H12','H15','H11','H14','H3','H6','H7','H8','H9','H10','H1','H2','H4','H5','H13'};
                
            case 2
                no_spaltennamen_kurz={'H12','H14','H15'};
            case 3
                no_spaltennamen_kurz={'H11','H12','H14','H15'};
            case 4
                no_spaltennamen_kurz={'H3','H6','H7','H8','H9','H14'};
            case 5
                no_spaltennamen_kurz={'H3','H6','H7','H8','H9','H11','H14'};
                
            case 6
                no_spaltennamen_kurz={'H10','H1','H2','H4','H5','H13'};
        end
        
        for f=1:size(type_centers.(temp_center_list{1}),2) %Anz beobachtete Hypothesen
            plot_data=zeros(size(temp_center_list,1),16);
            abs_data=zeros(size(temp_center_list,1),16);
            type_list=zeros(1,size(temp_center_list,1));
            for g=1:size(temp_center_list,1) %Anz Typen
                type_list(1,g)=uint8(temp_center_list{g}(end))-64;
                data_idx=find(type_size.(temp_size_list{1,1})(:,type_list(1,g)));
                plot_data(g,data_idx)=type_centers.(temp_center_list{g})(:,f)';
                abs_data(g,data_idx)= type_centers_abs.(temp_center_list{g})(:,f)';
            end
            legend_text=cell(1,g);
            
            if strcmp(no_spaltennamen_kurz(f),'H6')
                max_val=round(max(abs_data));
            else
                max_val=round(max(abs_data),1);
            end
            point_str=num2cell(max_val);
            
            for i=1:g
                legend_text(1,i)=strcat({'Type '},char(type_list(i)+64));
            end
            
            legend_text=legend_text(~strcmp(legend_text', 'empty'));
            fig_name=strcat('Typen_',search_expression,'_',no_spaltennamen_kurz(f),'_abs');
            fig=figure('name',fig_name{1,1});
            
            
            %plot_data(plot_data==0)=NaN;
            
            for j=1:2
                
                subplot_handle=subplot(2,1,j);
                
                %                 hnd= plot(plot_data(:,order_vec(j,:))');
                hnd= plot(abs_data(:,order_vec(j,:))');
                
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
                set(hnd, {'color'}, num2cell(co(type_list,:),2));
                
                
                
                h=gca;
                h.XTick=1:16;
                h.XTickLabel=compl_time_vec(j,:);
                
                if j==2
                    h.XTickLabelRotation=270;
                end
                h.XLabel.String=label{1,j};
                x_vec=[2.25,6.25,10.25,14.25];
                if y_line(1,1)>0
                    y_vec=[1.125*y_line(1,1),1.125*y_line(1,1),1.125*y_line(1,1),1.125*y_line(1,1)];
                else
                    y_vec=[0.15*y_line(1,2),0.15*y_line(1,2),0.15*y_line(1,2),0.15*y_line(1,2)];
                end
                grey=[0.4 0.4 0.4];
                for k=1:4
                    if j==1
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
                
                alp=cellfun(@num2str,point_str(:,order_vec(j,:)),'UniformOutput',false);
                alp_2=max(cellfun(@length,alp));
                
                if alp_2>3
                    labelpoints(1:16, max(1, y_line(2)), point_str(:,order_vec(j,:)), 'N','rotation', 270);
                else
                    labelpoints(1:16, max(1, y_line(2)), point_str(:,order_vec(j,:)), 'N');
                end
                
                
                p = get(subplot_handle,'position');
                
                if j==1
                    %p(4)*0.9; %height
                    legend(legend_text,'Orientation','horizontal','Location','southoutside');
                    p(2)=0.7;
                    p(4) = 0.25;%p(2)+0.07;
                else
                    p(2)=0.2;%p(2)*0.85;
                    %                         p(2)=0.05;
                    p(4)=p_old(4);
                end
                
                set(subplot_handle, 'position', p);
                %                 axis tight;
                hold off
                p_old=p;
            end
            
            
            savefig(strcat(fig_name{1,1},'.fig'));
            
            %saveas(fig,fig_name, 'jpg');
            saveas(fig,fig_name{1,1}, 'meta');
            close(fig);
        end
    end
end

save('type_size.mat','type_size');