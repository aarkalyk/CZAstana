//
//  VacanciesTableViewCell.m
//  CZAstana
//
//  Created by ARKALYK AKASH on 5/12/17.
//  Copyright © 2017 ARKALYK AKASH. All rights reserved.
//

#import "VacanciesTableViewCell.h"

@implementation VacanciesTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        CGFloat height = 55.0;
        
        CGFloat starWidth = self.contentView.frame.size.height*0.5;
        self.starImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, height/2.0-starWidth/2.0, starWidth, starWidth)];
        
        CGFloat titleheight = 20.0;
        CGFloat titleWidth = self.contentView.frame.size.width - CGRectGetMaxX(self.starImageView.frame) - 20;
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.starImageView.frame)+10, height/2.0 - titleheight, titleWidth, titleheight)];
        self.titleLabel.textColor = [UIColor lightGrayColor];
        
        self.salaryLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.titleLabel.frame.origin.x, height/2.0, titleWidth/2.0, titleheight)];
        self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.salaryLabel.frame), height/2.0, titleWidth/2.0, titleheight)];
        self.dateLabel.textAlignment = NSTextAlignmentRight;
        self.dateLabel.textColor = [UIColor lightGrayColor];
        
        [self.contentView addSubview:self.starImageView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.salaryLabel];
        [self.contentView addSubview:self.dateLabel];
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
