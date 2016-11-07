//
//  Deck.h
//  trainWholeCardMatchingGame
//
//  Created by XIE Deyu on 16/5/10.
//  Copyright © 2016年 ___XIE_DEYU___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject
-(void)addCard:(Card *)card atTop:(BOOL)atTop;
-(void)addCard:(Card *)card;
-(Card *)drawRandomCard;

@end
