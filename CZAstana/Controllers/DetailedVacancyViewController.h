//
//  DetailedVacancyViewController.h
//  CZAstana
//
//  Created by ARKALYK AKASH on 5/23/17.
//  Copyright © 2017 ARKALYK AKASH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Internship.h"
#import "Vacancy.h"

@interface DetailedVacancyViewController : UIViewController

@property (nonatomic) Vacancy *vacancy;
@property (nonatomic) Internship *internship;

@end
