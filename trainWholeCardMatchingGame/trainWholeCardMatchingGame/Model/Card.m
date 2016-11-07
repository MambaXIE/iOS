//
//  Card.m
//  trainWholeCardMatchingGame
//
//  Created by XIE Deyu on 16/5/10.
//  Copyright © 2016年 ___XIE_DEYU___. All rights reserved.
//

#import "Card.h"

@implementation Card
//_contents instance variable, self.contents call the mothede getter
//@synthesize contents = _contents;

-(int)match:(NSArray *)otherCards
{
    int score = 0;
    
    for (Card *card in otherCards){
        //here card.contents just called the function getContents()
        if ([card.contents isEqualToString:self.contents]){
            score = 1;
        }
    }
    return score;
}
@end
