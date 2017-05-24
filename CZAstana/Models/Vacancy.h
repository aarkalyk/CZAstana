//
//  Vacancy.h
//  CZAstana
//
//  Created by ARKALYK AKASH on 5/24/17.
//  Copyright © 2017 ARKALYK AKASH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Vacancy : NSObject

@property (nonatomic) NSString *nameKaz;
@property (nonatomic) NSString *nameRus;
@property (nonatomic) NSString *descrKaz;
@property (nonatomic) NSString *descrRus;
@property (nonatomic) NSString *category;
@property (nonatomic) int salary;
@property (nonatomic) NSString *createdAt;

-(instancetype)initWithNameKaz:(NSString *)nameKaz andNameRus:(NSString *)nameRus andDescrKaz:(NSString *)descrKaz andDescrRus:(NSString *)descrRus andCategory:(NSString *)category andSalary:(int )salary andCreatedAt:(NSString *)createdAt;

+(NSString *)convertNSDatetoString:(NSDate *)date;
+(void)getAllVacanciesWithClosure:(void(^)(NSMutableArray *vacancies)) closure;

@end
