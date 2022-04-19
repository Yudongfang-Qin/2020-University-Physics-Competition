N = 100;
weather = [1,1,0,-1,0,1,-1,0,1,1,-1,1,0,1,1,1,-1,-1,1,1,0,0,1,0,-1,1,0,0,1,1];
gene = zeros(N,30);
water = zeros(N,2);
food = zeros(N,2);
mining = -1*ones(N,1);
% case 2
LM = 12;
LC = 9;
LK = 10;
L = zeros(1,N);
gene = ance(N);
for I = 1:100
for J = 1:N
     
for t = 1:30
    a = LK<LC;
        if weather(t) ~= -1
            L(J) = L(J)+gene(J,t);
        end
    if L(J) <=LC
        [food1,water1] = spend(weather(t));
        food(J,1)= food(J,1)+(1+gene(J,t))*food1;
        water(J,1) = water(J,1)+(1+gene(J,t))*water1;
    end
    if L(J) >LC
        [food1,water1] = spend(weather(t));
        food(J,2)= food(J,2)+(1+gene(J,t))*food1;
        water(J,2) = water(J,2)+(1+gene(J,t))*water1;
%         if L == LK && (gene(t) == 0||weather==-1)
        if L(J) == LK && gene(J,t) == 0
            if mining ==-1
          [food1,water1] = spend(weather(t));
          food(J,1+a)= food(J,1+a)-2*(1+gene(J,t))*food1;
          water(J,1+a) = water(J,1+a)-2*(1+gene(J,t))*water1; 
            end
          mining(J) =   mining(J)+1;
          [food1,water1] = spend(weather(t));
          food(J,1+a)= food(J,1+a)+2*(1+gene(J,t))*food1;
          water(J,1+a) = water(J,1+a)+2*(1+gene(J,t))*water1;
        end
    end
    
    if L(J)>=LM
        break
    end
end
end
adaption = adapt(food,water,mining,L);
[H2L,rank] = sort(adaption,'descend');
adaptionsum = zeros(1,N);
adaptionsum(1) = H2L(1);
for i1 = 2 : N/2
    adaptionsum(i1) = adaptionsum(i1-1)+H2L(i1);
end
ALL = sum(adaption);
ratio = adaptionsum/ALL;

a= ceil(ratio*N);
b = 1;
group = zeros(N,30);
for i2 = 1:N/2
    for t3 = b:1:(i2)
        group(t3,:) = gamete(rank(i2),:);
      

        
    end
        b = a(i2)+1;
    if a(i2)==N
        continue
    end
end
gene = mate(group);
end