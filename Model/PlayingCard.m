//
//  PlayingCard.m

#import "PlayingCard.h"

@implementation PlayingCard

-(int) match:(NSArray *)otherCards{
    int score= 0;
    
    
    if (otherCards.count == 1 ){
        id otherCard = [otherCards lastObject];
        
        if ([otherCard isKindOfClass:[PlayingCard  class] ]) {
            PlayingCard *otherPlayingCard = (PlayingCard *) otherCard;
        
        if([otherPlayingCard.suit isEqualToString:self.suit]){
            score = 1;
        }else if (otherPlayingCard.rank == self.rank){
            score = 4;
        }
    }
        
        
    }
    
    return score;
    
}

- (NSString *) contents
{
    
    return [[PlayingCard rankStrings][self.rank] stringByAppendingString:self.suit];
    
}

@synthesize suit = _suit;   // because we provided a setter and getter

+ (NSArray *)  rankStrings
{
    static NSArray *rankStrings = nil;
    rankStrings=@[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"J",@"Q",@"K"];
    return  rankStrings;
    
}

+ (NSArray *) validSuits
{
    static NSArray *validSuits = nil;
    if (!validSuits) validSuits = @[@"♥",@"♦",@"♠",@"♣"];
    return validSuits;
    
}

+ (NSUInteger)maxRank {  return [self rankStrings].count -1; }




-(void) setRank:(NSUInteger)rank
{
    if (rank <=[PlayingCard maxRank]) {
        _rank=rank;
    }
}


-(void) setSuit:(NSString *)suit
{
    if ([[[self class] validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

-(NSString *) suit
{
    return _suit ? _suit : @"?";
    
}


@end
