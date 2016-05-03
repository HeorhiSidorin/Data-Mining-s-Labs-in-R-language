clc;
close all;

file=fopen('Cohonen_data8.txt','r');
A=fscanf(file,'%g',[2 inf]);
fclose(file);

A1=A';
X=A1(:,1);
Y=A1(:,2);
R(1,1) = min(A1(:,1));
R(1,2) = max(A1(:,1));
R(2,1) = min(A1(:,2));
R(2,2) = max(A1(:,2));

plot(X,Y,'*')
net=newc(R',5);
disp(net);
net.trainParam.epochs = 100;
net = train(net,A);

center = net.IW{1,1};
Y = sim(net, A);
Yc = vec2ind(Y);
X=A(1,:);
X=X';
Y=A(2,:);
Y=Y';

m1= mean(A(:,Yc==1)');
m2= mean(A(:,Yc==2)');
m3= mean(A(:,Yc==3)');
m4= mean(A(:,Yc==4)');
m5= mean(A(:,Yc==5)');

gscatter(X,Y,Yc);
hold on;

plot(m1(1),m1(2),'o');
plot(m2(1),m2(2),'o');
plot(m3(1),m3(2),'o');
plot(m4(1),m4(2),'o');
plot(m5(1),m5(2),'o');