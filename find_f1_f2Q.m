
function [f_1n,f_2n]=find_f1_f2Q(f,cf1,cf2)
f2n=0; k2=0;
f1n=0; k1=0;

% finding the frequencies number for cf1 and cf2 from "f"
for i=1:1:max(size(f))
if (f(i)>cf1)&&(k1==0)
f1n=i;
k1=1;
end;
if (f(i)>cf2)&&(k2==0)
f2n=i;
k2=1;
end;
end;

f_1n=f1n;
f_2n=f2n;

end