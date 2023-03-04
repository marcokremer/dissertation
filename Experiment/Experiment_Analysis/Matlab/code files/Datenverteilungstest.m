% create different data sets from experimentations for data fitting tests
% execute fitting tests kolmogorov-smirnov (normal-distribution) and
% lilliefors (exponential distribution)
% exclude data that has a EIP-sum of zero
load('data_for_do_hypotheses_test.mat');
verteilungstest=struct;
experimentdaten_verteilungen=struct;
data_query=26;
data_bezeichnung='Summe EIPs';
data_table=table();
exp_name=cell(1);
data_name=cell(1);
field_name=cell(4,4,3);
field_data=cell(4,4,3);

for g=1:3
    m=1;
    fig=figure;
    switch g
        case 1
            data_set=V1_Data;
            data_name{1,1}='v1';
        case 2
            data_set=V2_Data;
            data_name{1,1}='v2';
        case 3
            data_set=V3_Data;
            data_name{1,1}='v3';
    end
    
    fig_name=[data_bezeichnung,'_',data_name{1,1}];
    
    for i=1:4
        for j=2:5
            
            exp_name{1,1}=strcat(num2str(i),'_',num2str(j),'x',num2str(j),'_2.php');
            dataset_select=table2array(data_set(strcmp(data_set.(4), exp_name{1,1}) & (data_set.(data_query)>0),data_query));
            field_name{i,j,g}=[data_name{1,1},'_',num2str(i),'_',num2str(j),'x',num2str(j)];
            experimentdaten_verteilungen.(field_name{i,j,g})=dataset_select;
            anz_spieler=num2str(size(dataset_select,1));
            subplot(4,4,m);
            histogram(dataset_select,'Normalization','probability');
            str={'\Sigma',anz_spieler};
            text(0.8,0.7,str,'Units','normalized','Interpreter','tex');
            title(field_name{i,j,g},'Interpreter','none');
            m=m+1;
            
            %             ks=kstest(dataset_select,'Alpha',0.01);
            %             [lil,p_wert]=lillietest(dataset_select,'Alpha',0.01,'Distr','exp');
            %             if j==2 && i==1
            %                 verteilungstest.(data_name{1,1})=table(data_name, exp_name, double(ks), lil, p_wert); %ggf. transformieren?!
            %             else
            %                 verteilungstest.(data_name{1,1})=vertcat(verteilungstest.(data_name{1,1}),table(data_name, exp_name, double(ks), lil,p_wert));
            %             end
        end
    end
            savefig(fig, fig_name);
            saveas(fig,fig_name, 'meta');
            saveas(fig,fig_name, 'jpg');
            close(fig);
end




