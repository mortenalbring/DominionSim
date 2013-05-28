function [player] = drawOneCard(player)

if size(player.deck,2) == 0
   player.discard = player.discard(randperm(size(player.discard,2)));
   player.deck = player.discard;
   player.discard = [];
   
   player.hand = [player.hand player.deck(1)];
   player.deck(1) = [];
   
else
    player.hand = [player.hand player.deck(1)];
    player.deck(1) = [];
end

end