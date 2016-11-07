//
//  CardMatchingGame.m
//  trainWholeCardMatchingGame
//
//  Created by XIE Deyu on 16/5/10.
//  Copyright © 2016年 ___XIE_DEYU___. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame ()
@property (nonatomic,readwrite) NSInteger score;
@property (nonatomic,strong) NSMutableArray *cards; //of card

@end

@implementation CardMatchingGame

//getter
-(NSMutableArray *)cards
{
    if(!_cards) _cards = [[NSMutableArray alloc]init];
    return _cards;
}

//怎么创建随机的一副牌
//！！！attention:这里 参数usingDeck:(Deck *)deck使用方法
-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    
    if (self){
        for (int i = 0; i < count; i ++){
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            }else {
                self = nil;
                break;
            }
        }
    }
    
    return self;
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

-(void)chooseCardAtIndex:(NSUInteger)index
{
    //instance  == self
    Card *card = [self cardAtIndex:index];
    
    if (!card.isMatched){
        if(card.isChosen){
            card.chosen = NO;
        }else {
            //if card noMatched noChosen
            //match against another card
            //order matters
            ////*******
            for (Card *otherCard in self.cards){
                if (otherCard.isChosen && !otherCard.isMatched) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        card.matched = YES;
                        otherCard.matched = YES;
                    }else {
                        //前一张卡是otherCard
                        self.score -=MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                    }
                    break;
                    
                }
            }
            //******/
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}

-(Card *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}
-(instancetype)init{
    return nil;
}

@end
