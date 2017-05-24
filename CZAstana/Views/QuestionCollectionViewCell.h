//
//  QuestionCollectionViewCell.h
//  CZA
//
//  Created by Arkalyk Akash on 6/11/16.
//  Copyright © 2016 Arkalyk Akash. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionCollectionViewCell : UICollectionViewCell

@property (nonatomic) UILabel *questionNumberLabel;
@property (nonatomic) UIImageView *imageView;
@property (nonatomic) UITextView *questionTextView;
@property (nonatomic) UIButton *optionButton1;
@property (nonatomic) UIButton *optionButton2;
@property (nonatomic) UITextView *optionTextView1;
@property (nonatomic) UITextView *optionTextView2;

@property (nonatomic) UITextView *resultsTextView;

@end
