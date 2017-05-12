//
//  NewsCollectionViewCell.m
//  CZAstana
//
//  Created by ARKALYK AKASH on 5/13/17.
//  Copyright © 2017 ARKALYK AKASH. All rights reserved.
//

#import "NewsCollectionViewCell.h"
#import "UIFont+CZFont.h"

@implementation NewsCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.contentView.clipsToBounds = YES;
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        self.layer.shadowColor = [UIColor lightGrayColor].CGColor;
        self.layer.backgroundColor = [UIColor clearColor].CGColor;
        self.layer.shadowRadius = 5.0;
        self.layer.shadowOffset = CGSizeMake(3.0, 3.0);
        self.layer.shadowOpacity = 0.8;
        self.layer.masksToBounds = NO;
        self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:self.layer.cornerRadius].CGPath;
        
        self.titleTextView = [[UITextView alloc] initWithFrame:CGRectMake(5, 0, self.frame.size.width-10, 63)];
        self.titleTextView.editable = NO;
        self.titleTextView.scrollEnabled = NO;
        self.titleTextView.selectable = NO;
        self.titleTextView.text = @"В Астане запустили приложение для поиска работы";
        self.titleTextView.font = [UIFont fontRegularWithSize:17];
        
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.titleTextView.frame), self.frame.size.width, self.frame.size.width*0.8)];
        self.imageView.image = [UIImage imageNamed:@"app"];
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
        
        self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, CGRectGetMaxY(self.imageView.frame), self.frame.size.width, 30)];
        self.dateLabel.text = @"May 11th";
        self.dateLabel.textColor = [UIColor lightGrayColor];
        self.dateLabel.backgroundColor = [UIColor clearColor];
        self.dateLabel.font = [UIFont fontRegularWithSize:11];
        
        [self.contentView addSubview:self.titleTextView];
        [self.contentView addSubview:self.imageView];
        [self.contentView addSubview:self.dateLabel];
    }
    
    return self;
}

@end
