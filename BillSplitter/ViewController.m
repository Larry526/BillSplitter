//
//  ViewController.m
//  BillSplitter
//
//  Created by Larry Luk on 2017-11-10.
//  Copyright © 2017 App App Studio. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()



@property (weak, nonatomic) IBOutlet UITextField *billAmount;
@property (weak, nonatomic) IBOutlet UILabel *splitAmount;
@property (assign, nonatomic) NSInteger numberOfPeople;
@property (weak, nonatomic) IBOutlet UILabel *sliderDisplay;
@property (strong, nonatomic) NSNumberFormatter *numberFormatter;
@property (weak, nonatomic) IBOutlet UISlider *peopleCount;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _numberFormatter = [[NSNumberFormatter alloc]init];
    [_numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    [_numberFormatter setMaximumFractionDigits:2];
    [_numberFormatter setRoundingMode:NSNumberFormatterRoundUp];
    _numberOfPeople = _peopleCount.value;


}

- (IBAction)peopleCount:(UISlider *)sender {
    self.numberOfPeople = sender.value;
    self.sliderDisplay.text = [NSString stringWithFormat:@"%ld people splitting", self.numberOfPeople];
    
}

- (IBAction)calculateSplitAmount:(UIButton *)sender {
//    NSNumber *splitCalc = [NSNumber numberWithFloat:[self.billAmount.text floatValue] / self.numberOfPeople];
    NSNumber *splitCalc = @([self.billAmount.text floatValue] / self.numberOfPeople);
    NSDecimalNumber *splitCalcDecimal = [NSDecimalNumber decimalNumberWithDecimal:[splitCalc decimalValue]];
    self.splitAmount.text = [self.numberFormatter stringFromNumber:splitCalcDecimal];
   
}


@end
