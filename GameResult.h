//
//  GameResult.h
//  machismo
//
//  Created by mike on 15/02/13.
//  Copyright (c) 2013 mike. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameResult : NSObject

@property   (readonly, nonatomic) NSDate    *start;
@property   (readonly, nonatomic) NSDate    *end;
@property   (nonatomic) int                 score;

@property   (nonatomic)   NSTimeInterval    duration;
+(NSArray  *) allGameResults;


- (NSComparisonResult)dateCompare:(GameResult *)aGameResult;
- (NSComparisonResult)scoreCompare:(GameResult *)aGameResult;
- (NSComparisonResult)durationCompare:(GameResult *)aGameResult;

@end
