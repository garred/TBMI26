%% 4x4 image grid

images = nonfaces_missclassified;

[tmp, ord] = sort(rand(1,size(images,2)));
figure(1003)
clf
for n = 1:16
    idx = ord(n);
    im = zeros(24,24);
    im(:) = images(:,:,idx);
    subplot(4,4,n)
    imagesc(im)
    colormap(gray)
end

%% An image in gray colors

imagesc(mean(var_dif_images,3));
colormap(gray);