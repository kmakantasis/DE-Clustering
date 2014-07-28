function cost = ObjectiveCost(data, solution, num_classes, inter_intra)

    [sz, ret] = size(data);
    
    Y = [];
    data_temp = data(:,1:2);
    
    for i = 1:num_classes
        Y_i = repmat(solution(i,:), sz,1);
        temp = data_temp - Y_i;
        Y = [Y sqrt(sum(temp .^2, 2))];
    end
    
    inter_cost = sum(min(Y'));
    
    intra_cost = 0;
    
    for i=1:num_classes
        for j=1:num_classes
            intra_cost = intra_cost + norm(solution(i,:)-solution(j,:));
        end
    end
    
    cost = inter_cost / (inter_intra * intra_cost); 
    
    
end

