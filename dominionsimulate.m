%function dominionsimulate
%clc
%clear

h = waitbar(0,'completion') 

player.one.playing = 1;

maxgames = 10
for m=1:maxgames

waitbar((m/maxgames),h,(m/maxgames))


table.copper = 60;
table.silver = 40;
table.gold = 30;

table.estate = 10;
table.duchy = 10;
table.province = 10;

%11 = copper
%12 = silver
%13 = gold

%21 = estates
%22 = duchy
%23 = province


player.one.deck = [11,11,11,11,11,11,11,21,21,21];
player.one.hand = [];
player.one.discard = [];

%Draw hand
[player.one.hand,player.one.deck,player.one.discard] = drawnewhand(player.one.hand,player.one.deck,player.one.discard);

table.turn = 0;
while (table.province > 0)
table.turn = table.turn + 1;

%countmoney
player.one.money = playermoneycount(player.one.hand);

%buy phase
if ((player.one.money == 3) || (player.one.money == 4) || (player.one.money == 5)) && (table.silver > 0)
    %if I can buy silver, buy silver
    table.silver = table.silver - 1;
    player.one.discard(end+1) = 12;
end
if ((player.one.money == 6) || (player.one.money == 7)) && (table.gold > 0)
    %if I can buy gold, buy gold
    table.gold = table.gold - 1;
    player.one.discard(end+1) = 13;
end
if player.one.money >= 8
    table.province = table.province - 1;
    player.one.discard(end+1) = 23;
end

%Discard hand and draw new hand
[player.one.hand,player.one.deck,player.one.discard] = drawnewhand(player.one.hand,player.one.deck,player.one.discard);


end

meta.winturn(m) = table.turn;
end
close(h)
