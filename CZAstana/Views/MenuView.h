//
//  MenuView.h
//  CZAstana
//
//  Created by ARKALYK AKASH on 5/3/17.
//  Copyright © 2017 ARKALYK AKASH. All rights reserved.
//

#import "MenuCollectionViewCell.h"
#import <UIKit/UIKit.h>

@protocol MenuViewDelegate <NSObject>

-(void)pushVC:(UIViewController *)VC;

@end

@interface MenuView : UIView <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, MenuItemDelegate>

@property (nonatomic) UIImageView *imageView;
@property (nonatomic) UILabel *titleLabel;
@property (nonatomic) UICollectionView *collectionView;
@property (nonatomic) UIPageControl *pageControl;
@property (nonatomic) UIImageView *backgroundImageView;

@property (nonatomic) id <MenuViewDelegate> delegate;

@end
