//
//  Vacancy.m
//  CZAstana
//
//  Created by ARKALYK AKASH on 5/24/17.
//  Copyright © 2017 ARKALYK AKASH. All rights reserved.
//

#import <Parse/Parse.h>
#import "Vacancy.h"

@implementation Vacancy

-(instancetype)initWithNameKaz:(NSString *)nameKaz andNameRus:(NSString *)nameRus andDescrKaz:(NSString *)descrKaz andDescrRus:(NSString *)descrRus andCategory:(NSString *)category andSalary:(int)salary andCreatedAt:(NSString *)createdAt{
    self = [super init];
    
    if (self) {
        self.nameKaz = nameKaz;
        self.nameRus = nameRus;
        self.descrKaz = descrKaz;
        self.descrRus = descrRus;
        self.category = category;
        self.salary = salary;
        self.createdAt = createdAt;
    }
    
    return self;
}

+(void)getAllVacanciesWithClosure:(void (^)(NSMutableArray *))closure{
    PFQuery *query = [PFQuery queryWithClassName:@"Vacancy"];
    [query orderByDescending:@"createdAt"];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if (!error) {
            NSMutableArray *vacancies = [NSMutableArray new];
            for (PFObject *object in objects) {
                NSString *nameKaz = object[@"nameKaz"];
                NSString *nameRus = object[@"nameRus"];
                NSString *descrKaz = object[@"descrKaz"];
                NSString *descrRus = object[@"descrRus"];
                NSString *category = object[@"category"];
                int salary = [object[@"salary"] intValue];
                NSString *createdAt = [self convertNSDatetoString:[object createdAt]];
                Vacancy *vacancy = [[Vacancy alloc] initWithNameKaz:nameKaz andNameRus:nameRus andDescrKaz:descrKaz andDescrRus:descrRus andCategory:category andSalary:salary andCreatedAt:createdAt];
                if ([vacancy.nameKaz length] != 0 && [vacancy.nameRus length] != 0) {
                    [vacancies addObject:vacancy];
                }
            }
            closure(vacancies);
        }
    }];
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
