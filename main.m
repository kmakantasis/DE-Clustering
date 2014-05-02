clc 
clear all

[data, num_classes] = DataRead('Aggregation.xls');
solution_len = length(data);
population_size = 5000;

cost_matrix = ComputeCostData(data);

population = CreatePopulation(num_classes, population_size, solution_len);
    

[best_solution, min_cost, population2] = DifferentialEvolution(cost_matrix, population, data, num_classes, 0.5, 0.5, 500);

for i=1:num_classes
    idx = find(best_solution==i);
    class_i = data(idx,1:end-1);
    plot(class_i(:,1), class_i(:,2), '*', 'color',rand(1,3)); hold on;
end

