clear
clc

load carsmall
whos
isdata = isfinite(MPG)&isfinite(Weight)&isfinite(Horsepower);
y = MPG(isdata);
x = Weight(isdata);
N = length(y)
clf
%subplot(2,2,1)
plot(x,y,'x')
xlabel('Weight [lb]')
ylabel('MPG')
hold on

r = corrcoef(x,y); % Corr coeff is the off-diagonal (1,2) element
r = r(1,2);  % Sample regression coefficient

% Add to the scatterplot
title(['r = ' num2str(0.01*round(r*100))])
xbar = mean(x);
ybar = mean(y);
sigx = std(x);
sigy = std(y);
a1 = r*sigy/sigx;   % Regression line slope

% Overplot regression line, adding means back in.

yfit = ybar + a1*(x - xbar);
plot(x,yfit,'k-')