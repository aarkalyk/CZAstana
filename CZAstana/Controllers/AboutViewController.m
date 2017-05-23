//
//  AboutViewController.m
//  CZAstana
//
//  Created by ARKALYK AKASH on 5/23/17.
//  Copyright © 2017 ARKALYK AKASH. All rights reserved.
//

#import "VacanciesCollectionViewCell.h"
#import "DayCollectionViewCell.h"
#import "AboutViewController.h"
#import "AboutTableViewCell.h"
#import "UIColor+CZColor.h"
#import "UIFont+CZFont.h"

@interface AboutViewController ()<UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic) UITableView *tableView;
@property (nonatomic) UICollectionView *collectionView;
@property (nonatomic) NSArray *daysRus;
@property (nonatomic) UILabel *timeLabel;
@property (nonatomic) UILabel *lunchTimeLabel;

@property (nonatomic) NSArray *tableViewTitles;
@property (nonatomic) NSArray *tableViewInfo;

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableViewTitles = @[@"Адрес", @"Телефон", @"Сайт", @"Email"];
    self.tableViewInfo = @[@"Ул. Бейбитшилик, 11", @"+77172771725", @"www.astana.gov.kz/kk/", @"office_akimat@astana.kz"];
    
    self.daysRus = @[@"ПН", @"ВТ", @"СР", @"ЧТ", @"ПТ", @"СБ", @"ВС"];
    
    self.navigationItem.title = @"О нас";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 15, self.view.frame.size.width - 20, 55*4) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[AboutTableViewCell class] forCellReuseIdentifier:@"Cell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    
    UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
    flowLayout.minimumLineSpacing = 5;
    flowLayout.minimumInteritemSpacing = 5;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(self.tableView.frame)+15, self.view.frame.size.width - 20, 50) collectionViewLayout:flowLayout];
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    [self.collectionView registerClass:[DayCollectionViewCell class] forCellWithReuseIdentifier:@"CVCell"];
    [self.view addSubview:self.collectionView];
    
    self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(self.collectionView.frame)+5, self.view.frame.size.width-20, 30)];
    self.timeLabel.font = [UIFont fontLightWithSize:20];
    self.timeLabel.text = @"9:00 - 17:00";
    [self.view addSubview:self.timeLabel];
    
    self.lunchTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(self.timeLabel.frame)+5, self.view.frame.size.width-20, 20)];
    self.lunchTimeLabel.font = [UIFont fontLightWithSize:15];
    self.lunchTimeLabel.text = @"13:00 - 14:00 обед";
    [self.view addSubview:self.lunchTimeLabel];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tableViewTitles.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AboutTableViewCell *cell = (AboutTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.titleLabel.text = self.tableViewTitles[indexPath.row];
    cell.infoLabel.text = self.tableViewInfo[indexPath.row];
    
    if (indexPath.row > 1) {
        cell.infoLabel.textColor = [UIColor customDarkGreenColor];
    }else{
        cell.infoLabel.textColor = [UIColor blackColor];
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55;
}

#pragma mark - CollectionView delegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.daysRus.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DayCollectionViewCell *cell = (DayCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"CVCell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor whiteColor];
    cell.titleLabel.text = self.daysRus[indexPath.row];
    
    if (indexPath.row > 4) {
        cell.backgroundColor = [UIColor orangeColor];
        cell.titleLabel.textColor = [UIColor whiteColor];
        cell.layer.borderColor = [UIColor clearColor].CGColor;
    }else if(indexPath.row == 0){
        cell.backgroundColor = [UIColor mainGreenColor];
        cell.titleLabel.textColor = [UIColor whiteColor];
    }else{
        cell.backgroundColor = [UIColor whiteColor];
        cell.layer.borderWidth = 1.0f;
        cell.layer.borderColor = [UIColor mainGreenColor].CGColor;
        cell.titleLabel.textColor = [UIColor blackColor];
    }
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row > 4) {
        self.timeLabel.text = @"Закрыто";
        self.lunchTimeLabel.text = @"";
    }else{
        self.timeLabel.text = @"9:00 - 17:00";
        self.lunchTimeLabel.text = @"13:00 - 14:00 обед";
    }
    
    for (DayCollectionViewCell *cell in [collectionView visibleCells]) {
        if ([collectionView indexPathForCell:cell].row > 4) {
            cell.backgroundColor = [UIColor orangeColor];
            cell.titleLabel.textColor = [UIColor whiteColor];
            cell.layer.borderColor = [UIColor clearColor].CGColor;
        }else{
            cell.backgroundColor = [UIColor whiteColor];
            cell.layer.borderWidth = 1.0f;
            cell.layer.borderColor = [UIColor mainGreenColor].CGColor;
            cell.titleLabel.textColor = [UIColor blackColor];
        }
    }
    
    DayCollectionViewCell *cell = (DayCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor mainGreenColor];
    cell.titleLabel.textColor = [UIColor whiteColor];
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((collectionView.frame.size.width-30)/7.0, (collectionView.frame.size.width-30)/7.0);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);
    //UIEdgeInsetsMake(<#CGFloat top#>, <#CGFloat left#>, <#CGFloat bottom#>, <#CGFloat right#>)
}

@end
