function outputImage = WallisFilter(inputImage, desiredMean, desiredStdDev, Amax, percentage, windowWidth, preSmooth)
% Source: https://au.mathworks.com/matlabcentral/answers/287847-what-is-wallis-filter-i-have-an-essay-on-it-and-i-cannot-understand-of-find-info-on-it

outputImage = []; 
if mod(windowWidth, 2) == 0
	windowWidth = windowWidth+1;
end
dblImage = double(inputImage); 

if preSmooth
	gauss_blur = fspecial('gaussian', windowWidth, 1);
	dblImage = conv2(dblImage, gauss_blur, 'same');
end

uniformImage = ones(size(dblImage));
kernel = ones(windowWidth);
sumImage = convn(dblImage, kernel, 'same');
countImage = convn(uniformImage, kernel, 'same');

localMeanImage = sumImage ./ countImage;
D = convn((dblImage - localMeanImage).^2, kernel, 'same') / (windowWidth^2);
D = sqrt(D);

% Apply the Wallis formula scaling.
G = (dblImage - localMeanImage) .* Amax .* desiredStdDev ./ (Amax .* D + desiredStdDev) + percentage * desiredMean + (1-percentage) * localMeanImage;

G(G < 0) = 0;
maxPossibleGrayLevel = intmax(class(inputImage));
G(G > maxPossibleGrayLevel) = maxPossibleGrayLevel;

outputImage = cast(G, 'like', inputImage);
end
