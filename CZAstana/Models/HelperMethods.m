//
//  HelperMethods.m
//  CZAstana
//
//  Created by ARKALYK AKASH on 5/24/17.
//  Copyright © 2017 ARKALYK AKASH. All rights reserved.
//

#import "HelperMethods.h"

@implementation HelperMethods

+(void)textViewDidChange:(UITextView *)textView
{
    CGFloat fixedWidth = textView.frame.size.width;
    CGSize newSize = [textView sizeThatFits:CGSizeMake(fixedWidth, MAXFLOAT)];
    CGRect newFrame = textView.frame;
    newFrame.size = CGSizeMake(fmaxf(newSize.width, fixedWidth), newSize.height);
    textView.frame = newFrame;
}

+(NSString *)convertNSDatetoString:(NSDate *)date{
    NSArray* monthsKZ = [[NSArray alloc] initWithObjects:@"Қаңтар", @"Ақпан", @"Наурыз", @"Сәуір", @"Мамыр", @"Маусым", @"Шілде", @"Тамыз", @"Қыркүйек", @"Қазан", @"Қараша", @"Желтоқсан", nil];
    
    NSDate* currentDate = [NSDate date];
    NSTimeZone* currentTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
    NSTimeZone* nowTimeZone = [NSTimeZone systemTimeZone];
    NSInteger currentGMTOffset = [currentTimeZone secondsFromGMTForDate:currentDate];
    NSInteger nowGMTOffset = [nowTimeZone secondsFromGMTForDate:currentDate];
    NSTimeInterval interval = nowGMTOffset - currentGMTOffset;
    NSDate* nowDate = [[NSDate alloc] initWithTimeInterval:interval sinceDate:currentDate];
    
    NSTimeInterval distanceBetweenDates = [nowDate timeIntervalSinceDate:date];
    double secondsInMinute = 60;
    NSInteger minutesBetweenDates = (distanceBetweenDates - 360*60)/secondsInMinute;
    
    NSString *dateString = [NSString new];
    int hours = (int)minutesBetweenDates/60;
    int days = (int)minutesBetweenDates/(60*24);
    NSLog(@"hours %i", hours);
    if (minutesBetweenDates < 60) {
        dateString = [NSString stringWithFormat:@"%lo минут бұрын", minutesBetweenDates];
    }
    else if( hours < 24 ){
        NSLog(@" \n\n\n %i сағат бұрын", hours);
        dateString = [NSString stringWithFormat:@"%i сағат бұрын", hours];
    }else{
        if (days < 32) {
            dateString = [NSString stringWithFormat:@"%i күн бұрын", days];
        }else{
            NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
            [dateFormat setDateFormat:@"d"];
            NSString* dayString = [dateFormat stringFromDate:date];
            [dateFormat setDateFormat:@"M"];
            NSString* monthString = [dateFormat stringFromDate:date];
            [dateFormat setDateFormat:@"YYYY"];
            NSString* yearString = [dateFormat stringFromDate:date];
            
            dateString = [NSString stringWithFormat:@"%@ %@ %@", dayString, monthsKZ[[monthString intValue]-1], yearString];
        }
    }
    
    return dateString;
}

@end
