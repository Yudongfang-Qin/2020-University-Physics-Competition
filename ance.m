function [A1] = ance()
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
i =1;
A2 = round(unifrnd(0,1,1,10));
gene = 1;
while gene ~= -1
   gene = 1; 
   A1 = unidrnd(6,1,10);

for n =1:10
   gene = map(gene,A1(n));
   if gene == 0
   
        break
   end
   if gene ==-1
       break
   end   
end
end
end



