function money = countMoney(hand)
money = 0;
for i=1:size(hand,2)
   if hand(i) == 11 
       money = money + 1;
   end
   
   if hand(i) == 12
       money = money + 3;
   end
   
   if hand(i) == 13
       money = money + 6;
   end
end
end