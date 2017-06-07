//
//  MenuViewController.m
//  CZAstana
//
//  Created by ARKALYK AKASH on 5/3/17.
//  Copyright © 2017 ARKALYK AKASH. All rights reserved.
//

#import "MenuViewController.h"
#import "UIColor+CZColor.h"
#import "UIFont+CZFont.h"
#import <Parse/Parse.h>
#import "MenuView.h"

@interface MenuViewController ()<MenuViewDelegate>

@property (nonatomic) MenuView *menuView;

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor ultraLightGray];
    
    UIView *navBarTitleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    //UIImageView *logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, navBarTitleView.frame.size.height*0.9, navBarTitleView.frame.size.height*0.9)];
    //logoImageView.center = navBarTitleView.center;
    //logoImageView.image = [UIImage imageNamed:@"logo"];
    //[navBarTitleView addSubview:logoImageView];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:navBarTitleView.bounds];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont fontBoldWithSize:23];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.text = @"CZ Astana";
    titleLabel.backgroundColor = [UIColor clearColor];
    [navBarTitleView addSubview:titleLabel];
    
    self.navigationItem.titleView = navBarTitleView;
    
    [self getDataFromParse];
    
    [self setUp];
}

-(void)getDataFromParse{
    PFQuery *query = [PFQuery queryWithClassName:@"Vacancy"];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if (!error) {
            for (PFObject *object in objects) {
                NSLog(@"\n %@ \n", object[@"nameKaz"]);
            }
        }
    }];
}

-(void)setUp{
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.menuView = [[MenuView alloc] initWithFrame:self.view.frame];
    self.menuView.delegate = self;
    [self.view addSubview:self.menuView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - MenuView delegate
-(void)pushVC:(UIViewController *)VC{
    [self.navigationController pushViewController:VC animated:YES];
}

@end
