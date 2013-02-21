//
//  PlayingCardCollectionViewCell.h
//  machismo
//
//  Created by mike on 21/02/13.
//  Copyright (c) 2013 mike. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayingCardView.h"



@interface PlayingCardCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet PlayingCardView *playingCardView;

@end
