function [ image_train,x_train,y_train, image_test,x_test,y_test ] = GiveMeWhatINeed( nF, nT )
%GIVEMEWHATINEED returns the training and testing datasets.

    %% Loading faces
    faces = load('faces.mat');
    faces = double(faces.faces);
    faces = faces / max(max(max(faces)));
    nonfaces = load('nonfaces.mat');
    nonfaces = double(nonfaces.nonfaces);
    nonfaces = nonfaces / max(max(max(nonfaces)));

    %colormap(gray); imagesc(faces(:,:,2));

    %% Generate features
    features = GenerateHaarFeatureMasks(nF);

    %colormap(gray); imagesc(features(:,:,1));

    %% Get training and testing data sets
    image_train = cat(3, faces(:,:,1:nT), nonfaces(:,:,1:nT));
    x_train = ExtractHaarFeatures(image_train, features);
    y_train = [ones(1,nT), -ones(1,nT)];

    % Get a test set
    n_faces = size(faces,3);
    n_nonfaces = size(nonfaces,3);
    image_test = cat(3, faces(:,:,(nT+1):n_faces), nonfaces(:,:,(nT+1):n_nonfaces));
    x_test = ExtractHaarFeatures(image_test, features);
    y_test = [ones(1,n_faces-nT), -ones(1,n_nonfaces-nT)];
    
end

