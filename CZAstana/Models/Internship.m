//
//  Internship.m
//  CZAstana
//
//  Created by ARKALYK AKASH on 5/24/17.
//  Copyright © 2017 ARKALYK AKASH. All rights reserved.
//

#import <Parse/Parse.h>
#import "Internship.h"

@implementation Internship

-(instancetype)initWithNameKaz:(NSString *)nameKaz andNameRus:(NSString *)nameRus andDescrKaz:(NSString *)descrKaz andDescrRus:(NSString *)descrRus andCategory:(NSString *)category andCreatedAt:(NSString *)createdAt{
    self = [super init];
    
    if (self) {
        self.nameKaz = nameKaz;
        self.nameRus = nameRus;
        self.descrKaz = descrKaz;
        self.descrRus = descrRus;
        self.category = category;
        self.createdAt = createdAt;
    }
    
    return self;
}

+(void)getAllInternshipsWithClosure:(void(^)(NSMutableArray *internships)) closure{
    PFQuery *query = [PFQuery queryWithClassName:@"Internship"];
    [query orderByDescending:@"createdAt"];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if (!error) {
            NSMutableArray *internships = [NSMutableArray new];
            for (PFObject *object in objects) {
                NSString *nameKaz = object[@"nameKaz"];
                NSString *nameRus = object[@"nameRus"];
                NSString *descrKaz = object[@"descrKaz"];
                NSString *descrRus = object[@"descrRus"];
                NSString *category = object[@"category"];
                NSString *createdAt = [HelperMethods convertNSDatetoString:[object createdAt]];
                
                Internship *internship = [[Internship alloc] initWithNameKaz:nameKaz andNameRus:nameRus andDescrKaz:descrKaz andDescrRus:descrRus andCategory:category andCreatedAt:createdAt];
                if (([nameKaz length] > 0)) {
                    [internships addObject:internship];
                }
            }
            closure(internships);
        }
    }];
}

@end
