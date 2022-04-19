function [gamete_a,gamete_d] = mate(groupa,groupd)
n1 = 0.4; n2 = 0.4;n3 = 0.2;n4 = 0.2;n5 = 0.2;n6 = 0.2;
[N,~] = size(groupa);
gene1 = zeros(1,10);
for i = 1:N
    if rand < n1
        groupa(i,ceil(10*rand)) = ceil(6*rand);
    end
    if rand < n2
        a = ceil(10*rand);
        groupd(i,a) = ~groupd(i,a);
    end
        if rand < n2
        a = ceil(10*rand);
        groupd(i,a) = ~groupd(i,a);
        end
        if rand < n2
        a = ceil(10*rand);
        groupd(i,a) = ~groupd(i,a);
        end
    
    if rand < n3
        a = ceil(10*rand);
        b = ceil(10*rand);
        gene1(1:abs(a-b)+1) =  groupa(i,max(a,b):-1:min(a,b));
        groupa(i,min(a,b):max(a,b)) = gene1(1:abs(a-b)+1);
    end
    if rand < n4
        a = ceil(10*rand);
        b = ceil(10*rand);
        gene1(1:abs(a-b)+1) =  groupd(i,max(a,b):-1:min(a,b));
        groupd(i,min(a,b):max(a,b)) = gene1(1:abs(a-b)+1);
    end
end
for i = 1:2:N
    if rand < n5
        a = ceil(10*rand);
        b = ceil(10*rand);
        gene1(1:abs(a-b)+1) =  groupa(i,min(a,b):max(a,b));
        gene1(1:abs(a-b)+1) =  groupa(i+1,min(a,b):max(a,b));
        groupa(i,min(a,b):max(a,b)) = gene1(1:abs(a-b)+1);
        groupa(i+1,min(a,b):max(a,b)) = gene1(1:abs(a-b)+1);
    end
    if rand < n6
        a = ceil(10*rand);
        b = ceil(10*rand);
        if a ~=b
        gene1(1:abs(a-b)+1) =  groupd(i,min(a,b):max(a,b));
        gene1(1:abs(a-b)+1) =  groupd(i+1,min(a,b):max(a,b));
        groupd(i,min(a,b):max(a,b)) = gene1(1:abs(a-b)+1);
        groupd(i+1,min(a,b):max(a,b)) = gene1(1:abs(a-b)+1);
        end
    end
end
mating = randperm(N,N);
gamete_a(1:N,:) = groupa(mating(1:N),:);
gamete_d(1:N,:) = groupd(mating(1:N),:);
    






end

