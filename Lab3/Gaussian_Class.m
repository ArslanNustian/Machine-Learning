clc
clear

load data_gc.mat
hold on
scatter(x_n1(:,1),x_n1(:,2),'r');
scatter(x_n2(:,1),x_n2(:,2),'k');
scatter(x_n3(:,1),x_n3(:,2),'b');
hold off
%----------------Training & Test Data---------------------
tr_sa1 = x_n1(1:50,:);
tr_sa2 = x_n2(1:50,:);
tr_sa3 = x_n3(1:50,:);

tst_sa1 = x_n1(51:end,:);
tst_sa2 = x_n2(51:end,:);
tst_sa3 = x_n3(51:end,:);
%---------------Models-----------------------------------
m1 = mean(tr_sa1);
m2 = mean(tr_sa2);
m3 = mean(tr_sa3);
c1 = cov(tr_sa1);
c2 = cov(tr_sa2);
c3 = cov(tr_sa3);
%-----------------Classification------------------------
%-----Class-1
for i=1:50
    g1(i) = -0.5*log(det(c1))-0.5*(tst_sa1(i,:)-m1)*(c1^-1)*(tst_sa1(i,:)-m1)'+log(1/3);
    g2(i) = -0.5*log(det(c2))-0.5*(tst_sa1(i,:)-m2)*(c2^-1)*(tst_sa1(i,:)-m2)'+log(1/3);
    g3(i) = -0.5*log(det(c3))-0.5*(tst_sa1(i,:)-m3)*(c3^-1)*(tst_sa1(i,:)-m3)'+log(1/3);
end
correct1 = 0;
wrong1 = 0;
for i=1:50
    if g1(i)>g2(i) & g1(i)>g3(i)
        correct1 = correct1+1;
    else
        wrong1 = wrong1+1;
    end
end
%Class-2
for i=1:50
    g1(i) = -0.5*log(det(c1))-0.5*(tst_sa2(i,:)-m1)*(c1^-1)*(tst_sa2(i,:)-m1)'+log(1/3);
    g2(i) = -0.5*log(det(c2))-0.5*(tst_sa2(i,:)-m2)*(c2^-1)*(tst_sa2(i,:)-m2)'+log(1/3);
    g3(i) = -0.5*log(det(c3))-0.5*(tst_sa2(i,:)-m3)*(c3^-1)*(tst_sa2(i,:)-m3)'+log(1/3);
end
correct2 = 0;
wrong2 = 0;
for i=1:50
    if g2(i)>g1(i) & g2(i)>g3(i)
        correct2 = correct2+1;
    else
        wrong2 = wrong2+1;
    end
end
%Class-3
for i=1:50
    g1(i) = -0.5*log(det(c1))-0.5*(tst_sa3(i,:)-m1)*(c1^-1)*(tst_sa3(i,:)-m1)'+log(1/3);
    g2(i) = -0.5*log(det(c2))-0.5*(tst_sa3(i,:)-m2)*(c2^-1)*(tst_sa3(i,:)-m2)'+log(1/3);
    g3(i) = -0.5*log(det(c3))-0.5*(tst_sa3(i,:)-m3)*(c3^-1)*(tst_sa3(i,:)-m3)'+log(1/3);
end
correct3 = 0;
wrong3 = 0;
for i=1:50
    if g3(i)>g1(i) & g3(i)>g2(i)
        correct3 = correct3+1;
    else
        wrong3 = wrong3+1;
    end
end
Accuracy = (correct1+correct2+correct3)/150