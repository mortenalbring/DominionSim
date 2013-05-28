%function dominionsimulate
%clc
%clear

h = waitbar(0,'completion')

player.one.playing = 1;

meta.playerone.deck = zeros(10000,5)

maxgames = 1000
for m=1:maxgames
    
    waitbar((m/maxgames),h,(m/maxgames))
    
    
    table.copper = 60;
    table.silver = 40;
    table.gold = 30;
    
    table.estate = 10;
    table.duchy = 10;
    table.province = 10;
    
    table.smithy = 10;
    
    %11 = copper
    %12 = silver
    %13 = gold
    
    %21 = estates
    %22 = duchy
    %23 = province
    
    %33 = smithy
    
    player.one.deck = [11,11,11,11,11,11,11,21,21,21];
    player.one.hand = [];
    player.one.discard = [];
    player.one.vp = 0;
    
    player.two.deck = [11,11,11,11,11,11,11,21,21,21];
    player.two.hand = [];
    player.two.discard = [];
    player.two.vp = 0;
    
    %Player One draw hand
    [player.one] = drawnewhand(player.one);
    
    %Player Two draw hand
    [player.two] = drawnewhand(player.two);
    
    table.turn = 0;
    table.gameActive = 1;
    while (table.gameActive == 1)
        table.turn = table.turn + 1;
        
        if (table.gameActive == 1)
        %%%%Player One Turn
        %countmoney
        %player.one = actionJustSmithy(player.one);
        
        player.one.money = countMoney(player.one.hand);              
        %buy strategy
        [table,player.one] = buyBigMoney(table,player.one);
        %Discard hand and draw new hand
        [player.one] = drawnewhand(player.one);
        if (table.province == 0) 
            table.gameActive = 0;
        end
        end               
        
        if (table.gameActive == 1)
        %%%%Player Two Turn
        %countmoney
        player.two = actionJustSmithy(player.two);
        
        player.two.money = countMoney(player.two.hand);
        %buy strategy
        [table,player.two] = buySmithy(table,player.two);
        %Discard hand and draw new hand
        [player.two] = drawnewhand(player.two);
        if (table.province == 0) 
            table.gameActive = 0;
        end
        end
    end
      
    %Count VP 
    player.one = countVP(player.one);
    player.two = countVP(player.two);
    
    
    if player.one.vp > player.two.vp
        meta.winner(m) = 1;
    elseif player.one.vp < player.two.vp
        meta.winner(m) = 2;
    else
        meta.winner(m) = 0;
    end
    meta.vp(m,1) = m;
    meta.vp(m,2) = player.one.vp;
    meta.vp(m,3) = player.two.vp;
    meta.winturn(m) = table.turn;
    
    for i=1:size(player.one.discard,2)
        if (player.one.discard(i) == 11) 
            meta.playerone.deck(m,2) = meta.playerone.deck(m,2)+1;
        end
        if (player.one.discard(i) == 12) 
            meta.playerone.deck(m,3) = meta.playerone.deck(m,3)+1;
        end
        if (player.one.discard(i) == 13) 
            meta.playerone.deck(m,4) = meta.playerone.deck(m,4)+1;
        end
    end
    
end
close(h)

hist(meta.winner)
axis([0 2 0 maxgames])
