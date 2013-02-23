//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by David Hoelzer on 2/23/13.
//  Copyright (c) 2013 EnclaveForensics. All rights reserved.
//

#import "CardMatchingGame.h"

#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2
#define FLIP_COST 1

@interface CardMatchingGame()

@property (readwrite, nonatomic) int score;
@property (readwrite, nonatomic) NSMutableArray *cards;

@end

@implementation CardMatchingGame

-(void)flipCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    if(card && !card.isUnplayable)
    {
        
        if(!card.isFaceUp)
        {
            for (Card *otherCard in self.cards) {
                if(otherCard.isFaceUp && !otherCard.isUnplayable)
                {
                    int matchScore = [card match:@[otherCard]];
                    if(matchScore)
                    {
                        card.unplayable = YES;
                        otherCard.unplayable = YES;
                        self.score += matchScore * MATCH_BONUS;
                    }
                    else
                    {
                        otherCard.faceUp = NO;
                        self.score -= MISMATCH_PENALTY;
                    }
                    break;
                }
                
            }
            self.score -= FLIP_COST;
        }
        card.faceUp = !card.isFaceUp;
    }
}

-(Card *)cardAtIndex:(NSUInteger)index
{
    if (index > [self.cards count]-1) {
        // This should be -1 unlike the Stanford demo.  Count is the total number,
        // the index however is zero based.
        return nil;
    }
    return self.cards[index];
}

-(id)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    // This is the designated initializer for this class.
    self = [super init];
    if(self)
    {
        _cards = [[NSMutableArray alloc] init];
        for (int i=0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if(!card)
            {
                // Not enough cards for the game!
                self = nil;
                break;
            }
            [self.cards addObject:card];
        }
    }
    return self;
}
@end
