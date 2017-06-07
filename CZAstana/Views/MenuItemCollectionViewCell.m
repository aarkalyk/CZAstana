//
//  MenuItemCollectionViewCell.m
//  CZAstana
//
//  Created by ARKALYK AKASH on 5/4/17.
//  Copyright © 2017 ARKALYK AKASH. All rights reserved.
//

#import "MenuItemCollectionViewCell.h"
#import "UIFont+CZFont.h"

@implementation MenuItemCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.layer.cornerRadius = 10.0;
        self.clipsToBounds = YES;
        self.layer.shadowColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.5f].CGColor;
        self.layer.backgroundColor = [UIColor clearColor].CGColor;
        self.layer.shadowRadius = 4.0;
        self.layer.shadowOffset = CGSizeMake(2.0, 2.0);
        self.layer.shadowOpacity = 0.8;
        self.layer.masksToBounds = NO;
        self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:self.layer.cornerRadius].CGPath;
        
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, -4, self.contentView.frame.size.width*0.5, self.contentView.frame.size.height*0.5)];
        self.imageView.center = CGPointMake(self.contentView.center.x, self.contentView.center.y-10);
        self.imageView.image = [UIImage imageNamed:@"daniyar.jpg"];
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:self.imageView];
        
        self.titleTextView = [[UITextView alloc] initWithFrame:CGRectMake(0, self.contentView.frame.size.height*0.6, self.contentView.frame.size.width, self.contentView.frame.size.height*0.4)] ;
        self.titleTextView.text = @"DLYA РАБОТАДАТЕЛЕЙ";
        self.titleTextView.font = [UIFont fontLightWithSize:10.0];
        self.titleTextView.textAlignment = NSTextAlignmentCenter;
        self.titleTextView.scrollEnabled = NO;
        self.titleTextView.editable = NO;
        self.titleTextView.selectable = NO;
        self.titleTextView.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.titleTextView];
        
    }
    
    return self;
}

@end
