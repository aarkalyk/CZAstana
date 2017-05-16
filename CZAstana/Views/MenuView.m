//
//  MenuView.m
//  CZAstana
//
//  Created by ARKALYK AKASH on 5/3/17.
//  Copyright © 2017 ARKALYK AKASH. All rights reserved.
//

#import "MenuCollectionViewCell.h"
#import "UIColor+CZColor.h"
#import "UIFont+CZFont.h"
#import "MenuView.h"

@implementation MenuView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        UIView *statusBarBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 20)];
        statusBarBackgroundView.backgroundColor = [UIColor mainGreenColor];
        [self addSubview:statusBarBackgroundView];
        
        CGFloat imageSize = self.frame.size.width*0.25;
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width/2.0-imageSize/2.0, CGRectGetMaxY(statusBarBackgroundView.frame)+15, imageSize, imageSize)];
        self.imageView.image = [UIImage imageNamed:@"logo.png"];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.imageView.frame)+10, self.frame.size.width, 25)];
        CGPoint center = self.titleLabel.center;
        self.titleLabel.font = [UIFont fontRegularWithSize:19];
        self.titleLabel.textColor = [UIColor mainGreenColor];
        self.titleLabel.text = @"CZ ASTANA";
        [self.titleLabel sizeToFit];
        self.titleLabel.frame = CGRectMake(self.titleLabel.frame.origin.x-5, self.titleLabel.frame.origin.y, self.titleLabel.frame.size.width+10, self.titleLabel.frame.size.height);
        self.titleLabel.center = center;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.backgroundColor = [UIColor mainGreenColor];
        self.titleLabel.textColor = [UIColor whiteColor];
        self.titleLabel.layer.cornerRadius = 5.0f;
        self.titleLabel.clipsToBounds = YES;
        [self addSubview:self.titleLabel];
        
        CAGradientLayer *gradientMask = [CAGradientLayer layer];
        gradientMask.frame = self.titleLabel.bounds;
        gradientMask.colors = @[(id)[UIColor mainGreenColor].CGColor,
                                (id)[[UIColor customDarkGreenColor] colorWithAlphaComponent:0.3f].CGColor];
        self.titleLabel.layer.mask = gradientMask;
        
        UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.titleLabel.frame)-10, self.frame.size.width, self.frame.size.width+20) collectionViewLayout:flowLayout];
        self.collectionView.backgroundColor = [UIColor clearColor];
        self.collectionView.showsHorizontalScrollIndicator = NO;
        self.collectionView.pagingEnabled = YES;
        [self.collectionView registerClass:[MenuCollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        
        [self addSubview:self.collectionView];
        [self addSubview:self.imageView];
    }
    
    return self;
}

#pragma mark - CollectionView delegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 2;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MenuCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return  collectionView.frame.size;
}



@end
