//
//  DemoVC1.m
//  chAutoLayout
//
//  Created by ch on 16/4/26.
//  Copyright © 2016年 ch. All rights reserved.
//

#import "DemoVC1.h"

@implementation DemoVC1
{
    UILabel *_autoWidthLabel;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [self setupAutoHeightView];
    [self setupAutoWidthLabel];
    [self setupAutoHeightLabel];
}

- (void)setupAutoHeightView{
    UILabel *subview1 = [UILabel new];
    subview1.text = @"这个紫色的label会根据这些文字内容高度自适应；而这个灰色的父view会根据紫色的label和橙色的view具体情况实现高度自适应。\nGot it! OH YAEH!";
    subview1.backgroundColor = [UIColor purpleColor];
    
    UIView *subview2 = [UIView new];
    subview2.backgroundColor = [UIColor orangeColor];
    [self.view1 sd_addSubviews:@[subview1,subview2]];
    
    subview1.sd_layout
    .leftSpaceToView(self.view1,10)
    .rightSpaceToView(self.view1,10)
    .topSpaceToView(self.view1,10)
    .autoHeightRatio(0);
    
    subview2.sd_layout
    .topSpaceToView(subview1,10)
    .widthRatioToView(subview1,1)
    .heightIs(30)
    .leftEqualToView(subview1);
    
    self.view1.sd_layout
    .leftSpaceToView(self.view,10)
    .topSpaceToView(self.view,80)
    .rightSpaceToView(self.view,10);
     
     [self.view1 setupAutoHeightWithBottomView:subview2 bottomMargin:10];
}

- (void)setupAutoWidthLabel{
    UILabel *autoWidthlabel = [UILabel new];
    autoWidthlabel.backgroundColor = [[UIColor orangeColor] colorWithAlphaComponent:0.5];
    _autoWidthLabel = autoWidthlabel;
    autoWidthlabel.font = [UIFont systemFontOfSize:12];
    autoWidthlabel.text = @"宽度自适应(距离父view右边距10)";
    [self.view addSubview:autoWidthlabel];
    
    autoWidthlabel.sd_layout
    .rightSpaceToView(self.view,10)
    .heightIs(20)
    .bottomSpaceToView(self.view,50);
    [autoWidthlabel setSingleLineAutoResizeWithMaxWidth:180];
}

- (void)setupAutoHeightLabel{
    UILabel *autoHeightlabel = [UILabel new];
    autoHeightlabel.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.5];
    autoHeightlabel.font = [UIFont systemFontOfSize:12];
    autoHeightlabel.text = @"高度自适应(距离父view左边距10，底部和其右侧label相同，宽度为100)";
    [self.view addSubview:autoHeightlabel];
    autoHeightlabel.sd_layout
    .bottomEqualToView(_autoWidthLabel)
    .leftSpaceToView(self.view,10)
    .widthIs(100)
    .autoHeightRatio(0);
}

@end
