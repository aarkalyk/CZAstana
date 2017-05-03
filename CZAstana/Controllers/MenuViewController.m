//
//  MenuViewController.m
//  CZAstana
//
//  Created by ARKALYK AKASH on 5/3/17.
//  Copyright © 2017 ARKALYK AKASH. All rights reserved.
//

#import "MenuViewController.h"
#import "MenuView.h"

@interface MenuViewController ()

@property (nonatomic) MenuView *menuView;

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUp];
}

-(void)setUp{
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.menuView = [[MenuView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.menuView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
