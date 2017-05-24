//
//  TestResult.h
//  CZA
//
//  Created by Arkalyk Akash on 7/3/16.
//  Copyright © 2016 Arkalyk Akash. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestResults : NSObject

@property (nonatomic) NSString *letterCombination;
@property (nonatomic) NSString *resultsTextKaz;
@property (nonatomic) NSString *resultsTextRus;

-(instancetype)initWithLetterCombo:(NSString *)letterCombo andTextKaz:(NSString *)textKaz andTextRus:(NSString *)textRus;

@end
