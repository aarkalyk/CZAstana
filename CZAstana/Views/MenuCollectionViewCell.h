//
//  MenuCollectionViewCell.h
//  CZAstana
//
//  Created by ARKALYK AKASH on 5/3/17.
//  Copyright © 2017 ARKALYK AKASH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuCollectionViewCell : UICollectionViewCell <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic) UICollectionView *collectionView;

@property (nonatomic) NSMutableArray *iconNames;
@property (nonatomic) NSMutableArray *titles;

@end
