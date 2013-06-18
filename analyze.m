clear ; close all; clc
X=load('cricipl.txt');  %Load the File


%
%Feature Normalize
%

mu = mean(X);
X_norm = bsxfun(@minus, X, mu);

sigma = std(X_norm);
X_norm = bsxfun(@rdivide, X_norm, sigma);

%
%Compute Principal Components
%
[m, n] = size(X_norm);
U = zeros(n);
S = zeros(n);
S=X_norm'*X_norm;
S=S/m;
[U,S,V]=svd(S);

%
%Dimensionality Reduction
%

K = 1;
Z = zeros(size(X_norm, 1), K);
Ureduce=U(:,1:K);
Z=X_norm*Ureduce;
Z=Z*-1;
X=1:50;
save z.txt Z % write the results into the File
plot(X,Z,'r^')
print("plot.png");