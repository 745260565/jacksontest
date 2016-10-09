//
//  MusicTestViewController.m
//  程浩个人测试项目
//
//  Created by ch on 16/8/8.
//  Copyright © 2016年 id. All rights reserved.
//

#import "MusicTestViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface MusicTestViewController ()
@property (nonatomic,strong)AVAudioPlayer *audioplayer;
@end

@implementation MusicTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = WhiteColor;
    
    UIButton *play = [[UIButton alloc] initWithFrame:CGRectMake(10, 94, 50, 30)];
    [play setTitleColor:BlackColor forState:UIControlStateNormal];
    [play setBackgroundColor:ClearColor];
    [play setTitle:@"play" forState:UIControlStateNormal];
    [play addTarget:self action:@selector(play) forControlEvents:UIControlEventTouchUpInside];
    play.layer.cornerRadius = 3;
    play.layer.borderWidth = 2;//这个可以把masksToBounds改成NO
    play.layer.borderColor = BlackColor.CGColor;
    play.layer.masksToBounds = YES;
    [self.view addSubview:play];
    
    UIButton *pause = [[UIButton alloc] initWithFrame:CGRectMake(70, 94, 50, 30)];
    [pause setTitle:@"pause" forState:UIControlStateNormal];
    [pause setBackgroundColor:ClearColor];
    [pause setTitleColor:BlackColor forState:UIControlStateNormal];
    [pause addTarget:self action:@selector(pause) forControlEvents:UIControlEventTouchUpInside];
    pause.layer.cornerRadius = 3;
    pause.layer.borderWidth = 2;//这个可以把masksToBounds改成NO
    pause.layer.borderColor = BlackColor.CGColor;
    pause.layer.masksToBounds = YES;
    [self.view addSubview:pause];
    
    UIButton *stop = [[UIButton alloc] initWithFrame:CGRectMake(130, 94, 50, 30)];
    [stop setTitleColor:BlackColor forState:UIControlStateNormal];
    [stop setBackgroundColor:ClearColor];
    [stop setTitle:@"stop" forState:UIControlStateNormal];
    [stop addTarget:self action:@selector(stop) forControlEvents:UIControlEventTouchUpInside];
    stop.layer.cornerRadius = 3;
    stop.layer.borderWidth = 2;//这个可以把masksToBounds改成NO
    stop.layer.borderColor = BlackColor.CGColor;
    stop.layer.masksToBounds = YES;
    [self.view addSubview:stop];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}

- (void)play{
    [self.audioplayer play];
}

- (void)pause{
    [self.audioplayer pause];
}

- (void)stop{
    [self.audioplayer stop];
}

- (AVAudioPlayer *)audioplayer{
    if (!_audioplayer) {
        //1.音频文件的url路径
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"丽江小倩 - 一瞬间" withExtension:@"mp3"];
        //2.创建播放器（注意：一个AVAudioPlayer只能播放一个url）
        self.audioplayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        //3.缓冲
        [self.audioplayer prepareToPlay];
    }
    return _audioplayer;
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
