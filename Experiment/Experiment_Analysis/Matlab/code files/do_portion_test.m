function test_erg=do_portion_test(h0_data,comp_data, orientation,l,Test_Parameter)

%Hy I:
alpha=0.05;
h=0;
n1=size(h0_data,1);
n2=size(comp_data,1);


switch l
    case 7 %here is a bug: the underlying question is: are people using heuristics? with p_0=0,95 as assumption
        %p1  = size(h0_data(h0_data.(Test_Parameter.(7)(l))>Test_Parameter.(8)(l) | h0_data.(Test_Parameter.(9)(l))>Test_Parameter.(10)(l) ,:),1) / n1; %=n1_I/n1
        p1= 0.95;
        p2  = size(comp_data(comp_data.(Test_Parameter.(7)(l))>Test_Parameter.(8)(l) | comp_data.(Test_Parameter.(9)(l))>Test_Parameter.(10)(l) ,:),1) / n2;  %=n2_I/n2
    case 10
        p1  = size(h0_data(~cellfun('isempty', regexp(h0_data.(Test_Parameter.(7)(l)),Test_Parameter.(11)(l),'match')),:),1) / n1; %=n1_I/n1 Filter: Eintrag "E" bei Entscheidungstyp
        p2  = size(comp_data(~cellfun('isempty', regexp(comp_data.(Test_Parameter.(7)(l)),Test_Parameter.(11)(l),'match')),:),1) / n2 ; %=n2_I/n2 Filter: Eintrag "E" bei Entscheidungstyp
    otherwise
        p1  = size(h0_data(h0_data.(Test_Parameter.(7)(l))>Test_Parameter.(8)(l),:),1) / n1; %=n1_I/n1
        p2  = size(comp_data(comp_data.(Test_Parameter.(7)(l))>Test_Parameter.(8)(l),:),1) / n2;  %=n2_I/n2
end

p_all=(n1*p1+n2*p2)/(n1+n2);
T=(p1-p2)/sqrt(p_all*(1-p_all)*(1/n1 + 1/n2));
p_value=normcdf(T);

switch orientation{1,1}
    case 'large'
        %[h,p_value,ci]=ztest(comp_data,h0_data,'Tail','right');
        
        if p_value>1-alpha
            h=1;
        end
    case 'small'
        %[h,p_value,ci]=ztest(comp_data,h0_data,'Tail','left');
        if p_value<alpha
            h=1;
        end
    case 'deviate'
        %[h,p_value]=ztest(comp_data,h0_data);
        
            p_value=normcdf(abs(T));
        
        if p_value>(1-alpha/2) || p_value<alpha/2
            h=1;
        end
end
test_erg={n2,p1,p2,h,p_value};