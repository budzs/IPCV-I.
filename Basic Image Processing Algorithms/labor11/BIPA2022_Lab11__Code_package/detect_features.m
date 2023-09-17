function [FeaturePoints] = detect_features(I, feature_name)
    if isequal(feature_name, 'Harris')
        FeaturePoints = detectHarrisFeatures(I);
    elseif isequal(feature_name, 'SURF')
        FeaturePoints = detectSURFFeatures(I);
    elseif isequal(feature_name, 'BRISK')
        FeaturePoints = detectBRISKFeatures(I);
    else
        error("Invalid");
    end
end
