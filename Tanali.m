function[T]=tanali(u)

n=3*2^(u); %nmbr de lignes
m=2*2^(u);
Ter=zeros(n,m);
T=zeros(n,m);

T(:,1)=50;
T(:,end)=50;
T(end,:)=50;
hx=(60)/(m-1);
T(1,:)=100;
hy=90/(n-1);

for i=2:1:m-1
    for j=2:1:n-1
        x=60-hx*(i-1);
        y=90-hy*(j-1);
        %h=1;
        %a=100;
       for h=1:1:100
        
            T(j,i)=T(j,i)+(100/pi)*(((-1)^(h+1)+1)/(h)*(sin((h*pi*x)/(60))*(sinh(h*pi*y/60))/(sinh(1.5*h*pi))));
            
        end
    end
end
T(2:end-1,2:end-1)=T(2:end-1,2:end-1)+50;
subplot(1,3,u)
imagesc(T)
colorbar
end