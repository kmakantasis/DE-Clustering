function [a, b, c] = SelectParents(population, sz, j)
while(1)
    a = randi(sz);
    if a ~= j
        break;
    end
end
a = population(a,:);

while(1)
    b = randi(sz);
    if b ~= j & b ~= a
        break;
    end
end
b = population(b,:);

while(1)
    c = randi(sz);
    if c ~= j & c ~= a & c ~= b
        break;
    end
end
c = population(c,:);

end

