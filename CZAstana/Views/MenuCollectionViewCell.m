//
//  MenuCollectionViewCell.m
//  CZAstana
//
//  Created by ARKALYK AKASH on 5/3/17.
//  Copyright © 2017 ARKALYK AKASH. All rights reserved.
//

#import "MenuItemCollectionViewCell.h"
#import "InternshipsViewController.h"
#import "VacanciesViewController.h"
#import "MenuCollectionViewCell.h"
#import "StatsViewController.h"
#import "NewsViewController.h"
#import "TestViewController.h"

@implementation MenuCollectionViewCell

@synthesize delegate;

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
        flowLayout.minimumLineSpacing = 10;
        flowLayout.minimumInteritemSpacing = 10;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, self.contentView.frame.size.height/2.0-(self.contentView.frame.size.width-20)/2.0, self.contentView.frame.size.width, self.contentView.frame.size.width) collectionViewLayout:flowLayout];
        self.collectionView.backgroundColor = [UIColor clearColor];
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        [self.collectionView registerClass:[MenuItemCollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
        [self.contentView addSubview:self.collectionView];
    }
    
    return self;
}

#pragma mark - CollectionView delegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.iconNames.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MenuItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor whiteColor];
    cell.imageView.image = [UIImage imageNamed:self.iconNames[indexPath.row]];
    cell.titleTextView.text = self.iconNames[indexPath.row];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.iconNames.count > 3) {
        if (indexPath.row == 1) {
            [self.delegate pushVC:[NewsViewController new]];
        }else if(indexPath.row == 4){
            [self.delegate pushVC:[VacanciesViewController new]];
        }else if(indexPath.row == 7){
            [self.delegate pushVC:[InternshipsViewController new]];
        }else if(indexPath.row == 2){
            [self.delegate pushVC:[StatsViewController new]];
        }
    }else{
        if (indexPath.row == 0) {
            [self.delegate pushVC:[TestViewController new]];
        }
    }
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((collectionView.frame.size.width-40)/3.0, (collectionView.frame.size.width-40)/3.0);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

@end
