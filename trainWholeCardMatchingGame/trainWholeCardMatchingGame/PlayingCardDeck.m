//
//  PlayingCardDeck.m
//  trainingCardGame2
//
//  Created by XIE Deyu on 16/4/24.
//  Copyright © 2016年 ___XIE_DEYU___. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck
//create 52 cards
-(instancetype)init{
    self = [super init];
    
    if(self){
        for (NSString *suit in [PlayingCard validSuits]) {
            for (NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++) {
                //just like java new: instancier un object
                PlayingCard *card = [[PlayingCard alloc]init];
                card.suit = suit;
                card.rank = rank;
                [self addCard:card];
            }
        }
        
    }
    
    return self;
}

@end
