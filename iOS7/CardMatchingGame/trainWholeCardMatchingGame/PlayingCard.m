//
//  PlayingCard.m
//  trainWholeCardMatchingGame
//
//  Created by XIE Deyu on 16/5/10.
//  Copyright © 2016年 ___XIE_DEYU___. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

-(int)match:(NSArray *)otherCards
{
    //need to instantion
    int score = 0;
    
    //match only with another card
    if ([otherCards count] == 1){
        PlayingCard *otherCard = [otherCards firstObject];
        
        if ([self.suit isEqualToString:otherCard.suit]){
            score = 1;
        }else if(self.rank == otherCard.rank) {
            score = 4;
        }
    }
    return score;
}

//content of card
-(NSString *)contents{
    NSArray *rankString = [PlayingCard rankString];
    
    return [rankString[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit;
//suit
+(NSArray *)validSuits{
    return @[@"♦️",@"♥️",@"♣️",@"♠️"];
}

-(NSString *)suit{
    return _suit ? _suit : @"?";
}

-(void)setSuit:(NSString *)suit{
    if ([[PlayingCard validSuits] containsObject:suit]){
        _suit = suit;
    }
}
//rank
+(NSArray *)rankString {
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"k"];
}
//在类方法里使用类方法，可以用self，在实例方法里使用类方法只能用类名
+(NSUInteger)maxRank{
    return [[self rankString] count] - 1;
    //return [[PlayingCard rankString] count] - 1;

}

-(void)setRank:(NSUInteger)rank{
    if (rank <= [PlayingCard maxRank]){
        _rank = rank;
    }
}



@end
