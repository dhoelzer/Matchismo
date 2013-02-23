//
//  Deck.m
//  Matchismo
//
//  Created by David Hoelzer on 2/22/13.
//  Copyright (c) 2013 EnclaveForensics. All rights reserved.
//

#import "Deck.h"

@interface Deck()

@property (strong, nonatomic) NSMutableArray *cards;

@end

@implementation Deck

-(NSMutableArray *)cards
{
    if(!_cards)
    {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

-(void)addCard:(Card *)card atTop:(BOOL)atTop
{
    if (card) {
        if (atTop) {
            [self.cards insertObject:card atIndex:0];
        }
        else {
            [self.cards addObject:card];
        }
    }
}

-(Card *)drawRandomCard
{
    Card *randomCard;
    unsigned int randomIndex;
    
    if(self.cards) {
        randomIndex = arc4random() % self.cards.count;
        randomCard = [self.cards objectAtIndex:randomIndex];
        [self.cards removeObjectAtIndex:randomIndex];
    }
    return randomCard;
}

-(NSUInteger)cardsRemaining
{
    return self.cards.count;
}

@end
