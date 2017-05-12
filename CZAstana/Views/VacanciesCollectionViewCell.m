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
        CGFloat imageWidth = self.frame.size.width*0.8;
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width/2.0-imageWidth/2.0, self.frame.size.height/2.0-imageWidth/2.0, imageWidth, imageWidth)];
        self.imageView.layer.cornerRadius = self.imageView.frame.size.width/2.0;
        self.imageView.clipsToBounds = YES;
        self.backgroundColor = [UIColor clearColor];
        
        [self.contentView addSubview:self.imageView];
    }
    
    return self;
}

@end
