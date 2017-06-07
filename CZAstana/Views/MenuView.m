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

@synthesize delegate;

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        CGFloat imageSize = self.frame.size.width*0.23;
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width/2.0-imageSize/2.0, 15, imageSize, imageSize)];
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
        //[self addSubview:self.titleLabel];
        
        CAGradientLayer *gradientMask = [CAGradientLayer layer];
        gradientMask.frame = self.titleLabel.bounds;
        gradientMask.colors = @[(id)[UIColor mainGreenColor].CGColor,
                                (id)[[UIColor customDarkGreenColor] colorWithAlphaComponent:0.3f].CGColor];
        self.titleLabel.layer.mask = gradientMask;
        
        UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.imageView.frame)-10, self.frame.size.width, self.frame.size.width+20) collectionViewLayout:flowLayout];
        self.collectionView.backgroundColor = [UIColor clearColor];
        self.collectionView.showsHorizontalScrollIndicator = NO;
        self.collectionView.pagingEnabled = YES;
        [self.collectionView registerClass:[MenuCollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        
        self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.collectionView.frame)+5, self.frame.size.width, 10)];
        self.pageControl.center = CGPointMake(self.center.x, self.pageControl.center.y);
        self.pageControl.currentPageIndicatorTintColor = [UIColor mainGreenColor];
        self.pageControl.pageIndicatorTintColor = [UIColor customLightGrayColor];
        self.pageControl.numberOfPages = 2;
        self.pageControl.currentPage = 0;
        
        self.backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.frame.size.height-300, self.frame.size.width+40, 300)];
        self.backgroundImageView.center = CGPointMake(self.center.x, self.backgroundImageView.center.y);
        self.backgroundImageView.contentMode = UIViewContentModeScaleAspectFit;
        self.backgroundImageView.image = [UIImage imageNamed:@"background"];
        
        [self addSubview:self.backgroundImageView];
        [self addSubview:self.collectionView];
        [self addSubview:self.pageControl];
        [self addSubview:self.imageView];
    }
    
    return self;
}

#pragma mark - MenuItemDelegate
-(void)pushVC:(UIViewController *)VC{
    NSLog(@"\nin menuView!");
    [self.delegate pushVC:VC];
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
    
    cell.delegate = self;
    cell.backgroundColor = [UIColor clearColor];
    if (indexPath.row == 0) {
        cell.iconNames = [[NSMutableArray alloc] initWithObjects:@"О центре", @"Новости", @"Статистика", @"соискателям", @"Вакансия", @"работодателям", @"Соц.рабоч. места", @"МП", @"проф.обучение", nil];
    }else{
        cell.iconNames = [[NSMutableArray alloc] initWithObjects:@"Тест", @"Полезная информация", @"О приложении", nil];
    }
    
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return  collectionView.frame.size;
}

-(void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        self.pageControl.currentPage = 1;
    }else{
        self.pageControl.currentPage = 0;
    }
}

@end
