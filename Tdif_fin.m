function[tp]=Tdif_fin(k)
n=3*2^(k); %nmb de lignes
m=2*2^(k); %nbr de colomnes
T=sym('T',[n,m]) ;
t=1;
T(1,:)=100;
T(:,1)=50;
T(:,m)=50;
T(n,:)=50;

for j=2:1:m-1
    
    for i=2:1:n-1
        eq(t)=T(i,j+1)+T(i,j-1)+T(i+1,j)+T(i-1,j)-4*T(i,j)==0;
        t=t+1;
    end
   
end

[A,b]= equationsToMatrix(eq,reshape(T(2:n-1,2:m-1),1,[]));
h=A\b;
Temp=reshape(h,n-2,m-2);
Th=ones(1,m);
Tv=ones(n-2,1);
Temp=[100.*Th;[50.*Tv Temp 50.*Tv];50.*Th];
tp=zeros(n,m);
tp(1:end,1:end)=Temp;
%subplot(1,3,k)
imagesc(tp)
colorbar
%vpa(Temp,4)
end