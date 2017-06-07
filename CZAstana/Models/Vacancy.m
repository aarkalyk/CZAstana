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

-(instancetype)initWithNameKaz:(NSString *)nameKaz andNameRus:(NSString *)nameRus andDescrKaz:(NSString *)descrKaz andDescrRus:(NSString *)descrRus andCategory:(NSString *)category andSalary:(int)salary andCreatedAt:(NSString *)createdAt andParseObject:(PFObject *)parseObject{
    self = [super init];
    
    if (self) {
        self.nameKaz = nameKaz;
        self.nameRus = nameRus;
        self.descrKaz = descrKaz;
        self.descrRus = descrRus;
        self.category = category;
        self.salary = salary;
        self.createdAt = createdAt;
        self.parseObject = parseObject;
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
                NSString *createdAt = [HelperMethods convertNSDatetoString:[object createdAt]];
                Vacancy *vacancy = [[Vacancy alloc] initWithNameKaz:nameKaz andNameRus:nameRus andDescrKaz:descrKaz andDescrRus:descrRus andCategory:category andSalary:salary andCreatedAt:createdAt andParseObject:object];
                if ([nameKaz length] > 0 && [nameRus length] > 0) {
                    [vacancies addObject:vacancy];
                }
            }
            closure(vacancies);
        }
    }];
}


@end
