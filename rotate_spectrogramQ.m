function p1ro = rotate_spectrogramQ(p1,f,t,cf1,cf2,chirp_time,input_rate)
p1r=p1; % id. to be rotated (p1)
mea=100; % bias to the side
mst=max(size(t));
[f1n,f2n]=find_f1_f2Q(f,cf1,cf2)

for i=1:1:max(size(f))
for j=1:1:max(size(t))

    if (((j+ceil(chirp_time*input_rate*(f1n-i)/(f1n-f2n))-mea)>0)&&(ceil(j+chirp_time*input_rate*(f1n-i)/(f1n-f2n))-mea<=mst))   %(length(t))
p1r(i,j) = p1(i,j+ceil(1*(chirp_time*input_rate*(f1n-i)/(f1n-f2n)))-mea);  %        %p1r is the rotated p1
    else
        p1r(i,j)=0;
    end;
end;
end;
p1ro=p1r;
end