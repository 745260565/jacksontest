//
//  DemoVC3.m
//  chAutoLayout
//
//  Created by ch on 16/4/26.
//  Copyright © 2016年 ch. All rights reserved.
//

#import "DemoVC3.h"
#import "TestCell2.h"
#import "SDRefresh.h"

#import "UITableView+SDAutoTableViewCellHeight.h"

@implementation DemoVC3
{
    NSArray *_textArray;
    SDRefreshFooterView *_refreshFooter;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    _rowCount = (long)10;
    
    NSArray *textArray = @[@"当你的 app 没有提供 3x 的 LaunchImage 时，系统默认进入兼容模式，大屏幕一切按照 320 宽度渲染，屏幕宽度返回 320；然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。",
                           @"然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。",
                           @"当你的 app 没有提供 3x 的 LaunchImage 时",
                           @"但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少，容易遭到用户投诉。",
                           @"屏幕宽度返回 320；然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。但是建议不要长期处于这种模式下，"
                           ];
    _textArray = textArray;
    

}
@end
