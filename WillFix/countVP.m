function [player] = countVP(player)
%put all cards in discard pile
player.discard = [player.discard player.hand player.deck];
player.hand = [];
player.deck = [];

for i=1:size(player.discard,2)
    if (player.discard(i) == 21)
        player.vp = player.vp + 1;
    end
    if (player.discard(i) == 22)
        player.vp = player.vp + 3;
    end
    if (player.discard(i) == 23)
        player.vp = player.vp + 6;
    end
end

end