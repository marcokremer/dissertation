%do subplots from existing plots
load('cluster_behavior_type_match.mat');
load('alternative_typecasting.mat');
cc_names = fieldnames(cluster_cen);
cluster_auswahl_name={'ges', 'akqoZD', 'akqmZD', 'verarboZD', 'verarbmZD', 'entsch'};
version={'v1','v2','v3'};

cd('Typecasting');
s = dir('*.fig'); % s is structure array with fields name,
file_list = {s.name}';
graphics_old=gobjects(16,2);
subplot_handles=gobjects(16,1);
for i=1:3 %for three versions
    version_name=version{i};
    
    
    for j=1:6 %for clustertypes
        cluster_name=cluster_auswahl_name{j};
        search_expression=strcat(version_name,'(\w*)',cluster_name,'(\w*)');
        G = regexp(file_list,search_expression,'match');
        F=~cellfun('isempty', G);
        temp_file_list=file_list(F);
        
        for k=1:16 %open 16 figures per clustertypes
            
            
            graphics_old(k,1) = openfig(temp_file_list{k},'reuse'); % open figure
            
            graphics_old(k,2) = gca; % get handle to axes of figure
            
        end
        new_plot=figure();
        fig_name=strcat('Types_',version_name,'_',cluster_name);
        n=0;
        for l=1:16
%             for m=1:4
%                 n=n+1;
                subplot_handles(l)=subplot(4,4,l);
                fig1=get(graphics_old(l,2),'children'); 
                copyobj(fig1,subplot_handles(l));
%             end
            
        end
        savefig(fig_name);

%saveas(fig,fig_name, 'jpg');
saveas(new_plot,fig_name, 'meta');
close(fig);
    end
    
end