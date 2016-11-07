//
//  PlayingCard.h
//  trainWholeCardMatchingGame
//
//  Created by XIE Deyu on 16/5/10.
//  Copyright © 2016年 ___XIE_DEYU___. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card
@property (strong,nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+(NSArray *) validSuits;
+(NSUInteger) maxRank;
@end
