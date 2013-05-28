function [table,player] = justBuyMoney(table,player)
if ((player.money == 3) || (player.money == 4) || (player.money == 5)) && (table.silver > 0)
    %if I can buy silver, buy silver
    table.silver = table.silver - 1;
    player.discard(end+1) = 12;
end
if ((player.money == 6) || (player.money == 7)) && (table.gold > 0)
    %if I can buy gold, buy gold
    table.gold = table.gold - 1;
    player.discard(end+1) = 13;
end
if player.money >= 8
    table.province = table.province - 1;
    player.discard(end+1) = 23;
end
end