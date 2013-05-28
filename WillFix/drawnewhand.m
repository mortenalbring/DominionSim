function [player] = drawnewhand(player)
player.discard = [player.discard player.hand];

if size(player.deck,2) >= 5
    player.hand = player.deck(1:5);
    player.deck = player.deck(6:end);
    
elseif size(player.deck,2) == 0
    player.deck = player.discard;
    player.discard = [];
    %shuffle
    player.deck = player.deck(randperm(size(player.deck,2)));
    player.hand = player.deck(1:5);
    player.deck = player.deck(6:end);
else
    player.hand = player.deck;
    player.deck = player.discard;
    player.discard = [];

    %shuffle
    player.deck = player.deck(randperm(size(player.deck,2)));
    s = size(player.hand,2);
    player.hand = [player.hand player.deck(1:(5-s))];
    player.deck = player.deck((6-s):end);
end
end