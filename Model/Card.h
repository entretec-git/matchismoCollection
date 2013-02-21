//
//  Card.h


#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong,nonatomic) NSString   * contents;
@property  (nonatomic, getter = isFaceUp) BOOL faceUp;
@property   (nonatomic,getter = isUnPlayable) BOOL unplayable;
-(int) match:(NSArray *) otherCards;


@end
