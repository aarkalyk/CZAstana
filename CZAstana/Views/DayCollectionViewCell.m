//
//  DayCollectionViewCell.m
//  CZAstana
//
//  Created by ARKALYK AKASH on 5/23/17.
//  Copyright © 2017 ARKALYK AKASH. All rights reserved.
//

#import "DayCollectionViewCell.h"
#import "UIFont+CZFont.h"

@implementation DayCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height)];
        self.titleLabel.textColor = [UIColor blackColor];
        self.titleLabel.font = [UIFont fontLightWithSize:15];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.layer.cornerRadius = self.frame.size.width/2.0;
        self.clipsToBounds = YES;
        
        [self.contentView addSubview:self.titleLabel];
    }
    
    return self;
}

@end
