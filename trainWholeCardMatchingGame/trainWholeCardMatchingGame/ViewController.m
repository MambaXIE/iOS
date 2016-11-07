//
//  ViewController.m
//  trainWholeCardMatchingGame
//
//  Created by XIE Deyu on 16/5/10.
//  Copyright © 2016年 ___XIE_DEYU___. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface ViewController ()
//感觉可以不用
//@property (nonatomic,strong) Deck *deck;
@property (nonatomic,strong) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end

@implementation ViewController

//game getter
-(CardMatchingGame *)game
{
    if(!_game) _game = [[CardMatchingGame alloc]initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    return _game;
}

-(Deck *)createDeck
{
    //called method init and this will create a deck which contains 52 cards
    /*********************************************/
    /*********************************************/
    /*********************************************/
    return [[PlayingCardDeck alloc]init];
}

- (IBAction)cardTouchButton:(UIButton *)sender {
    NSUInteger cardIndex = [self.cardButtons indexOfObject:sender];
    //分+卡的状态变化
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
    
}

-(void)updateUI
{
    for (UIButton *cardButton in self.cardButtons){
        //indexOfObjet return the number of this object
        NSUInteger cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"score: %ld",(long)self.game.score];
}
-(NSString *)titleForCard:(Card *)card
{
    return card.isChosen ? card.contents : @"";
}

-(UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"cardFront" : @"cardBack"];
}




@end
