function [cropped_img] = cropp(img)
    img = rgb2gray(img);
    BW = imbinarize(img,0.6);
    BW2 = imfill(BW,'holes');
    [centers,radii] = imfindcircles(BW2,[1000 1200],'Sensitivity',0.99 ,'ObjectPolarity','bright');
    xc = centers(:,1);
    yc = centers(:,2);
    [xDim,yDim] = size(img);
    [xx,yy] = meshgrid(1:yDim,1:xDim);
    mask = false(xDim,yDim);
    for ii = 1:numel(radii)
        mask = mask | hypot(xx - xc(ii), yy - yc(ii)) <= radii(ii);
    end
    cropped_img = mask;
end