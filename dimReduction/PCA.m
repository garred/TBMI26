%% Dimensionality reduction using PCA and FLD
clear all
load countrydata

X = countrydata;

matrixCov = myMatrixCov(X);
matrixCorr = myMatrixCorr(X);

imagesc(matrixCov)

%% normalize all the features by themselves
X = myZnorm(X);
imagesc(X)

matrixCov = myMatrixCov(X);
matrixCorr = myMatrixCorr(X);

imagesc(matrixCov)
colorbar
figure
imagesc(matrixCorr)
colorbar

%% Obtain the eigenvalues of the covariance matrix

[eigenVector, eigenValues] = eig(matrixCov);
figure;
stem(eigenValues(eye(13)==1))

%%

e = eigenVector;

X_0 = X(:,countryclass == 0);
X_1 = X(:,countryclass == 1);
X_2 = X(:,countryclass == 2);
Xg = X(:,41);
Xe = X(:,89);
Xs = X(:,90);
i = 13;
figure
hold on
plot(e(i,:)*X_0, e(i-1,:)*X_0, 'o')
plot(e(i,:)*X_1, e(i-1,:)*X_1, 'o')
plot(e(i,:)*X_2, e(i-1,:)*X_2, 'o')
plot(e(i,:)*Xg, e(i-1,:)*Xg, 'o', 'LineWidth',5)
plot(e(i,:)*Xe, e(i-1,:)*Xe, 'o', 'LineWidth',5)
plot(e(i,:)*Xs, e(i-1,:)*Xs, 'o', 'LineWidth',5)

%text(e(13,:)*X, e(12,:)*X, countries);
legend('developing','in between','developed')

%% 3D

figure
hold on
grid on
plot3(e(i,:)*X_0, e(i-1,:)*X_0, e(i-2,:)*X_0, 'o')
plot3(e(i,:)*X_1, e(i-1,:)*X_1, e(i-2,:)*X_1, 'o')
plot3(e(i,:)*X_2, e(i-1,:)*X_2, e(i-2,:)*X_2, 'o')

%%

W = FLD(X_0, X_2);

figure
hold on
plot(W'*X_0, W'*X_0, 'o')
%plot(W'*X_1, W'*X_1, 'o')
plot(W'*X_2, W'*X_2, 'o')
%legend('developing','in between','developed')

%%

w0 = W'*X_0;
w2 = W'*X_2;

figure
hold on
histogram(w0, length(w0))
histogram(w2, length(w2))
