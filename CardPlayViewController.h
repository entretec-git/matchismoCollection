//
//  CardPlayViewController.h
//  machismo
//
//  Created by mike on 6/02/13.
//  Copyright (c) 2013 mike. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"

@interface CardPlayViewController : UIViewController

- (Deck *) createDeck;     // Abstract
@property (nonatomic)   NSInteger startingCardCount;   // Abstract

-(void) updateCell:(UICollectionViewCell *)cell usingCard:(Card *)card;


@end
