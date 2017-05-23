//
//  MenuViewController.m
//  CZAstana
//
//  Created by ARKALYK AKASH on 5/3/17.
//  Copyright © 2017 ARKALYK AKASH. All rights reserved.
//

#import "MenuViewController.h"
#import "MenuView.h"

@interface MenuViewController ()<MenuViewDelegate>

@property (nonatomic) MenuView *menuView;

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUp];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
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
