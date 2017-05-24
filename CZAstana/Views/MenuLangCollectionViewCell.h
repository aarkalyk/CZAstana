//
//  MenuLangCollectionViewCell.h
//  CZA
//
//  Created by Arkalyk Akash on 6/11/16.
//  Copyright © 2016 Arkalyk Akash. All rights reserved.
//
#import <RadioButton/RadioButton.h>
#import <UIKit/UIKit.h>

@interface MenuLangCollectionViewCell : UICollectionViewCell<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic) UICollectionView *collectionView;
@property (nonatomic) NSMutableArray *colors;
@property (nonatomic) RadioButton *rButton1;
@property (nonatomic) RadioButton *rButton2;
@property (nonatomic) NSMutableArray* buttons;
@property (nonatomic) UILabel* chooseLanguageLabel;
@property (nonatomic) NSMutableArray *imageNames;
@property (nonatomic) NSMutableArray *categoryNames;
@property (nonatomic) NSMutableArray *categoryNamesKaz;
@property (nonatomic) NSMutableArray *identifierNames;

@property (nonatomic) NSMutableArray *questions;

@property (nonatomic) NSMutableArray *menuItems;

@property (nonatomic) UIButton *confirmButton;

@property (nonatomic) UIImageView *logoImageView;

@end
