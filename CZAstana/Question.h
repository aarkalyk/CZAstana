//
//  Question.h
//  CZA
//
//  Created by Arkalyk Akash on 6/10/16.
//  Copyright © 2016 Arkalyk Akash. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject


@property (nonatomic) NSString *optionKaz1;
@property (nonatomic) NSString *optionKaz2;
@property (nonatomic) NSString *optionRus1;
@property (nonatomic) NSString *optionRus2;
@property (nonatomic) NSString *option1Letter;
@property (nonatomic) NSString *option2Letter;

-(instancetype)initWithOptionKaz1:(NSString *)optionKaz1 andOptionKaz2:(NSString *)optionKaz2 andOptionRus1:(NSString *)optionRus1 andOptionRus2:(NSString *)optionRus2 andOption1Letter:(NSString *)option1Letter andOption2Letter:(NSString *)option2Letter;

+(void)getAllQuestionsWithClosure:(void(^)(NSArray *questions)) closure;

@end
