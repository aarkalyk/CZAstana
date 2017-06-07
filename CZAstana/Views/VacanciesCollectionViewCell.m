//
//  VacanciesCollectionViewCell.m
//  CZAstana
//
//  Created by ARKALYK AKASH on 5/12/17.
//  Copyright © 2017 ARKALYK AKASH. All rights reserved.
//

#import "VacanciesCollectionViewCell.h"
#import "UIColor+CZColor.h"
#import "UIFont+CZFont.h"

@implementation VacanciesCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.contentView.layer.cornerRadius = self.contentView.frame.size.height/2.0;
        self.contentView.clipsToBounds = YES;
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        CGFloat imageWidth = self.frame.size.width*0.7;
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width/2.0-imageWidth/2.0, self.frame.size.height/2.0-imageWidth/2.0, imageWidth, imageWidth)];
        self.backgroundColor = [UIColor whiteColor];
        self.imageView.layer.cornerRadius = self.imageView.frame.size.width/2.0;
        self.imageView.clipsToBounds = YES;
        
        CGFloat numberWidth = self.frame.size.width*0.4;
        self.numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width-numberWidth, 0, numberWidth, numberWidth)];
        self.numberLabel.backgroundColor = [UIColor newLightBlueColor];
        self.numberLabel.textColor = [UIColor whiteColor];
        self.numberLabel.textAlignment = NSTextAlignmentCenter;
        self.numberLabel.layer.cornerRadius = self.numberLabel.frame.size.width/2.0;
        self.numberLabel.clipsToBounds = YES;
        self.numberLabel.font = [UIFont fontLightWithSize:15];
        self.numberLabel.text = @"3";
        
        [self.contentView addSubview:self.imageView];
        [self addSubview:self.numberLabel];
    }
    
    return self;
}

@end
