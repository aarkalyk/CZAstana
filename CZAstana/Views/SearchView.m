//
//  SearchView.m
//  CZAstana
//
//  Created by ARKALYK AKASH on 5/13/17.
//  Copyright © 2017 ARKALYK AKASH. All rights reserved.
//

#import "UIImageView+CZImageView.h"
#import "UIColor+CZColor.h"
#import "SearchView.h"

@implementation SearchView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        CGFloat imageWidth = 25.0;
        self.filterImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width-44+7, self.frame.size.height/2.0-imageWidth/2.0, imageWidth, imageWidth)];
        self.filterImageView.image = [UIImage imageNamed:@"filter"];
        [UIImageView setColor:[UIColor whiteColor] toImageView:self.filterImageView];
        [self addSubview:self.filterImageView];
        
        self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width-44+7, self.frame.size.height)];
        self.searchBar.placeholder = @"Я ищу...";
        [self addSubview:self.searchBar];
        
        self.lineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height-1.0, self.frame.size.width, 1.0)];
        self.lineView.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:self.lineView];
        
        self.backgroundColor = [UIColor customLightGrayColor];
    }
    
    return self;
}

@end
