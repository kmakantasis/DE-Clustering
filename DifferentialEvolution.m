function [best_solution, min_cost] = DifferentialEvolution(population, data, num_classes, F, CR, generations)

%centroids = CreateCentroids(data, num_classes, population(1,:));
sl = length(population(1,:));
[sz, ret] = size(population);

min_cost = Inf(1)
best_solution = 0;
for i = 1:generations
    i
    for j = 1:sz
        x = population(j,:);
        [a, b, c] = SelectParents(population, sz, j);
        y = [];
        for l = 1:sl
            r_i = rand();
        
            if r_i < CR
                y_i = a(l) + F * (b(l) - c(l));
            else
                y_i = x(l);
            end
            
            y = [y y_i];
        end
        y = DiscretizeY(y, num_classes);
        
        cost_x = InterClusterCost(data, x, num_classes);
        cost_y = InterClusterCost(data, y, num_classes);
        
        %cost_x = ObjectiveCost(data, x, sl, centroids);
        %cost_y = ObjectiveCost(data, y, sl, centroids);
        
        if cost_y < cost_x
            population(j,:) = y;
            if cost_y < min_cost
                best_solution = y;
                min_cost = cost_y
            end
        else
            if cost_x < min_cost
                best_solution = x;
                min_cost = cost_x
            end
        end
    end
    %centroids = CreateCentroids(data, num_classes, best_solution);
end

end

