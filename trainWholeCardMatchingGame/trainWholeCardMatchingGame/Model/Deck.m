//
//  Deck.m
//  trainWholeCardMatchingGame
//
//  Created by XIE Deyu on 16/5/10.
//  Copyright © 2016年 ___XIE_DEYU___. All rights reserved.
//

#import "Deck.h"
@interface Deck ()
//不知道数组里的元素是什么类型的
@property (strong,nonatomic) NSMutableArray *cards;
@end

@implementation Deck
//lazy instantion card
-(NSMutableArray *) cards
{
    if (!_cards) _cards = [[NSMutableArray alloc]init];
    return _cards;
}

-(void)addCard:(Card *)card atTop:(BOOL)atTop
{
    if (atTop){
        [self.cards insertObject:card atIndex:0];
    }else {
        [self.cards addObject:card];
    }
}

-(void)addCard:(Card *)card
{
    [self addCard:card atTop:NO];
}

-(Card *)drawRandomCard
{
    Card *randomCard = nil;
    //如果没有这条件 out of bounds
    if([self.cards count]){
    //random index of card from deck
    unsigned index = arc4random() % [self.cards count];
    randomCard = self.cards[index];
    //fuck i miss it!!!!
    [self.cards removeObject:randomCard];
    }
    return randomCard;
}

@end
