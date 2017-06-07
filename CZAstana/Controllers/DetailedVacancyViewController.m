//
//  DetailedVacancyViewController.m
//  CZAstana
//
//  Created by ARKALYK AKASH on 5/23/17.
//  Copyright © 2017 ARKALYK AKASH. All rights reserved.
//

#import "DetailedVacancyViewController.h"
#import "UIColor+CZColor.h"
#import "UIFont+CZFont.h"
#import "HelperMethods.h"

@interface DetailedVacancyViewController ()

@property (nonatomic) UILabel *salaryLabel;
@property (nonatomic) UILabel *categoryLabel;
@property (nonatomic) UILabel *descrLabel;
@property (nonatomic) UITextView *descrTextView;
@property (nonatomic) UITextView *textView;
@property (nonatomic) UIView *containerView;
@property (nonatomic) UIButton *closeButton;
@property (nonatomic) UILabel *numberLabel;
@property (nonatomic) UILabel *vacancyNumberLabel;
@property (nonatomic) UIButton *callButton;

@end

@implementation DetailedVacancyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    UIBarButtonItem *shareButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"share"] style:UIBarButtonItemStylePlain target:self action:@selector(shareButtonPressed)];
    [self.navigationItem setRightBarButtonItem:shareButton];
    
    [self setup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)shareButtonPressed{
    NSString *text = self.vacancy.descrRus;
    NSString *url = @"http://bit.ly/getCZAstana";
    NSArray *items = @[text, @"Для прохождения  собеседование , обратитесь за направлениям  в  « Центр занятости населения »  акимата города Астаны по номеру 87754289927", @"---",@"Больше вакансий можете найти в приложении CZAstana", url];
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:items applicationActivities:nil];
    activityVC.excludedActivityTypes = @[UIActivityTypeAirDrop];
    [self presentViewController:activityVC animated:YES completion:nil];
}

-(void)setup{
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5f];
    
    self.navigationItem.title = self.vacancy.nameRus;
    
    self.containerView = [[UIView alloc] initWithFrame:self.view.bounds];
    self.containerView.backgroundColor = [UIColor whiteColor];
    self.containerView.clipsToBounds = YES;
    [self.view addSubview:self.containerView];
    
    self.numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, self.view.frame.size.width-30, 30)];
    self.numberLabel.text = @"Номер вакансии: ";
    self.numberLabel.font = [UIFont fontBoldWithSize:16];
    [self.numberLabel sizeToFit];
    [self.view addSubview:self.numberLabel];
    
    self.vacancyNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.numberLabel.frame), 15, self.view.frame.size.width-30, 30)];
    self.vacancyNumberLabel.center = CGPointMake(self.vacancyNumberLabel.center.x, self.numberLabel.center.y);
    self.vacancyNumberLabel.text = [NSString stringWithFormat:@"%i", self.vacancy.salary];
    self.vacancyNumberLabel.font = [UIFont fontLightWithSize:16];
    [self.containerView addSubview:self.vacancyNumberLabel];
    
    self.salaryLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(self.vacancyNumberLabel.frame), self.view.frame.size.width-30, 30)];
    self.salaryLabel.text = @"Категория: ";
    self.salaryLabel.font = [UIFont fontBoldWithSize:16];
    [self.salaryLabel sizeToFit];
    [self.view addSubview:self.salaryLabel];
    
    self.categoryLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.salaryLabel.frame), 15, self.view.frame.size.width-30, 30)];
    self.categoryLabel.center = CGPointMake(self.categoryLabel.center.x, self.salaryLabel.center.y);
    self.categoryLabel.text = [NSString stringWithFormat:@"%@", self.vacancy.category];
    self.categoryLabel.font = [UIFont fontLightWithSize:16];
    [self.view addSubview:self.categoryLabel];
    
    self.descrLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(self.categoryLabel.frame), self.view.frame.size.width - 30, 20)];
    self.descrLabel.text = @"Описание:";
    self.descrLabel.font = [UIFont fontBoldWithSize:16];
    [self.descrLabel sizeToFit];
    [self.view addSubview:self.descrLabel];
    
    self.descrTextView = [[UITextView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(self.descrLabel.frame)-5, self.view.frame.size.width-20, self.view.frame.size.height - CGRectGetMaxY(self.categoryLabel.frame))];
    self.descrTextView.text = [NSString stringWithFormat:@"%@", self.vacancy.descrRus];
    self.descrTextView.font = self.categoryLabel.font;
    self.descrTextView.scrollEnabled = NO;
    self.descrTextView.editable = NO;
    self.descrTextView.selectable = NO;
    self.descrTextView.backgroundColor = [UIColor clearColor];
    self.descrTextView.font = [UIFont fontLightWithSize:16];
    [self.view addSubview:self.descrTextView];
    [HelperMethods textViewDidChange:self.descrTextView];
    
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(self.descrTextView.frame)+5, self.view.frame.size.width-20, self.view.frame.size.height - CGRectGetMaxY(self.categoryLabel.frame))];
    self.textView.text = @"Для прохождения  собеседование , обратитесь за направлениям  в  « Центр занятости населения »  акимата города Астаны";
    self.textView.font = self.categoryLabel.font;
    self.textView.scrollEnabled = NO;
    self.textView.editable = NO;
    self.textView.selectable = NO;
    self.textView.backgroundColor = [UIColor clearColor];
    self.textView.font = [UIFont fontLightWithSize:16];
    self.textView.textContainerInset = UIEdgeInsetsMake(10, 10, 10, 10);
    self.textView.layer.borderColor = [UIColor secondaryColor].CGColor;
    self.textView.layer.borderWidth = 1.0f;
    self.textView.layer.cornerRadius = 10.0f;
    self.textView.clipsToBounds = true;
    [self.view addSubview:self.textView];
    [HelperMethods textViewDidChange:self.textView];
    
    self.closeButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    self.closeButton.center = CGPointMake(self.view.center.x, CGRectGetMaxY(self.containerView.frame)+20);
    self.closeButton.backgroundColor = [UIColor clearColor];
    [self.closeButton setImage:[UIImage imageNamed:@"cross"] forState:UIControlStateNormal];
    [self.closeButton addTarget:self action:@selector(closeButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.closeButton];
    
    self.callButton = [[UIButton alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.textView.frame)+10, self.view.frame.size.width*0.7, 44)];
    self.callButton.center = CGPointMake(self.view.center.x, self.callButton.center.y);
    self.callButton.layer.cornerRadius = 10.0f;
    self.callButton.clipsToBounds = YES;
    self.callButton.backgroundColor = [UIColor customGoldColor];
    [self.callButton setTitle:@"Позвонить" forState:UIControlStateNormal];
    [self.callButton addTarget:self action:@selector(callButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.callButton];
    
    if (self.internship != nil) {
        self.salaryLabel.hidden = YES;
        self.categoryLabel.text = [NSString stringWithFormat:@"Категория: %@", self.internship.category];
        self.categoryLabel.center = self.salaryLabel.center;
        self.textView.text = self.internship.descrKaz;
        self.textView.center = self.containerView.center;
    }
}

-(void)closeButtonPressed{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)callButtonPressed{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:87754289927"]];
}


@end
