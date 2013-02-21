//
//  PlayCardGameViewController.m
//  machismo
//
//  Created by mike on 21/02/13.
//  Copyright (c) 2013 mike. All rights reserved.
//

#import "PlayCardGameViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"
#import "PlayingCardCollectionViewCell.h"


@interface PlayCardGameViewController ()

@end

@implementation PlayCardGameViewController

- (Deck *) createDeck
{
    return [[PlayingCardDeck alloc]init];
    
}


- (NSInteger) startingCardCount
{
    return  20;
}

-(void)updateCell:(UICollectionViewCell *)cell usingCard:(Card *)card
{

if ([cell isKindOfClass:[PlayingCardCollectionViewCell class]])
    {
  
    PlayingCardView *playingCardView = ((PlayingCardCollectionViewCell *)cell).playingCardView;
        if ([card isKindOfClass:[PlayingCard class]]) {
            PlayingCard *playingCard = (PlayingCard *)card;
            playingCardView.rank = playingCard.rank;
            playingCardView.suit = playingCard.suit;
            playingCardView.faceUp = playingCard.isFaceUp;
            playingCardView.alpha  = playingCard.isUnPlayable ? 0.3 : 1.0;
            
        }
    
    }
}




@end
