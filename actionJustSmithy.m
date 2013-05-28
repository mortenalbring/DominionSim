function [player] = actionJustSmithy(player)
%33 = Smithy

if any(player.hand==33)
    
    player.hand(find(player.hand == 33)) = [];
    
    player.discard(end+1) = 33;
    player = drawOneCard(player);
    player = drawOneCard(player);
    player = drawOneCard(player);    
end