function [player] = actionJustSmithy(player)
%33 = Smithy

disp('testing for smithy')

if any(player.hand==33)
    disp('Have smithy card in hand')
    player.hand
    player.hand(find(player.hand == 33)) = [];
    
    disp('Just set Smithy to empty???')
    player.hand
    player.discard(end+1) = 33;
    disp('Drawing three cards')
    player = drawOneCard(player);
    player = drawOneCard(player);
    player = drawOneCard(player);
    player.hand
else
   disp('No smithy in hand') 
end