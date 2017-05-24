//
//  HelperMethods.m
//  CZAstana
//
//  Created by ARKALYK AKASH on 5/24/17.
//  Copyright © 2017 ARKALYK AKASH. All rights reserved.
//

#import "HelperMethods.h"

@implementation HelperMethods

+(void)textViewDidChange:(UITextView *)textView
{
    CGFloat fixedWidth = textView.frame.size.width;
    CGSize newSize = [textView sizeThatFits:CGSizeMake(fixedWidth, MAXFLOAT)];
    CGRect newFrame = textView.frame;
    newFrame.size = CGSizeMake(fmaxf(newSize.width, fixedWidth), newSize.height);
    textView.frame = newFrame;
}


@end
