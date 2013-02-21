//
//  CardMatchingGame.h

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject


- (id) initWithCardCount:(NSUInteger)cardCount
               usingDeck:(Deck *) deck;
// gameType:(NSUInteger) gameType;

- (void) flipCardAtIndex:(NSUInteger) index;

- (Card *) cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) int score;
@property (nonatomic, readonly) NSString *resultDialog;

@property (nonatomic, readonly) NSString *statusString;



@end


