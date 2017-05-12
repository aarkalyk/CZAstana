//
//  VacanciesCollectionViewCell.m
//  CZAstana
//
//  Created by ARKALYK AKASH on 5/12/17.
//  Copyright © 2017 ARKALYK AKASH. All rights reserved.
//

#import "VacanciesCollectionViewCell.h"

@implementation VacanciesCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.contentView.layer.cornerRadius = self.contentView.frame.size.height/2.0;
        self.contentView.clipsToBounds = YES;
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        CGFloat imageWidth = self.frame.size.width*0.7;
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width/2.0-imageWidth/2.0, self.frame.size.height/2.0-imageWidth/2.0, imageWidth, imageWidth)];
        self.backgroundColor = [UIColor clearColor];
        
        [self.contentView addSubview:self.imageView];
    }
    
    return self;
}

@end
