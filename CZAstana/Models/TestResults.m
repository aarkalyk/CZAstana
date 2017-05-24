//
//  TestResult.m
//  CZA
//
//  Created by Arkalyk Akash on 7/3/16.
//  Copyright © 2016 Arkalyk Akash. All rights reserved.
//

#import "TestResults.h"

@implementation TestResults

-(instancetype)initWithLetterCombo:(NSString *)letterCombo andTextKaz:(NSString *)textKaz andTextRus:(NSString *)textRus{
    self = [super init];
    
    if (self) {
        self.letterCombination = letterCombo;
        self.resultsTextKaz = textKaz;
        self.resultsTextRus = textRus;
    }
    
    return self;
}

@end
