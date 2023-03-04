function test_erg=do_mean_test(h0_data,comp_data, orientation)
mean_h0=mean(h0_data);
mean_comp=mean(comp_data);

switch orientation{1,1}
    case 'large'
        [h,p_value]=ttest2(h0_data,comp_data,'Tail','left');
        if p_value<0.05
            h=1;
        else
            h=0;
        end
    case 'small'
        [h,p_value]=ttest2(comp_data,h0_data,'Tail','right');
        if p_value>0.95
            h=1;
        else
            h=0;
        end
    case 'deviate'
        [h,p_value]=ttest2(comp_data,h0_data);
end

test_erg={size(comp_data,1),mean_h0,mean_comp,h,p_value};