//
//  VacanciesViewController.m
//  CZAstana
//
//  Created by ARKALYK AKASH on 5/11/17.
//  Copyright © 2017 ARKALYK AKASH. All rights reserved.
//

#import "VacanciesCollectionViewCell.h"
#import "VacanciesViewController.h"
#import "UIImageView+CZImageView.h"
#import "VacanciesTableViewCell.h"
#import "UIColor+CZColor.h"
#import "SearchView.h"

@interface VacanciesViewController ()<UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic) UICollectionView *collectionView;
@property (nonatomic) UITableView *tableView;
@property (nonatomic) SearchView *searchView;
@property (nonatomic) NSMutableArray *categoryIconNames;

@end

@implementation VacanciesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

-(void)setup{
    self.navigationItem.title = @"Вакансии";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.categoryIconNames = [[NSMutableArray alloc] initWithObjects:@"bus", @"doctor", @"engineer", @"law", @"theater", @"bus", @"doctor", @"engineer", @"law", @"theater", nil];
    
    self.searchView = [[SearchView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    [self.view addSubview:self.searchView];
    
    UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
    flowLayout.minimumLineSpacing = 5;
    flowLayout.minimumInteritemSpacing = 5;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.searchView.frame), self.view.frame.size.width, 50) collectionViewLayout:flowLayout];
    self.collectionView.backgroundColor = [UIColor customLightGrayColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    [self.collectionView registerClass:[VacanciesCollectionViewCell class] forCellWithReuseIdentifier:@"CVCell"];
    [self.view addSubview:self.collectionView];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.collectionView.frame), self.view.frame.size.width, self.view.frame.size.height - CGRectGetMaxY(self.collectionView.frame) - 94) style:UITableViewStylePlain];
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
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    VacanciesTableViewCell *cell = (VacanciesTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.titleLabel.text = @"iOS developer";
    cell.dateLabel.text = @"May 4th";
    cell.salaryLabel.text = @"3000$";
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
