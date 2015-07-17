//
//  ViewController.h
//  Countdown
//
//  Created by Patrick Montag on 7/2/15.
//  Copyright (c) 2015 Patrick Montag. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *clockLabel;
@property (weak, nonatomic) IBOutlet UILabel *destinationLabel;
@property (weak, nonatomic) IBOutlet UILabel *countdownLabel;
@property (weak, nonatomic) IBOutlet UIButton *addSeconds;

-(void)updateClockLabel;

@end