function [adaption] = adapt(groupa,groupd)
% groupa = [P1;P2];
% groupd = ones(2,10);
food = [0,0];
water = [0,0];
adaption = 0;
Weather = [0,1,0,0,0,0,1,1,1,1];
G = [0,0];
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
    lethal = ones(1,2);
    place = ones(2,11);
for day1 = 1:10
        if groupd(1,day1) == 1
            if place(1,day1+1) ==0||place(1,day1) ==-0
            break
            end
        place(1,day1+1) = map(place(1,day1),groupa(1,day1));       
        else
        place(1,day1+1) = place(1,day1);
        end 
        water(1) = water(1)+(1+groupd(1,day1))*(3+6*Weather(day1));
        food(1) = food(1)+(1+groupd(1,day1))*(4+5*Weather(day1));
        if place(1,day1+1) == 13
            lethal(1) = 0;
            break
        end

        
          if place (1,day1) == place (1,day1+1)==7&& groupd(1,day1+1)==0
             water = water + 2*(3+Weather(day1+1)*6);
             food = food + 2*(4+Weather(day1+1)*5);
             G(1) =G(1) +200;
          end
        
        
    end


    for day2 = 1:10
        if groupd(2,day2) == 1
            if place(2,day2+1) ==0||place(2,day2) ==0
            break
            end
        place(2,day2+1) = map(place(2,day2),groupa(2,day2));     
        else
        place(2,day2+1) = place(2,day2);
        end
        water(2) = water(2)+(1+groupd(2,day2))*(3+6*Weather(day2));
        food(2) = food(2)+(1+groupd(2,day2))*(4+5*Weather(day2));
        if place(2,day2+1) ==13
            lethal(2) =0;
            break
        end
         if place (2,day2) == place (2,day2+1)==7&& groupd(2,day2+1)==0
             water(2) = water(2) + 2*(3+Weather(day2+1)*6);
             food(2) = food(2) + 2*(4+Weather(day2+1)*5);
             G(2) =G(2) +200;
          end
    end

    
       
    if lethal(1)+lethal(2) == 0
       
       for t =1:min(day1,day2)
           if place(1,t) == place(2,t)
                if place(1,t+1) == place(2,t+1)
                    if place (1,t) == place (1,t+1)==7&&groupd(t+1) == 0
                        display(12357)
                        G = G- 200;
                    end
                if groupd(1,t) == 1
                     food = food + 2*(4+Weather(t)*5);
                     water = water + 2*(3+Weather(t)*6);
                end    
                end
           end      
       end
    if(2*food(1)+3*water(1))<1200&&(2*food(2)+3*water(2))<1200
        adaption = (10000-10*food(1)-5*water(1)+G(1)-3000*2)+(10000-10*(food(2))-5*(water(2))+G(2)-3000*2);
    end
        
    end

end


