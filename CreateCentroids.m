function c = CreateCentroids(data, num_classes, solution)
    c = [];
    for i=1:num_classes
        idx = find(solution==i);
        c = [c; mean(data(idx,1:2))];
    end
end

