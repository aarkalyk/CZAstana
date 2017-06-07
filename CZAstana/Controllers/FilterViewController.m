//
//  FilterViewController.m
//  CZAstana
//
//  Created by ARKALYK AKASH on 6/6/17.
//  Copyright © 2017 ARKALYK AKASH. All rights reserved.
//

#import "FilterViewController.h"

@interface FilterViewController ()

@property (nonatomic) UILabel *categoryLabel;

@end

@implementation FilterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.categoryLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, self.view.frame.size.width-30, 30)];
    [self.view addSubview:self.categoryLabel];
    
    
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
