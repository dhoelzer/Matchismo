//
//  PlayingCard.m
//  Matchismo
//
//  Created by David Hoelzer on 2/22/13.
//  Copyright (c) 2013 EnclaveForensics. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard
@synthesize suit = _suit;

-(NSString *)contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

-(void)setRank:(NSUInteger)rank
{
    _rank = (rank > [PlayingCard maxRank] ? [PlayingCard maxRank] : rank);
}
-(void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]){
        _suit = suit;
    }
}

-(NSString *)suit
{
    return _suit ? _suit : @"?";
}

-(int)match:(NSArray *)cards
{
    int score=0;
    if(cards.count == 1)
    {
        PlayingCard *otherCard = [cards lastObject];
        if (self.rank == otherCard.rank) {
            score += 4;
        }
        if ([self.suit isEqualToString:[otherCard suit]]) {
            score += 2;
        }
    }
    return score;
}

#pragma mark Class Methods
+(NSArray *)validSuits
{
    return @[@"♠", @"♣", @"♥", @"♦"];
}

+(NSArray *)rankStrings
{
    return @[@"?", @"A", @"2", @"3", @"4", @"5",
             @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+(NSUInteger)maxRank
{
    return [self rankStrings].count-1;
}

@end
