%input data
data=('InpMatlab12.xlsx')

%read data
A=xlsread(data)
o= (A-min(A(:)))/(max(A(:))-min(A(:)))

%input clustering what we want
n=3
exponent=2
maxiteration=100
miniprovement=0.00001
displayobjf=true
options=[exponent maxiteration miniprovement displayobjf]

%clustering
[C,U]=fcm(o,n,options)
maxU=max(U)

for i=1:n
    index{i}=find(U(i,:)==maxU)
end

figure
hold on
for i=1:n
    plot(o(index{i},1),o(index{i},2),'o')
    plot(C(i,1),C(i,2),'xk','MarkerSize',15,'LineWidth',1)
end

hold off