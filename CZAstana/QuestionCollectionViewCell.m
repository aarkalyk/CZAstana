//
//  QuestionCollectionViewCell.m
//  CZA
//
//  Created by Arkalyk Akash on 6/11/16.
//  Copyright © 2016 Arkalyk Akash. All rights reserved.
//

#import "QuestionCollectionViewCell.h"
#import "UIColor+CZColor.h"

@implementation QuestionCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        int distFromTop = 60;
        int distFromLabelToImage = 20;
        int lineSpace = self.contentView.frame.size.width*0.05;
        int optionButtonWidth = (self.contentView.frame.size.width*(0.75))/2;
        int optionButtonHeight = 40;
        UIColor *buttonTitleColor = [UIColor customBlue7];
        int buttonTitleSize = 17;
        
        if (self.contentView.frame.size.height == 480) {
            distFromTop = 20;
            distFromLabelToImage = 10;
            lineSpace = self.contentView.frame.size.width*0.05;
            optionButtonWidth = (self.contentView.frame.size.width*(1.0-0.05*3))/2;
            optionButtonHeight = 30;
            buttonTitleSize = 15;
        }
        
        self.questionNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, distFromTop, self.contentView.frame.size.width, 70)];
        self.questionNumberLabel.textColor = [UIColor whiteColor];
        self.questionNumberLabel.textAlignment = NSTextAlignmentCenter;
        self.questionNumberLabel.text = @"1 Сұрақ";
        self.questionNumberLabel.font = [UIFont fontWithName:@"Helvetica" size:18];
        [self.contentView addSubview:self.questionNumberLabel];
        
        
        self.questionTextView = [[UITextView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.questionNumberLabel.frame)+distFromLabelToImage, self.contentView.frame.size.width, 20)];
        self.questionTextView.textColor = [UIColor whiteColor];
        self.questionTextView.text  = @"Do you like coding?!";
        self.questionTextView.font = [UIFont fontWithName:@"Helvetica" size:18];
        self.questionTextView.editable = NO;
        self.questionTextView.textAlignment = NSTextAlignmentCenter;
        self.questionTextView.backgroundColor = [UIColor clearColor];
        [self.questionTextView sizeToFit];
        self.questionTextView.frame = CGRectMake(0, CGRectGetMaxY(self.questionNumberLabel.frame)+distFromLabelToImage, self.contentView.frame.size.width, self.questionTextView.frame.size.height);
        [self.contentView addSubview:self.questionTextView];
        
        [self.optionTextView1 addObserver:self forKeyPath:@"contentSize" options:(NSKeyValueObservingOptionNew) context:NULL];
        self.optionTextView1 = [[UITextView alloc] initWithFrame:CGRectMake(lineSpace, CGRectGetMaxY(self.questionTextView.frame)+20, self.contentView.frame.size.width-lineSpace*2, 50)];
        self.optionTextView1.text = @"Заряжаюсь энергией при общении с другими людьми (люблю бывать в компаниях) ";
        self.optionTextView1.font = [UIFont fontWithName:@"Helvetica-Light" size:18];
        [self.optionTextView1 sizeToFit];
        self.optionTextView1.frame = CGRectMake(lineSpace, CGRectGetMaxY(self.questionTextView.frame)+20, self.contentView.frame.size.width-lineSpace*2, self.optionTextView1.frame.size.height);
        self.optionTextView1.textAlignment = NSTextAlignmentCenter;
        self.optionTextView1.editable = NO;
        self.optionTextView1.selectable = NO;
        self.optionTextView1.layer.cornerRadius = 10;
        self.optionTextView1.textColor = [UIColor customBlueTextColor];
        [self.contentView addSubview:self.optionTextView1];
        
        self.optionButton1 = [[UIButton alloc] initWithFrame:CGRectMake(lineSpace, CGRectGetMaxY(self.questionTextView.frame), optionButtonWidth, optionButtonHeight*3)];
        self.optionButton1.backgroundColor = [UIColor whiteColor];
        self.optionButton1.tag = 1;
        self.optionButton1.backgroundColor = [UIColor clearColor];
        [self.optionButton1 setTitleColor:buttonTitleColor forState:UIControlStateNormal];
        [self.contentView addSubview:self.optionButton1];
        
        [self.optionTextView2 addObserver:self forKeyPath:@"contentSize" options:(NSKeyValueObservingOptionNew) context:NULL];
        self.optionTextView2 = [[UITextView alloc] initWithFrame:CGRectMake(lineSpace, CGRectGetMaxY(self.optionTextView1.frame)+20, self.contentView.frame.size.width-lineSpace*2, 50)];
        self.optionTextView2.text = @"Заряжаюсь энергией в спокойной обстановке (люблю круг близких друзей)";
        self.optionTextView2.font = [UIFont fontWithName:@"Helvetica-Light" size:18];
        [self.optionTextView2 sizeToFit];
        self.optionTextView2.frame = CGRectMake(lineSpace, CGRectGetMaxY(self.optionTextView1.frame)+20, self.contentView.frame.size.width-lineSpace*2, self.optionTextView2.frame.size.height);
        self.optionTextView2.textAlignment = NSTextAlignmentCenter;
        self.optionTextView2.layer.cornerRadius = 10;
        self.optionTextView2.editable = NO;
        self.optionTextView2.selectable = NO;
        self.optionTextView2.textColor = [UIColor customBlueTextColor];
        [self.contentView addSubview:self.optionTextView2];
        
        self.optionButton2 = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.optionButton1.frame)+lineSpace, CGRectGetMaxY(self.questionTextView.frame), optionButtonWidth, optionButtonHeight)];
        self.optionButton2.backgroundColor = [UIColor clearColor];
        self.optionButton2.tag = 2;
        [self.optionButton2 setTitleColor:buttonTitleColor forState:UIControlStateNormal];
        [self.contentView addSubview:self.optionButton2];
        
        self.resultsTextView = [[UITextView alloc] initWithFrame:CGRectMake(15, CGRectGetMidY(self.questionNumberLabel.frame)-30, self.contentView.frame.size.width-30, self.contentView.frame.size.height-CGRectGetMaxY(self.questionNumberLabel.frame))];
        self.resultsTextView.backgroundColor = [UIColor clearColor];
        self.resultsTextView.textColor = [UIColor whiteColor];
        self.resultsTextView.font = [UIFont fontWithName:@"Helvetica-Light" size:19];
        self.resultsTextView.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:self.resultsTextView];
    }
    
    return self;
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    UITextView *tv = object;
    CGFloat topCorrect = ([tv bounds].size.height - [tv contentSize].height * [tv zoomScale])/2.0;
    topCorrect = ( topCorrect < 0.0 ? 0.0 : topCorrect );
    tv.contentOffset = (CGPoint){.x = 0, .y = -topCorrect};
}

@end
