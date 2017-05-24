//
//  DetailedVacancyViewController.m
//  CZAstana
//
//  Created by ARKALYK AKASH on 5/23/17.
//  Copyright © 2017 ARKALYK AKASH. All rights reserved.
//

#import "DetailedVacancyViewController.h"

@interface DetailedVacancyViewController ()

@property (nonatomic) UILabel *salaryLabel;
@property (nonatomic) UILabel *categoryLabel;
@property (nonatomic) UITextView *textView;
@property (nonatomic) UIView *containerView;
@property (nonatomic) UIButton *closeButton;

@end

@implementation DetailedVacancyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self setup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setup{
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5f];
    
    self.navigationItem.title = self.vacancy.nameKaz;
    
    self.containerView = [[UIView alloc] initWithFrame:CGRectZero];
    self.containerView.backgroundColor = [UIColor whiteColor];
    self.containerView.layer.cornerRadius = 10.0f;
    self.containerView.clipsToBounds = YES;
    
    self.salaryLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, self.view.frame.size.width-30, 30)];
    self.salaryLabel.text = [NSString stringWithFormat:@"Жалақы: %i теңге", self.vacancy.salary];
    [self.containerView addSubview:self.salaryLabel];
    
    self.categoryLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(self.salaryLabel.frame), self.view.frame.size.width-30, 30)];
    self.categoryLabel.text = [NSString stringWithFormat:@"Категория: %@", self.vacancy.category];
    [self.containerView addSubview:self.categoryLabel];
    
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(self.categoryLabel.frame), self.view.frame.size.width-20, self.view.frame.size.height - CGRectGetMaxY(self.categoryLabel.frame))];
    self.textView.text = self.vacancy.descrKaz;
    self.textView.font = self.categoryLabel.font;
    self.textView.scrollEnabled = NO;
    self.textView.editable = NO;
    self.textView.selectable = NO;
    self.textView.backgroundColor = [UIColor clearColor];
    [self.containerView addSubview:self.textView];
    
    self.containerView.frame = CGRectMake(15, 0, self.view.frame.size.width-30, 160);
    self.containerView.center = self.view.center;
    [self.view addSubview:self.containerView];
    
    self.closeButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    self.closeButton.center = CGPointMake(self.view.center.x, CGRectGetMaxY(self.containerView.frame)+20);
    self.closeButton.backgroundColor = [UIColor clearColor];
    [self.closeButton setImage:[UIImage imageNamed:@"cross"] forState:UIControlStateNormal];
    [self.closeButton addTarget:self action:@selector(closeButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.closeButton];
}

-(void)closeButtonPressed{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
