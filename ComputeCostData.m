function cost_matrix = ComputeCostData(data)

cost_matrix = zeros(length(data), length(data));

for i = 1:length(data)
    for j = 1:length(data)
        point1 = data(i,1:2);
        point2 = data(j,1:2);
        cost_matrix(i,j) = norm(point1-point2);
    end
end

end

