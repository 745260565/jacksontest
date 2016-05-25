//
//  DemoVC0.m
//  chAutoLayout
//
//  Created by ch on 16/4/26.
//  Copyright © 2016年 ch. All rights reserved.
//

#import "DemoVC0.h"

#define kTimeInterval 0.8

@implementation DemoVC0
{
    NSTimer *_timer;
    CGFloat _widthRatio;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    _widthRatio = 0.4;
    _timer = [NSTimer scheduledTimerWithTimeInterval:kTimeInterval target:self selector:@selector(animation) userInfo:nil repeats:YES];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.view0.sd_layout
    .leftSpaceToView(self.view,20)
    .topSpaceToView(self.view,80)
    .heightIs(130)
    .widthRatioToView(self.view,_widthRatio);
    
    self.view1.sd_layout
    .leftSpaceToView(self.view0,10)
    .topEqualToView(self.view0)
    .heightIs(60)
    .widthRatioToView(self.view0,0.5);
    
    self.view2.sd_layout
    .leftSpaceToView(self.view1,10)
    .topEqualToView(self.view0)
    .heightIs(60)
    .widthRatioToView(self.view0,0.5);
    
    self.view3.sd_layout
    .leftEqualToView(self.view1)
    .topSpaceToView(self.view1,10)
    .widthRatioToView(self.view1,1)
    .heightRatioToView(self.view1,1);
    
    self.view4.sd_layout
    .leftEqualToView(self.view2)
    .topEqualToView(self.view3)
    .heightRatioToView(self.view3,1)
    .widthRatioToView(self.view2,1);
    
    [self.view0 addSubview:self.view5];
    self.view5.sd_layout
    .centerYEqualToView(self.view0)
    .rightSpaceToView(self.view0,10)
    .widthRatioToView(self.view0,0.5)
    .heightIs(20);
}

- (void)animation{
    if(_widthRatio == 0.4){
        _widthRatio = 0.1;
    }else{
        _widthRatio = 0.4;
    }
    [UIView animateWithDuration:kTimeInterval animations:^{
        self.view0.sd_layout.widthRatioToView(self.view,_widthRatio);
        [self.view0 updateLayout];
        [self.view5 updateLayout];
    }];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [_timer invalidate];
    _timer = nil;
}



@end
