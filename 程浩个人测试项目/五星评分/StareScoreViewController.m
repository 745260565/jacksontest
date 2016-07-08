//
//  StareScoreViewController.m
//  程浩个人测试项目
//
//  Created by ch on 16/7/7.
//  Copyright © 2016年 id. All rights reserved.
//

#import "StareScoreViewController.h"
#import "CHScoreStar.h"
@interface StareScoreViewController ()
@property (nonatomic,strong)NSMutableArray<CHScoreStar*>*starArr;
@property (nonatomic,strong)NSMutableArray<UILabel*>*scoreArr;
@end

@implementation StareScoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = WhiteColor;
    self.starArr = [NSMutableArray arrayWithCapacity:5];
    self.scoreArr = [NSMutableArray arrayWithCapacity:5];
    CGFloat y = 80;
    for (int i = 0; i<5; i++) {
        CHScoreStar *star = [[CHScoreStar alloc] initWithFrame:CGRectMake(10, i*y+50+64, 50*(i+1), 50)];
        star.starBGColor = [UIColor colorWithWhite:0.85 alpha:1];
        star.starColor = OrangeColor;
        star.score = 1;
        [self.view addSubview:star];
        [self.starArr addObject:star];
        UILabel *score = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(star.frame)+10, i*y+65+64, 80, 20)];
        score.text = [NSString stringWithFormat:@"%.2f",star.score];
        score.textColor = BlackColor;
        [self.view addSubview:score];
        [self.scoreArr addObject:score];
    }
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    for (int i = 0; i<5; i++) {
        CHScoreStar *star = self.starArr[i];
        UILabel *scoreLB = self.scoreArr[i];
        u_int32_t max = star.frame.size.width/star.frame.size.height*200;
        CGFloat score = arc4random_uniform(max)*0.01;
        star.score = score;
        scoreLB.text = [NSString stringWithFormat:@"%.2f",score];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
