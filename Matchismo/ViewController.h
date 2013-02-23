//
//  ViewController.h
//  Matchismo
//
//  Created by David Hoelzer on 2/22/13.
//  Copyright (c) 2013 EnclaveForensics. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)flipCard:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *numberOfFlips;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

@end
