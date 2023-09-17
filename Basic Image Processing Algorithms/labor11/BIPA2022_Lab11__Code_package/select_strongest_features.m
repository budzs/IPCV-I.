function [FeaturePointsOut] = select_strongest_features(FeaturePoints, upper_limit, min_metric)
    [~, idx] = sort(FeaturePoints.Metric, 'descend');
    idx = idx(1:upper_limit);
    FeaturePointsOut = FeaturePoints(idx);
    FeaturePointsOut = FeaturePointsOut( FeaturePointsOut.Metric > min_metric);   
end
