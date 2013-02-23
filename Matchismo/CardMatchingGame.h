//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by David Hoelzer on 2/23/13.
//  Copyright (c) 2013 EnclaveForensics. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

#pragma mark Instance Methods
-(void)flipCardAtIndex:(NSUInteger)index;
-(Card *)cardAtIndex:(NSUInteger)index;

#pragma mark Properties
@property (readonly, nonatomic) int score;

#pragma mark Designated Initializer

-(id)initWithCardCount:(NSUInteger)count
             usingDeck:(Deck *)deck;

@end
