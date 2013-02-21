//
//  CardPlayViewController.m

#import "CardPlayViewController.h"
#import "CardMatchingGame.h"
#import "GameResult.h"



@interface CardPlayViewController ()  <UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (nonatomic) NSInteger gameType;
@property   (strong,nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *resultsLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *gameTypeController;
@property  (strong,nonatomic) GameResult    *gameResult;
@property (weak, nonatomic) IBOutlet UICollectionView *cardCollectionView;

- (IBAction)dealCards:(id)sender;

@end

@implementation CardPlayViewController

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.startingCardCount;
    
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PlayingCard" forIndexPath:indexPath];
    Card *card  = [self.game cardAtIndex:indexPath.item];
  
    
    [self updateCell:cell usingCard:card];
    return cell;
    
    
}


-(void) updateCell:(UICollectionViewCell *)cell usingCard:(Card *)card
{
        // abstract
}



- (GameResult *) gameResult
{
    if(!_gameResult)   _gameResult = [[GameResult alloc] init];
    return _gameResult;
}

- (Deck *) createDeck
{
    return nil;    //Abstract
}


-(CardMatchingGame *) game{
        //- (id) initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck gameType:(NSUInteger) gameType

    if(!_game) _game = [[CardMatchingGame alloc] initWithCardCount:self.startingCardCount 
                                                         usingDeck:[self createDeck]];
    
    return _game;
     
} 

-(void) updateUI
{
    for (UICollectionViewCell *cell in [self.cardCollectionView visibleCells])
        {
            NSIndexPath *indexPath = [self.cardCollectionView indexPathForCell:cell];
            Card * card = [self.game cardAtIndex:indexPath.item];
            [self updateCell:cell usingCard:card];
            
            
    }
    
    
    self.scoreLabel.text = [NSString stringWithFormat:@"Score %d", self.game.score];
    self.resultsLabel.text = self.game.resultDialog;
    
}


- (void) setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d",self.flipCount];
    
}

- (IBAction)flipCard:(UITapGestureRecognizer *)gesture
{
        //  Set the game type controller to inactive
        //self.gameTypeController.enabled = NO;
    CGPoint tapLocation = [gesture locationInView:self.cardCollectionView];
    NSIndexPath *indexPath = [self.cardCollectionView indexPathForItemAtPoint:tapLocation];
    if (indexPath) {
        
                [self.game flipCardAtIndex:indexPath.item];
                self.flipCount++;
                self.resultsLabel.text = @"";
                [self updateUI];
                self.gameResult.score = self.game.score;
    }
    
            
    
        //  sender.selected = !sender.isSelected;
 
    
    
}
- (IBAction)dealCards:(id)sender {
    
        //  Set the game type controller to active
    self.gameTypeController.enabled = YES;
    
        //  Tell the user we are starting a new game
    UIAlertView *myAlert = [[UIAlertView alloc] initWithTitle:@"Starting a new game!"
                                                      message:nil
                                                     delegate:nil
                                            cancelButtonTitle:nil
                                            otherButtonTitles:@"OK", nil];
    
    [myAlert show];
    
        //  nil the game and reset our statusessess
    self.game = nil;
    [self setFlipCount:0];
    self.resultsLabel.text = @"";
    self.gameResult = nil;
    [self updateUI];
}


@end
