//
//  ImageCollectionViewCell.m
//  CZAstana
//
//  Created by ARKALYK AKASH on 5/26/17.
//  Copyright © 2017 ARKALYK AKASH. All rights reserved.
//

#import "ImageCollectionViewCell.h"

@implementation ImageCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width*0.9, self.contentView.frame.size.height*0.9)];
        self.imageView.center = self.contentView.center;
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:self.imageView];
    }
    
    return self;
}

@end
