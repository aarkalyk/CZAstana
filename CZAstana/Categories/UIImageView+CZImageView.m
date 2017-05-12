//
//  UIImageView+CZImageView.m
//  CZAstana
//
//  Created by ARKALYK AKASH on 5/13/17.
//  Copyright © 2017 ARKALYK AKASH. All rights reserved.
//

#import "UIImageView+CZImageView.h"

@implementation UIImageView (CZImageView)

+(void)setColor:(UIColor *)color toImageView:(UIImageView *)imageView{
    UIImage *image = imageView.image;
    
    CGRect rect = CGRectMake(0, 0, imageView.frame.size.width, imageView.frame.size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClipToMask(context, rect, image.CGImage);
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImage *flippedImage = [UIImage imageWithCGImage:img.CGImage
                                                scale:1.0 orientation: UIImageOrientationDownMirrored];
    
    imageView.image = flippedImage;
}

@end
