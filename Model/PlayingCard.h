//
//  PlayingCard.h
//  machismo
//
//  Created by mike on 6/02/13.
//  Copyright (c) 2013 mike. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property   (strong,nonatomic) NSString *suit;
@property   (nonatomic) NSUInteger  rank;

+ (NSArray *) validSuits;
+ (NSUInteger)maxRank;
+ (NSArray *)  rankStrings;

@end
