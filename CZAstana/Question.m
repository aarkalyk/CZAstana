//
//  Question.m
//  CZA
//
//  Created by Arkalyk Akash on 6/10/16.
//  Copyright © 2016 Arkalyk Akash. All rights reserved.
//

#import <Parse/Parse.h>
#import "Question.h"

@implementation Question

-(instancetype)initWithOptionKaz1:(NSString *)optionKaz1 andOptionKaz2:(NSString *)optionKaz2 andOptionRus1:(NSString *)optionRus1 andOptionRus2:(NSString *)optionRus2 andOption1Letter:(NSString *)option1Letter andOption2Letter:(NSString *)option2Letter{
    self = [super init];
    
    if (self) {
        self.optionKaz1 = optionKaz1;
        self.optionKaz2 = optionKaz2;
        self.optionRus1 = optionRus1;
        self.optionRus2 = optionRus2;
        self.option1Letter = option1Letter;
        self.option2Letter = option2Letter;
    }
    
    return self;
}

+(void)getAllQuestionsWithClosure:(void (^)(NSArray *))closure{
    PFQuery *query = [PFQuery queryWithClassName:@"Question"];
    [query orderByAscending:@"createdAt"];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if (!error) {
            NSMutableArray *questions = [NSMutableArray new];
            for (PFObject *object in objects) {
                NSString *optionKaz1 = object[@"optionKaz1"];
                NSString *optionKaz2 = object[@"optionKaz2"];
                NSString *optionRus1 = object[@"optionRus1"];
                NSString *optionRus2 = object[@"optionRus2"];
                NSString *option1Letter = object[@"option1Letter"];
                NSString *option2Letter = object[@"option2Letter"];
                Question *question = [[Question alloc] initWithOptionKaz1:optionKaz1 andOptionKaz2:optionKaz2 andOptionRus1:optionRus1 andOptionRus2:optionRus2 andOption1Letter:option1Letter andOption2Letter:option2Letter];
                [questions addObject:question];
            }
            closure(questions);
        }
    }];
}

@end
