function [best_solution, min_cost, population, y] = DifferentialEvolution(population, data, num_classes, inter_intra, F, CR, generations, early_stoping)

sl = num_classes;
[sz, ret] = size(population);

min_cost = Inf(1);
best_solution = 0;

min_x = min(data(:,1));
max_x = max(data(:,1));

min_y = min(data(:,2));
max_y = max(data(:,2));
counter = 0;

for i = 1:generations
    i
    counter = counter + 1;
    for j = 1:sz
        x = population{j};
        [a, b, c] = SelectParents(population, sz, j);
        a = x;
        y = [];
        for l = 1:sl
            r_i = rand();
        
            if r_i < CR
                y_i_x = a(l,1) + F * (b(l,1) - c(l,1));
                if y_i_x < min_x
                    y_i_x = (max_x-min_x).*rand(1,1) + min_x;
                elseif y_i_x > max_x
                    y_i_x = (max_x-min_x).*rand(1,1) + min_x;
                end
                
                y_i_y = a(l,2) + F * (b(l,2) - c(l,2));
                if y_i_y < min_y
                    y_i_y = (max_y-min_y).*rand(1,1) + min_y;
                elseif y_i_y > max_y
                    y_i_y = (max_y-min_y).*rand(1,1) + min_y;
                end
            else
                y_i_x = x(l,1);
                y_i_y = x(l,2);
            end
            
            y = [y; y_i_x y_i_y];
        end
        
        

        cost_x = ObjectiveCost(data, x, num_classes, inter_intra);
        cost_y = ObjectiveCost(data, y, num_classes, inter_intra);
        
        if cost_y < cost_x
            population{j} = y;
            if cost_y < min_cost
                best_solution = y;
                min_cost = cost_y
                counter = 0;
            end
        else
            if cost_x < min_cost
                best_solution = x;
                min_cost = cost_x;
            end
        end
    end
    
    if counter == early_stoping
        break
    end
    
end

end

