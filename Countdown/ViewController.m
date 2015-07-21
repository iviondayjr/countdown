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
    NSString *countdownString;
    NSString *clockString;
    
    NSDateFormatter *dateFormatter;
    NSDateFormatter *targetFormatter;
    
    NSDate *date;
    NSString *dateString;
    
    NSDate *morningGrainLockDate;
    NSString *morningGrainLockString;
    
    NSDate *nightGrainLockDate;
    NSString *nightGrainLockString;
    
    NSDate *targetDate;

    NSCalendar *calendar;
    NSDateComponents *components;
}
@end

//@implementation CALayer (Additions)
//- (void)setBorderColorFromUIColor:(UIColor *)color
//{
//    self.borderColor = color.CGColor;
//}
//@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // load sounds, should be an array
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
    
    date = [NSDate date];
    
    // display todays date in the input field
    dateFormatter = [[NSDateFormatter alloc] init];
    
    targetFormatter = [[NSDateFormatter alloc] init];
    [targetFormatter setDateFormat:@"EEE, MMMM dd, yyyy, HH:mm:ss"];
    
    calendar = [NSCalendar currentCalendar];
    components = [calendar components:(NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond) fromDate:date];
    
    NSCalendarOptions options = NSCalendarMatchNextTime;
    morningGrainLockDate = [calendar nextDateAfterDate:date
                                          matchingHour:8
                                                minute:29
                                                second:30
                                               options:options];
    morningGrainLockString = [targetFormatter stringFromDate:morningGrainLockDate];
    
    nightGrainLockDate = [calendar nextDateAfterDate:date
                                          matchingHour:18
                                                minute:59
                                                second:30
                                               options:options];
    nightGrainLockString = [targetFormatter stringFromDate:nightGrainLockDate];
        
    dateString = [targetFormatter stringFromDate:date];
    
    if ([date timeIntervalSinceDate:morningGrainLockDate] < 0) {
        self.textField.text = nightGrainLockString;
    } else if ([date timeIntervalSinceDate:nightGrainLockDate] < 0) {
        self.textField.text = morningGrainLockString;
    }
    
    [self updateClockLabel];
    // stuff
}

-(void)updateClockLabel {
    
    if ([self.countdownLabel.text isEqualToString:@"-10.0"]) {
        [_ten play];
    } else if ([self.countdownLabel.text isEqualToString:@"-9.0"]) {
        [_nine play];
    } else if ([self.countdownLabel.text isEqualToString:@"-8.0"]) {
        [_eight play];
    } else if ([self.countdownLabel.text isEqualToString:@"-7.0"]) {
        [_seven play];
    } else if ([self.countdownLabel.text isEqualToString:@"-6.0"]) {
        [_six play];
    } else if ([self.countdownLabel.text isEqualToString:@"-5.0"]) {
        [_five play];
    } else if ([self.countdownLabel.text isEqualToString:@"-4.0"]) {
        [_four play];
    } else if ([self.countdownLabel.text isEqualToString:@"-3.0"]) {
        [_three play];
    } else if ([self.countdownLabel.text isEqualToString:@"-2.0"]) {
        [_two play];
    } else if ([self.countdownLabel.text isEqualToString:@"-1.0"]) {
        [_one play];
    } else if ([self.countdownLabel.text isEqualToString:@"0.0"]) {
        [_zero play];
    }
    
//    self.destinationLabel.text = self.textField.text;
    
    // create formatter to display dates how we want
    [dateFormatter setDateFormat:@"HH:mm:ss"];
    
    clockString = [dateFormatter stringFromDate:[NSDate date]];
    
    self.clockLabel.text = clockString;
    
    // create date object from user input
    targetDate = [targetFormatter dateFromString:self.textField.text];
    
    // create date 30 seconds ahead
    NSDate *openTime = [targetDate dateByAddingTimeInterval:30];
    
    openString = [targetFormatter stringFromDate:openTime];
    
    // calculate difference in times
    NSTimeInterval diff = [[NSDate date] timeIntervalSinceDate:targetDate];
    
    // convert double back to string to display
    countdownString = [NSString stringWithFormat:@"%.1f", diff];
    
    self.countdownLabel.text = countdownString;
    
    [self performSelector:@selector(updateClockLabel) withObject:self afterDelay:0.01];
}

// add 30 seconds button
- (IBAction)addSeconds:(id)sender {
    self.textField.text = openString;
    
    NSLog( @"%@", morningGrainLockDate);
    NSLog( @"%@", nightGrainLockDate);
    NSLog( @"%@", date);
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