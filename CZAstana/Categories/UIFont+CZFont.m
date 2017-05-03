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
    return [UIFont fontWithName:@"Helvetica-Light" size:size];
}

+(UIFont *)fontRegularWithSize:(CGFloat)size{
    return [UIFont fontWithName:@"Helvetica-Regular" size:size];
}

+(UIFont *)fontBoldWithSize:(CGFloat)size{
    return [UIFont fontWithName:@"Helvetica-Bold" size:size];
}

@end
