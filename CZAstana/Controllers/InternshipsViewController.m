//
//  InternshipsViewController.m
//  CZAstana
//
//  Created by ARKALYK AKASH on 5/22/17.
//  Copyright © 2017 ARKALYK AKASH. All rights reserved.
//

#import "DetailedVacancyViewController.h"
#import "VacanciesCollectionViewCell.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import "InternshipsViewController.h"
#import "VacanciesViewController.h"
#import "UIImageView+CZImageView.h"
#import "VacanciesTableViewCell.h"
#import "UIColor+CZColor.h"
#import "Internship.h"
#import "SearchView.h"

@interface InternshipsViewController ()<UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic) UICollectionView *collectionView;
@property (nonatomic) UITableView *tableView;
@property (nonatomic) SearchView *searchView;
@property (nonatomic) NSMutableArray *categoryIconNames;
@property (nonatomic) NSMutableArray *internships;

@end

@implementation InternshipsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:@"BarsShouldHide"
                                                      object:nil
                                                       queue:nil
                                                  usingBlock:^(NSNotification *note) {
                                                      [self.navigationController setNavigationBarHidden:YES animated:YES];
                                                      [self setTabBarVisible:NO animated:YES completion:nil];
                                                  }];
    [[NSNotificationCenter defaultCenter] addObserverForName:@"BarsShouldUnhide"
                                                      object:nil
                                                       queue:nil
                                                  usingBlock:^(NSNotification *note) {
                                                      [self.navigationController setNavigationBarHidden:NO animated:YES];
                                                      [self setTabBarVisible:YES animated:YES completion:nil];
                                                  }];
    
    [self setup];
    [SVProgressHUD show];
    [Internship getAllInternshipsWithClosure:^(NSMutableArray *internships) {
        self.internships = internships;
        [self.tableView reloadData];
        [SVProgressHUD dismiss];
    }];
}

-(void)viewWillDisappear:(BOOL)animated{
    [SVProgressHUD dismiss];
}

-(void)setup{
    self.navigationItem.title = @"Вакансии";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.categoryIconNames = [[NSMutableArray alloc] initWithObjects:@"bus", @"doctor", @"engineer", @"law", @"theater", @"bus", @"doctor", @"engineer", @"law", @"theater", nil];
    
    self.searchView = [[SearchView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    self.searchView.searchBar.frame = self.searchView.frame;
    [self.view addSubview:self.searchView];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.searchView.frame), self.view.frame.size.width, self.view.frame.size.height - CGRectGetMaxY(self.searchView.frame)) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[VacanciesTableViewCell class] forCellReuseIdentifier:@"Cell"];
    [self.view addSubview:self.tableView];
    
}

#pragma mark - CollectionView delegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.categoryIconNames.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    VacanciesCollectionViewCell *cell = (VacanciesCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"CVCell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor clearColor];
    cell.imageView.image = [UIImage imageNamed:self.categoryIconNames[indexPath.row]];
    [UIImageView setColor:[UIColor mainGreenColor] toImageView:cell.imageView];
    
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(collectionView.frame.size.height*0.8, collectionView.frame.size.height*0.8);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);
    //UIEdgeInsetsMake(<#CGFloat top#>, <#CGFloat left#>, <#CGFloat bottom#>, <#CGFloat right#>)
}

#pragma mark - TableView delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.internships.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    VacanciesTableViewCell *cell = (VacanciesTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    Internship *internship = self.internships[indexPath.row];
    cell.titleLabel.text = internship.nameKaz;
    NSLog(@"\n name: %@ \n", internship.nameKaz);
    cell.dateLabel.text = internship.createdAt;
    //cell.salaryLabel.text = internship.nameRus;
    cell.starImageView.image = [UIImage imageNamed:@"star_gray"];
    cell.salaryLabel.hidden = YES;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailedVacancyViewController *VC = [[DetailedVacancyViewController alloc] init];
    VC.internship = self.internships[indexPath.row];
    VC.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [self presentViewController:VC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ScrollView delegate
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"BarsShouldHide" object:self];
    
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView
                 willDecelerate:(BOOL)decelerate
{
    if(!decelerate)
        [[NSNotificationCenter defaultCenter] postNotificationName:@"BarsShouldUnhide"
                                                            object:self];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"BarsShouldUnhide"
                                                        object:self];
}

#pragma mark - Tabbar animations
// pass a param to describe the state change, an animated flag and a completion block matching UIView animations completion
- (void)setTabBarVisible:(BOOL)visible animated:(BOOL)animated completion:(void (^)(BOOL))completion {
    
    // bail if the current state matches the desired state
    if ([self tabBarIsVisible] == visible) return (completion)? completion(YES) : nil;
    
    // get a frame calculation ready
    CGRect frame = self.tabBarController.tabBar.frame;
    CGFloat height = frame.size.height;
    CGFloat offsetY = (visible)? -height : height;
    
    // zero duration means no animation
    CGFloat duration = (animated)? 0.3 : 0.0;
    
    [UIView animateWithDuration:duration animations:^{
        self.tabBarController.tabBar.frame = CGRectOffset(frame, 0, offsetY);
    } completion:completion];
}

//Getter to know the current state
- (BOOL)tabBarIsVisible {
    return self.tabBarController.tabBar.frame.origin.y < CGRectGetMaxY(self.view.frame);
}

//An illustration of a call to toggle current state
- (IBAction)pressedButton:(id)sender {
    [self setTabBarVisible:![self tabBarIsVisible] animated:YES completion:^(BOOL finished) {
        NSLog(@"finished");
    }];
}

@end

