%input data
data=('InpMatlab12.xlsx')

%read data
A=xlsread(data)
o= (A-min(A(:)))/(max(A(:))-min(A(:)))

%clustering
[cidx3,cmeans3,sumd3,d] = kmeans(o,3,'replicates',5,'display','final')
eva= evalclusters(o,cidx3,'daviesBouldin')
figure
gscatter(o(:,1),o(:,2),cidx3,'ybr','o')
hold on
plot(cmeans3(:,1),cmeans3(:,2),'kx','MarkerSize',15,'LineWidth',1)

hold off