clc 
clear all

[data, num_classes] = DataRead('Aggregation.xls', 0);
solution_len = num_classes;
population_size = 5000;

population = CreatePopulation(population_size, solution_len, data);

[sz, ret] = size(data);
inter_intra = sz / (2 *num_classes^2);
    

[best_solution, min_cost, population2, y] = DifferentialEvolution(population, data, num_classes, inter_intra, 0.5, 0.5, 100, 20);

clustering = zeros(sz,1);
for i=1:sz
    min_dist = Inf(1);
    for j=1:num_classes
        dist = norm(data(i,1:2)-best_solution(j,:));
        if dist < min_dist
            clustering(i) = j;
            min_dist = dist;
        end
    end
end
            
        


for i=1:num_classes
    idx = find(clustering==i);
    class_i = data(idx,1:end-1);
    plot(class_i(:,1), class_i(:,2), '*', 'color',rand(1,3)); hold on;
end

