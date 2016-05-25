//
//  DemoCell.m
//  chAutoLayout
//
//  Created by ch on 16/4/26.
//  Copyright © 2016年 ch. All rights reserved.
//

#import "DemoCell.h"
#import "UIView+SDAutoLayout.h"

@implementation DemoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setup];
    }
    return self;
}

- (void)setup{
    UILabel *titleLabe = [UILabel new];
    titleLabe.textColor = [UIColor grayColor];
    titleLabe.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:titleLabe];
    self.titleLabel = titleLabe;
    
    UILabel *contentLabel = [UILabel new];
    contentLabel.textColor = [UIColor lightGrayColor];
    contentLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:contentLabel];
    self.contentLabel = contentLabel;
    
    CGFloat margin = 10;
    self.titleLabel.sd_layout
    .leftSpaceToView(self.contentView,margin)
    .topSpaceToView(self.contentView,margin)
    .rightSpaceToView(self.contentView,margin)
    .heightIs(20);
    
    self.contentLabel.sd_layout
    .leftEqualToView(self.titleLabel)
    .rightEqualToView(self.titleLabel)
    .topSpaceToView(self.titleLabel,margin)
    .autoHeightRatio(0);
    
    [self setupAutoHeightWithBottomView:self.contentLabel bottomMargin:margin];
}

@end
