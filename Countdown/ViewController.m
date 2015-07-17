//
//  ViewController.m
//  Countdown
//
//  Created by Patrick Montag on 7/2/15.
//  Copyright (c) 2015 Patrick Montag. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import "ViewController.h"

@interface ViewController () {
    AVAudioPlayer *_ten;
    AVAudioPlayer *_nine;
    AVAudioPlayer *_eight;
    AVAudioPlayer *_seven;
    AVAudioPlayer *_six;
    AVAudioPlayer *_five;
    AVAudioPlayer *_four;
    AVAudioPlayer *_three;
    AVAudioPlayer *_two;
    AVAudioPlayer *_one;
    AVAudioPlayer *_zero;
    
    NSString *openString;
}
@end

@implementation ViewController

// add 30 seconds button
- (IBAction)addSeconds:(id)sender {
    self.textField.text = openString;
    NSLog( @"%@", openString);
}

-(void)updateClockLabel {
    
    self.destinationLabel.text = self.textField.text;
    
    // create formatter to display dates how we want
    NSDateFormatter *fullFormat = [[NSDateFormatter alloc] init];
    [fullFormat setDateFormat:@"EEE, yyyy-MM-dd HH:mm:ss"];
    
    NSString *clockString = [fullFormat stringFromDate:[NSDate date]];
    
    self.clockLabel.text = clockString;
    
    // create date object from user input
    NSDate *destinationDate = [fullFormat dateFromString:self.textField.text];
    
    // create date 30 seconds ahead
    NSDate *openTime = [destinationDate dateByAddingTimeInterval:30];
    
    openString = [fullFormat stringFromDate:openTime];
    
    // calculate difference in times
    NSTimeInterval diff = [[NSDate date] timeIntervalSinceDate:destinationDate];
    
    // convert double back to string to display
    NSString *countdownString = [NSString stringWithFormat:@"%.2f", diff];
    self.countdownLabel.text = countdownString;
    
    [self performSelector:@selector(updateClockLabel) withObject:self afterDelay:0.001];
    
    if ([self.countdownLabel.text isEqualToString:@"-10.00"]) {
        [_ten play];
    } else if ([self.countdownLabel.text isEqualToString:@"-9.00"]) {
        [_nine play];
    } else if ([self.countdownLabel.text isEqualToString:@"-8.00"]) {
        [_eight play];
    } else if ([self.countdownLabel.text isEqualToString:@"-7.00"]) {
        [_seven play];
    } else if ([self.countdownLabel.text isEqualToString:@"-6.00"]) {
        [_six play];
    } else if ([self.countdownLabel.text isEqualToString:@"-5.00"]) {
        [_five play];
    } else if ([self.countdownLabel.text isEqualToString:@"-4.00"]) {
        [_four play];
    } else if ([self.countdownLabel.text isEqualToString:@"-3.00"]) {
        [_three play];
    } else if ([self.countdownLabel.text isEqualToString:@"-2.00"]) {
        [_two play];
    } else if ([self.countdownLabel.text isEqualToString:@"-1.00"]) {
        [_one play];
    } else if ([self.countdownLabel.text isEqualToString:@"0.00"]) {
        [_zero play];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
// 10
    NSString *pathTen = [NSString stringWithFormat:@"%@/ten.wav", [[NSBundle mainBundle] resourcePath]];
    NSURL *soundTen = [NSURL fileURLWithPath:pathTen];
    _ten = [[AVAudioPlayer alloc] initWithContentsOfURL:soundTen error:nil];
// 9
    NSString *pathNine = [NSString stringWithFormat:@"%@/nine.wav", [[NSBundle mainBundle] resourcePath]];
    NSURL *soundNine = [NSURL fileURLWithPath:pathNine];
    _nine = [[AVAudioPlayer alloc] initWithContentsOfURL:soundNine error:nil];
// 8
    NSString *pathEight = [NSString stringWithFormat:@"%@/eight.wav", [[NSBundle mainBundle] resourcePath]];
    NSURL *soundEight = [NSURL fileURLWithPath:pathEight];
    _eight = [[AVAudioPlayer alloc] initWithContentsOfURL:soundEight error:nil];
// 7
    NSString *pathSeven = [NSString stringWithFormat:@"%@/seven.wav", [[NSBundle mainBundle] resourcePath]];
    NSURL *soundSeven = [NSURL fileURLWithPath:pathSeven];
    _seven = [[AVAudioPlayer alloc] initWithContentsOfURL:soundSeven error:nil];
// 6
    NSString *pathSix = [NSString stringWithFormat:@"%@/six.wav", [[NSBundle mainBundle] resourcePath]];
    NSURL *soundSix = [NSURL fileURLWithPath:pathSix];
    _six = [[AVAudioPlayer alloc] initWithContentsOfURL:soundSix error:nil];
// 5
    NSString *pathFive = [NSString stringWithFormat:@"%@/five.wav", [[NSBundle mainBundle] resourcePath]];
    NSURL *soundFive = [NSURL fileURLWithPath:pathFive];
    _five = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFive error:nil];
// 4
    NSString *pathFour = [NSString stringWithFormat:@"%@/four.wav", [[NSBundle mainBundle] resourcePath]];
    NSURL *soundFour = [NSURL fileURLWithPath:pathFour];
    _four = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFour error:nil];
// 3
    NSString *pathThree = [NSString stringWithFormat:@"%@/three.wav", [[NSBundle mainBundle] resourcePath]];
    NSURL *soundThree = [NSURL fileURLWithPath:pathThree];
    _three = [[AVAudioPlayer alloc] initWithContentsOfURL:soundThree error:nil];
// 2
    NSString *pathTwo = [NSString stringWithFormat:@"%@/two.wav", [[NSBundle mainBundle] resourcePath]];
    NSURL *soundTwo = [NSURL fileURLWithPath:pathTwo];
    _two = [[AVAudioPlayer alloc] initWithContentsOfURL:soundTwo error:nil];
// 1
    NSString *pathOne = [NSString stringWithFormat:@"%@/one.wav", [[NSBundle mainBundle] resourcePath]];
    NSURL *soundOne = [NSURL fileURLWithPath:pathOne];
    _one = [[AVAudioPlayer alloc] initWithContentsOfURL:soundOne error:nil];
// 0
    NSString *pathZero = [NSString stringWithFormat:@"%@/zero.wav", [[NSBundle mainBundle] resourcePath]];
    NSURL *soundZero = [NSURL fileURLWithPath:pathZero];
    _zero = [[AVAudioPlayer alloc] initWithContentsOfURL:soundZero error:nil];
    
    // display todays date in the input field
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"EEE, yyyy-MM-dd HH:mm:ss"];
    NSDate *todaysDate = [NSDate date];
    NSString *todaysString = [formatter stringFromDate:todaysDate];
    
    self.textField.text = todaysString;
    
    [self updateClockLabel];
    // stuff
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end