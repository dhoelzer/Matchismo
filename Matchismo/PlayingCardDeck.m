//
//  PlayingCardDeck.m
//  Matchismo
//
//  Created by David Hoelzer on 2/22/13.
//  Copyright (c) 2013 EnclaveForensics. All rights reserved.
//

#import "PlayingCardDeck.h"


@implementation PlayingCardDeck
-(id)init
{
    self = [super init];
    if (self) {
        for (NSString *suit in [PlayingCard validSuits])
        {
            for (NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++)
            {
                PlayingCard *card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                // No need to try to deal with the internal cards property...
                // Just use the existing methods to manipulate stuff!
                [self addCard:card atTop:YES];
            }
        }
    }
    return self;
}


@end
