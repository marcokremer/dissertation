%use typecasting from behavior_type_match and pdist from cluster_distances
%to re-type clusters
load('cluster_behavior_type_match.mat');
load('cluster_distances.mat');
cut_off_distance=1.0; %über dieser distance werden die Typen unterschieden; entspricht andere Orientierung in 2 Merkmalen

type_cluster_match=struct();
cc_names = fieldnames(cluster_cen);
for a=1:size(cc_names)
    behave_type=cluster_cen_behave_type.(cc_names{a});
    distances=cluster_distances.(cc_names{a});
    no_match_idx=find(sum(behave_type,2)==0);
    temp_behave_type=behave_type;
        if ~isempty(no_match_idx)
         temp_types=zeros(size(behave_type,1),size(no_match_idx,1));
         for j=1:size(no_match_idx)
             temp_types(no_match_idx(j),j)=1;
         end
        temp_behave_type=[behave_type,temp_types];
        end
    altern_type=temp_behave_type;
    for i=size(altern_type,2):-1:1 %1: Typ A, 2: Typ B, 3: Typ C,...
        if sum(temp_behave_type(:,i)>0)
            type_idx=find(temp_behave_type(:,i),1);
            dist_type_idx=find(distances(:,type_idx(1,1))<cut_off_distance & distances(:,type_idx(1,1))>0);
            if ~(isempty(dist_type_idx))
            altern_type(dist_type_idx,i)=1;
            end
            
            if i<size(altern_type,2)
                match_idx=find(altern_type(:,i));
                altern_type(match_idx,(i+1):end)=0;
            end
        end
        
        
        
    end
    type_cluster_match.(cc_names{a})=altern_type;
end
save('alternative_typecasting.mat','type_cluster_match');