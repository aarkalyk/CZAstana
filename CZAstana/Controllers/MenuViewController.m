//
//  MenuViewController.m
//  CZAstana
//
//  Created by ARKALYK AKASH on 5/3/17.
//  Copyright © 2017 ARKALYK AKASH. All rights reserved.
//

#import "MenuViewController.h"
#import <Parse/Parse.h>
#import "MenuView.h"

@interface MenuViewController ()<MenuViewDelegate>

@property (nonatomic) MenuView *menuView;

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Меню";
    
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
