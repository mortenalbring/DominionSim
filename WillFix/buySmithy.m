function [table,player] = buySmithy(table,player)

    %11 = copper
    %12 = silver
    %13 = gold
    
    %21 = estates
    %22 = duchy
    %23 = province
    
    %33 = smithy

if ((player.money == 3) || (player.money == 4 && table.smithy < 10) || (player.money == 5 && table.smithy < 10)) && (table.silver > 0)
    %if I can buy silver, buy silver
    table.silver = table.silver - 1;
    player.discard(end+1) = 12;
    disp('BigSmithy buying silver')
end
if ((player.money == 4) || (player.money == 5)) && (table.smithy > 9)
   table.smithy = table.smithy - 1;
   player.discard(end+1) = 33;
   disp('BigSmithy buying smithy')
end

%if (player.money == 5) && (table.duchy > 0)
    %if I can buy duchy, buy duchy
%    table.duchy = table.duchy - 1;
%    player.discard(end+1) = 22;
%end

if ((player.money == 6) || (player.money == 7)) && (table.gold > 0)
    %if I can buy gold, buy gold
    table.gold = table.gold - 1;
    player.discard(end+1) = 13;
    disp('BigSmithy buying gold')
end
if player.money >= 8
    table.province = table.province - 1;
    player.discard(end+1) = 23;
    disp('BigSmithy buying province')
end
end