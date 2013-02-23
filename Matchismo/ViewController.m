//
//  ViewController.m
//  Matchismo
//
//  Created by David Hoelzer on 2/22/13.
//  Copyright (c) 2013 EnclaveForensics. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface ViewController ()
@property (nonatomic) NSUInteger timesFlipped;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (nonatomic) CardMatchingGame *game;
@end


@implementation ViewController

-(CardMatchingGame *)game
{
    if(!_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                  usingDeck:[[PlayingCardDeck alloc] init]];
    }
    return _game;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)setCardButtons:(NSArray *)cardButtons
{
    _cardButtons = cardButtons;
    [self updateUI];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)flipCard:(UIButton *)sender {
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    self.timesFlipped ++;
    [self updateUI];
}

-(void)updateUI
{
    for (UIButton *button in self.cardButtons) {
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:button]];
        [button setTitle:[card contents] forState:UIControlStateSelected];
        [button setTitle:[card contents] forState:(UIControlStateSelected|UIControlStateDisabled)];
        [button setSelected:[card isFaceUp]];
        [button setEnabled:![card isUnplayable]];
        button.alpha = (card.isUnplayable ? 0.5 : 1);
        if (![card isFaceUp]) {
            [button setImage:[UIImage imageNamed:@"cardBack.jpeg"] forState:UIControlStateNormal];
        }
        else
        {
            [button setImage:nil forState:UIControlStateNormal];
        }
    }
    [self.numberOfFlips setText:[NSString stringWithFormat:@"Flips: %u", self.timesFlipped]];
    [self.scoreLabel setText:[NSString stringWithFormat:@"Score: %d", [self.game score]]];
    [self.statusLabel setText:self.game.lastMatchStatus];
    
}
@end
