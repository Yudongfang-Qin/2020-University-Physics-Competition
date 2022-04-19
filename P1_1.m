clc
clear
Weather = [0,1,0,0,0,0,1,1,1,1];
map = [2,4,5,0,0,0
    1,3,4,0,0,0
    2,4,8,9,0,0
    1,2,3,5,6,7
    1,4,6,0,0,0
    4,5,7,12,13,0
    4,6,11,12,0,0
    3,9,0,0,0,0
    3,8,10,11,0,0
    9,11,13,0,0,0
    7,9,10,12,13,0
    6,7,11,13,0,0
    -1,-1,-1,-1,-1,-1];
N = 100*2;
c = 0;
adaption = zeros(1,N/2);
descendants = zeros(N,10);
best = 0;
for i0 = 1:N
    groupa(i0,:) = ance;
end
bestGene_a = zeros(2,10);
bestGene_d = zeros(2,10);
groupd = ones(N,10);
for J = 1 : 20000
[gamete_d] = mate(groupd);
for i = 1:2:N    
 adaption((i+1)/2) = adapt([gamete_d(i,:);gamete_d(i+1,:)]);
end
[H2L,rank] = sort(adaption,'descend');
adaptionsum = zeros(1,N/2);
adaptionsum(1) = H2L(1);
for i1 = 2 : N/2
    adaptionsum(i1) = adaptionsum(i1-1)+H2L(i1);
end
if H2L(1)>best
    best = H2L(1);
    c = c+1;
 bestGene_d(1,:) =  gamete_d(2*rank(1)-1,:);
 bestGene_d(2,:) =  gamete_d(2*rank(1),:);
end
ALL = sum(adaption);
ratio = adaptionsum/ALL;
a= 1;
a= fix(ratio*N/2);
b = 1;

for i2 = 1:N/2
    for t = b:a(i2)
        groupd(2*t,:) = gamete_d(2*rank(i2),:);
        groupd(2*t-1,:) = gamete_d(2*rank(i2)-1,:);
        
        
    end
        b = a(i2)+1;
    if a(i2)==N
        continue
    end
end

end



bestGene_d
best = best

