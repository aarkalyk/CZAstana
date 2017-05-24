//
//  AboutTableViewCell.m
//  CZAstana
//
//  Created by ARKALYK AKASH on 5/23/17.
//  Copyright © 2017 ARKALYK AKASH. All rights reserved.
//

#import "AboutTableViewCell.h"
#import "UIColor+CZColor.h"
#import "UIFont+CZFont.h"

@implementation AboutTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        CGFloat height = 55.0;
        CGFloat titleHeight = 20;
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, height/2.0-titleHeight, self.contentView.frame.size.width-20, titleHeight)];
        self.titleLabel.font = [UIFont fontLightWithSize:14];
        self.titleLabel.textColor = [UIColor lightGrayColor];
        
        self.infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, height/2.0, self.contentView.frame.size.width-20, titleHeight)];
        self.infoLabel.font = [UIFont fontLightWithSize:16];
        
        self.bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, height-0.7, self.contentView.frame.size.width, 0.7)];
        self.bottomLine.backgroundColor = [UIColor grayColor];
        
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.infoLabel];
        [self.contentView addSubview:self.bottomLine];
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
