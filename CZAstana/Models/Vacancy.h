//
//  Vacancy.h
//  CZAstana
//
//  Created by ARKALYK AKASH on 5/24/17.
//  Copyright © 2017 ARKALYK AKASH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HelperMethods.h"
#import <Parse/Parse.h>

@interface Vacancy : NSObject

@property (nonatomic) NSString *nameKaz;
@property (nonatomic) NSString *nameRus;
@property (nonatomic) NSString *descrKaz;
@property (nonatomic) NSString *descrRus;
@property (nonatomic) NSString *category;
@property (nonatomic) int salary;
@property (nonatomic) NSString *createdAt;
@property (nonatomic) PFObject *parseObject;

-(instancetype)initWithNameKaz:(NSString *)nameKaz andNameRus:(NSString *)nameRus andDescrKaz:(NSString *)descrKaz andDescrRus:(NSString *)descrRus andCategory:(NSString *)category andSalary:(int )salary andCreatedAt:(NSString *)createdAt andParseObject:(PFObject *)parseObject;

+(void)getAllVacanciesWithClosure:(void(^)(NSMutableArray *vacancies)) closure;

@end
