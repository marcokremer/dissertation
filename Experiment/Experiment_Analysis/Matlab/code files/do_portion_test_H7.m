function test_erg=do_portion_test_H7(comp_data,l,Test_Parameter)
alpha=0.05;
h=0;		
n2=size(comp_data,1);
p1= 0.95;
p2  = size(comp_data(comp_data.(Test_Parameter.(7)(l))>Test_Parameter.(8)(l) | comp_data.(Test_Parameter.(9)(l))>Test_Parameter.(10)(l) ,:),1) / n2;  %=n2_I/n2
T=(p1-p2)/sqrt(p1*(1-p1)/n2);
p_value=normcdf(T);
if p_value>1-alpha
	h=1;
end
test_erg={n2,p1,p2,h,p_value};