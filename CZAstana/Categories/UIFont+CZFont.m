//
//  UIFont+CZFont.m
//  CZAstana
//
//  Created by ARKALYK AKASH on 5/4/17.
//  Copyright © 2017 ARKALYK AKASH. All rights reserved.
//

#import "UIFont+CZFont.h"

@implementation UIFont (CZFont)

+(UIFont *)fontLightWithSize:(CGFloat)size{
    return [UIFont fontWithName:@"Avenir-Light" size:size];
}

+(UIFont *)fontRegularWithSize:(CGFloat)size{
    return [UIFont fontWithName:@"Avenir-Heavy" size:size];
}

+(UIFont *)fontBoldWithSize:(CGFloat)size{
    return [UIFont fontWithName:@"Avenir-Black" size:size];
}

+(UIFont *)futuraExtraBoldWithSize:(CGFloat)size{
    return [UIFont fontWithName:@"Futura-CondensedExtraBold" size:size];
}

@end
