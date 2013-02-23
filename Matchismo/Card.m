//
//  Card.m
//  Matchismo
//
//  Created by David Hoelzer on 2/22/13.
//  Copyright (c) 2013 EnclaveForensics. All rights reserved.
//

#import "Card.h"

@implementation Card

-(int)match:(NSArray *)cards
{
    int score = 0;
    for (Card *card in cards)
    {
        if([[card contents] isEqualToString:[self contents]])
        {
            score = 1;
        }
    }
    return score;
}

@end
