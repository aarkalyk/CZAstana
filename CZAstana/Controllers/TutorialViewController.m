//
//  TutorialViewController.m
//  CZAstana
//
//  Created by ARKALYK AKASH on 5/26/17.
//  Copyright © 2017 ARKALYK AKASH. All rights reserved.
//

#import "ImageCollectionViewCell.h"
#import "UIImageView+CZImageView.h"
#import "TutorialViewController.h"
#import "AboutViewController.h"
#import "MenuViewController.h"
#import "NewsViewController.h"
#import "FavViewController.h"
#import "UIColor+CZColor.h"
#import "UIImage+CZImage.h"

@interface TutorialViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic) UICollectionView *collectionView;
@property (nonatomic) UIButton *getStartedButton;
@property (nonatomic) UITabBarController *tabBarController;
@property (nonatomic) UIPageControl *pageControl;
@property (nonatomic) NSArray *imageNamesArray;

@end

@implementation TutorialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.imageNamesArray = @[@"tutorial1", @"tutorial2", @"tutorial3", @"tutorial4"];
    
    UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, -50, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:flowLayout];
    self.collectionView.center = CGPointMake(self.view.center.x, self.collectionView.center.y);
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.showsHorizontalScrollIndicator = NO;
    [self.collectionView registerClass:[ImageCollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    [self.view addSubview:self.collectionView];
    
    self.getStartedButton = [[UIButton alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-80, self.view.frame.size.width*0.5, 44)];
    self.getStartedButton.center = CGPointMake(self.view.center.x, self.getStartedButton.center.y);
    [self.getStartedButton setTitle:@"Начать" forState:UIControlStateNormal];
    self.getStartedButton.backgroundColor = [UIColor mainGreenColor];
    [self.getStartedButton addTarget:self action:@selector(getStartedButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    self.getStartedButton.layer.cornerRadius = self.getStartedButton.frame.size.height/2.0;
    [self.view addSubview:self.getStartedButton];
    
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.getStartedButton.frame.origin.y-30, self.view.frame.size.width, 10)];
    self.pageControl.currentPageIndicatorTintColor = [UIColor mainGreenColor];
    self.pageControl.pageIndicatorTintColor = [UIColor customLightGrayColor];
    self.pageControl.numberOfPages = self.imageNamesArray.count;
    self.pageControl.currentPage = 0;
    [self.view addSubview:self.pageControl];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Selector actions
-(void)getStartedButtonPressed{
    MenuViewController *menuVC  = [MenuViewController new];
    //menuVC.title = @"Menu";
    UINavigationController *navigationController1 = [[UINavigationController alloc] initWithRootViewController:menuVC];
    [navigationController1.navigationBar setTranslucent:NO];
    navigationController1.navigationBar.barTintColor = [UIColor mainGreenColor];
    navigationController1.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                                               [UIColor whiteColor], NSForegroundColorAttributeName,
                                                               [UIFont fontWithName:@"ArialMT" size:16.0], NSFontAttributeName,nil];
    navigationController1.navigationBar.tintColor = [UIColor whiteColor];
    //navigationController1.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor blackColor]};
    
    FavViewController *vacanciesVC = [FavViewController new];
    //vacanciesVC.title = @"Vacancies";
    UINavigationController *navigationController2 = [[UINavigationController alloc] initWithRootViewController:vacanciesVC];
    [navigationController2.navigationBar setTranslucent:NO];
    navigationController2.navigationBar.barTintColor = [UIColor mainGreenColor];
    navigationController2.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                                               [UIColor whiteColor], NSForegroundColorAttributeName,
                                                               [UIFont fontWithName:@"ArialMT" size:16.0], NSFontAttributeName,nil];
    navigationController2.navigationBar.tintColor = [UIColor whiteColor];
    //navigationController2.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor blackColor]};
    
    NewsViewController *newsVC = [NewsViewController new];
    //newsVC.title = @"News";
    UINavigationController *navigationController3 = [[UINavigationController alloc] initWithRootViewController:newsVC];
    [navigationController3.navigationBar setTranslucent:NO];
    navigationController3.navigationBar.barTintColor = [UIColor mainGreenColor];
    navigationController3.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                                               [UIColor whiteColor], NSForegroundColorAttributeName,
                                                               [UIFont fontWithName:@"ArialMT" size:16.0], NSFontAttributeName,nil];
    navigationController3.navigationBar.tintColor = [UIColor whiteColor];
    navigationController3.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor blackColor]};
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:[AboutViewController new]];
    [navigationController.navigationBar setTranslucent:NO];
    navigationController.navigationBar.barTintColor = [UIColor mainGreenColor];
    navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                                              [UIColor whiteColor], NSForegroundColorAttributeName,
                                                              [UIFont fontWithName:@"ArialMT" size:16.0], NSFontAttributeName,nil];
    navigationController.navigationBar.tintColor = [UIColor whiteColor];
    //navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor blackColor]};
    
    UINavigationController *navigationController4 = [[UINavigationController alloc] initWithRootViewController:[UIViewController new]];
    [navigationController4.navigationBar setTranslucent:NO];
    navigationController4.navigationBar.barTintColor = [UIColor mainGreenColor];
    navigationController4.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                                               [UIColor whiteColor], NSForegroundColorAttributeName,
                                                               [UIFont fontWithName:@"ArialMT" size:16.0], NSFontAttributeName,nil];
    navigationController4.navigationBar.tintColor = [UIColor whiteColor];
    //navigationController4.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor blackColor]};
    
    UINavigationController *navigationController5 = [[UINavigationController alloc] initWithRootViewController:[UIViewController new]];
    [navigationController5.navigationBar setTranslucent:NO];
    navigationController5.navigationBar.barTintColor = [UIColor mainGreenColor];
    navigationController5.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                                               [UIColor whiteColor], NSForegroundColorAttributeName,
                                                               [UIFont fontWithName:@"ArialMT" size:16.0], NSFontAttributeName,nil];
    navigationController5.navigationBar.tintColor = [UIColor whiteColor];
    //navigationController5.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor blackColor]};
    
    self.tabBarController = [UITabBarController new];
    NSArray<UIViewController *> *controllers = [[NSArray alloc] initWithObjects: navigationController2, navigationController, navigationController1, navigationController3, navigationController4, nil];
    self.tabBarController.viewControllers = controllers;
    UITabBarItem *item = self.tabBarController.tabBar.items[0];
    item.image = [UIImage imageWithImage:[UIImage imageNamed:@"star"] scaledToSize:CGSizeMake(26, 26)];
    item.title = @"Избранные";
    UITabBarItem *item1 = self.tabBarController.tabBar.items[1];
    item1.image = [UIImage imageWithImage:[UIImage imageNamed:@"pin"] scaledToSize:CGSizeMake(26, 26)];
    item1.title = @"О нас";
    UITabBarItem *item2 = self.tabBarController.tabBar.items[2];
    item2.image = [UIImage imageWithImage:[UIImage imageNamed:@"home"] scaledToSize:CGSizeMake(26, 26)];
    item2.title = @"Меню";
    UITabBarItem *item3 = self.tabBarController.tabBar.items[3];
    item3.image = [UIImage imageWithImage:[UIImage imageNamed:@"bell"] scaledToSize:CGSizeMake(26, 26)];
    item3.title = @"Уведомления";
    UITabBarItem *item4 = self.tabBarController.tabBar.items[4];
    item4.image = [UIImage imageWithImage:[UIImage imageNamed:@"settings"] scaledToSize:CGSizeMake(26, 26)];
    item4.title = @"Настройки";
    self.tabBarController.tabBar.translucent = NO;
    self.tabBarController.tabBar.barTintColor = [UIColor whiteColor];
    self.tabBarController.tabBar.shadowImage = [UIImage new];
    self.tabBarController.tabBar.tintColor = [UIColor secondaryColor];
    self.tabBarController.tabBar.unselectedItemTintColor = [UIColor lightGrayColor];
    self.tabBarController.selectedIndex = 2;
    
    self.tabBarController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:self.tabBarController animated:YES completion:nil];
}

#pragma mark - Collectionview delegate and datasource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.imageNamesArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ImageCollectionViewCell *cell = (ImageCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.imageView.image = [UIImage imageNamed:self.imageNamesArray[indexPath.row]];
    
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return collectionView.frame.size;
}

-(void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    for (UICollectionViewCell *cell in [collectionView visibleCells]) {
        NSIndexPath *indexPath = [collectionView indexPathForCell:cell];
        self.pageControl.currentPage = indexPath.row;
    }
}

@end
