//
//  CardMatchingGame.m

#import "CardMatchingGame.h"

#define TWO_CARD_GAME 0
#define THREE_CARD_GAME 1

#define FLIP_COST 1
#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2
#define FLIP_MESSAGE @"Flipped up %@", card.contents
#define TWO_MATCH_MESSAGE @"Matched %@ & %@ for %d points!", card.contents, otherCard.contents, MATCH_BONUS
#define NO_TWO_MATCH_MESSAGE @"%@ & %@ don't match! -%d points!", card.contents, otherCard.contents, MISMATCH_PENALTY
#define THREE_MATCH_MESSAGE @"%@ & %@ & %@ for %d points!", card.contents, firstCard.contents, secondCard.contents, MATCH_BONUS
#define NO_THREE_MATCH_MESSAGE @"%@ & %@ & %@ don't match!", card.contents, firstCard.contents, secondCard.contents



@interface CardMatchingGame()
@property (strong,nonatomic) NSMutableArray *cards;
@property (nonatomic, readwrite) int score;
@property (nonatomic, readwrite)  NSString *resultDialog;
@property (nonatomic) NSUInteger gameType;

@end



@implementation CardMatchingGame

 -(NSMutableArray *) cards
{
        // lazy instatiation 
    if(!_cards) _cards = [[NSMutableArray alloc]init];
    return _cards;
}

- (id) initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck   ////gameType:(NSUInteger) gameType
{
    self = [super init];
    
    if (self){
        for (int i =0; i < cardCount; i++){
            Card *card = [deck drawRandomCard];
            if(!card){
                self = nil;
            }
               else{
                    self.cards[i] = card;
                    
                }
            }
        }
        
        ///  self.gameType = gameType;
    
    return self;
    
}

-(Card *)cardAtIndex:(NSUInteger)index
{
    return (index < self.cards.count) ? self.cards[index] : nil;
    
}




- (void)flipCardAtIndex:(NSUInteger)index{
    
    Card *card = [self cardAtIndex:index];
    
        //  Is the card playable?
    if(card &&!card.isUnPlayable){
        if(!card.isFaceUp){
        
                //  Determine if we are matching 2 or 3 cards
            if (self.gameType  == TWO_CARD_GAME) {
                    //  Let the user know they flipped a card
                self.resultDialog = [NSString stringWithFormat:FLIP_MESSAGE];
                
                for (Card *otherCard in self.cards){    //  Enumerate the cards
                    
                    // If the other card is face up and playable
        
                    if (otherCard.isFaceUp && !otherCard.isUnPlayable){
                            int matchScore = [card match:@[otherCard]];
                
                            if (matchScore){
                                otherCard.unplayable =YES;
                                card.unplayable = YES;
                                self.score += matchScore + MATCH_BONUS;
                                self.resultDialog = [NSString stringWithFormat:TWO_MATCH_MESSAGE];

               
                            
                            }
                else{
                                otherCard.faceUp = NO;
                                self.score -= MISMATCH_PENALTY;
                                self.resultDialog = [NSString stringWithFormat:NO_TWO_MATCH_MESSAGE];

                }
                break;
            }
            
        }
        
        
    }  else if (self.gameType == THREE_CARD_GAME) {
        
        
            //  Let the user know they flipped a card
        self.resultDialog = [NSString stringWithFormat:FLIP_MESSAGE];

        
            //  Make an array to store our cards
        NSMutableArray *otherCards = [NSMutableArray array];

        
            //  Enumerate the cards
        for (Card *otherCard in self.cards) {
        
                // If the other card is face up and playable
            if (otherCard.isFaceUp && !otherCard.isUnPlayable) {
                [otherCards addObject:otherCard];
            }
        }

        if ([otherCards count] == 2) {
                //  Get the cards and look for a match
            Card *firstCard = [otherCards objectAtIndex:0];
            Card *secondCard = [otherCards lastObject];
            
            int matchScore = [card match:(NSArray *)otherCards];
            
            
            
                //  If it was a match add to the score
            if (matchScore) {
                
                    //  Take the cards out of play
                firstCard.unplayable = YES;
                secondCard.unplayable = YES;
                card.unplayable = YES;
                
                self.score += matchScore + MATCH_BONUS;
                
                    //  Tell the user what they matched
                self.resultDialog = [NSString stringWithFormat:THREE_MATCH_MESSAGE];
                
            } else {
                
                    //  If it wasn't a match pay the grim price
                firstCard.faceUp = NO;
                secondCard.faceUp = NO;
                card.faceUp = YES;
                
                self.score -= MISMATCH_PENALTY;
                
                    //  Tell the user they didn't match anything
                self.resultDialog = [NSString stringWithFormat:NO_THREE_MATCH_MESSAGE];
                
                }
              }
            }
          }
        }
    
        self.score -= FLIP_COST;
       card.faceUp = !card.isFaceUp;
}

    
@end
