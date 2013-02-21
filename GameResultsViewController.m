//
//  GameResultsViewController.m
//  machismo
//
//  Created by mike on 14/02/13.
//  Copyright (c) 2013 mike. All rights reserved.
//

#import "GameResultsViewController.h"

@interface GameResultsViewController ()
@property (weak, nonatomic) IBOutlet UITextView *display;

@end

@implementation GameResultsViewController









- (void) updateUI
{
    [self updateUIwithArray:[GameResult allGameResults]];
     
}

- (void) updateUIwithArray:(NSArray *)array
{
    NSLocale *auLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"fr_AU"];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setLocale:auLocale];

    
    NSString * displayText = @"";
    for(GameResult *results in array){
        
    displayText = [displayText stringByAppendingFormat:@"Score: \t%d \t\t(%@, \t%g)\n",results.score,[formatter stringFromDate:results.end], round(results.duration)];
        
    }
    self.display.text=displayText;
    
}
 
- (IBAction)sortByDate:(UIButton *)sender {
    NSArray * sortedArray = [[GameResult allGameResults] sortedArrayUsingSelector:@selector(dateCompare:)];
    [self updateUIwithArray:sortedArray];
}

- (IBAction)sortByScore:(UIButton *)sender {
    NSArray * sortedArray = [[GameResult allGameResults] sortedArrayUsingSelector:@selector(scoreCompare:)];
    [self updateUIwithArray:sortedArray];
    
}
- (IBAction)sortByDuration:(UIButton *)sender {
    NSArray * sortedArray = [[GameResult allGameResults] sortedArrayUsingSelector:@selector(durationCompare:)];
    [self updateUIwithArray:sortedArray];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateUI];
    
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}





@end
