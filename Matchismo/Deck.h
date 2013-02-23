//
//  Deck.h
//  Matchismo
//
//  Created by David Hoelzer on 2/22/13.
//  Copyright (c) 2013 EnclaveForensics. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject


-(void)addCard:(Card *)card atTop:(BOOL)atTop;
-(Card *)drawRandomCard;
-(NSUInteger)cardsRemaining;
@end
