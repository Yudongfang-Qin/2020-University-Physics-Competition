clc
Wmax = 1200;
G = 10000;
gene = 0;
water = 0;
food = 0;
GENE=2^19;
Day = 10;
R1 = 0;
R2 = 5/8;
aa = 0;
result = zeros(GENE,1);
for i = 1:500000000
    index=fix(GENE*rand);
    gene = dec2bin(fix(GENE*rand)+GENE);
    mining = bin2dec(gene(16:18))+1;
    food =  80+bin2dec(gene(2:8));
    water =  90+bin2dec(gene(9:15));
    weather = rand(1,Day);
    D1 = bin2dec(gene(19));
%    D2 = bin2dec(gene(26));
%    D3 = bin2dec(gene(24));
D3 = 0;
%     if (food*2+water*3)>1200
%         continue
%     end
    Gold = 10000-5*water-10*food;
    L = 5;
    for D =1:Day

        if L == 2
            
            
            for t = 1:mining
            if weather(D) < R1
                Gold = Gold+200*D1;
                food = food - 10 -10*2*D1;
                water = water- 10 -10*2*D1;     

            elseif weather(D) > R2
                Gold = Gold+200*D1;
                food = food - 9-9*2*D1;
                water = water -9-9*2*D1;
                

            else 
                Gold = Gold+200;
                food = food - 3;
                water = water -4;
                
            end
            D = D+1;
            if D == Day
                break
            end
            end
        end
        if food <=0 || water <=0||D>Day
%          food;
%          water;
        break
        end
        
%     if weather(D) < R1
%         food = food - 10;
%         water = water -10;
      
    
    if weather(D) > R2
        food = food - 18+9*D3;
        water = water -18+9*D3;
        L = L-1+D3;
       
    else 
        food = food - 6;
        water = water -8;
         L = L-1;
        
    end
        
    
    if L ==0
%          Gold;
        result(index+1) = result(index+1)+Gold+water*2.5+food*5;
%          result(index);
        aa = aa+1;
        break
    end
end
end
[richest,theChosenOne]=max(result);
money = richest*GENE/i
theGene = dec2bin(theChosenOne+GENE)
theMining = bin2dec(theGene(16:18))+1
theFood =  80+bin2dec(theGene(2:8))
theWater =  90+bin2dec(theGene(9:15))
    


   
