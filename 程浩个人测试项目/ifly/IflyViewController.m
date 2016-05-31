//
//  IflyViewController.m
//  程浩个人测试项目
//
//  Created by ch on 16/5/30.
//  Copyright © 2016年 id. All rights reserved.
//

#import "IflyViewController.h"
//#import <iflyMSC/IFlySpeechConstant.h>
//#import <iflyMSC/IFlySpeechSynthesizer.h>
//#import <iflyMSC/IFlySpeechSynthesizerDelegate.h>

@interface IflyViewController ()<IFlySpeechSynthesizerDelegate>
{
    UITextView *mainTextField;
    UIButton *speakButton;
    UIImageView *speackImageView;
    IFlySpeechSynthesizer *iFlySpeechSynthesizer;
}
@end

@implementation IflyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildUI];
    self.view.backgroundColor = [UIColor whiteColor];
    iFlySpeechSynthesizer = [IFlySpeechSynthesizer sharedInstance];
    iFlySpeechSynthesizer.delegate = self;
    [iFlySpeechSynthesizer setParameter:[IFlySpeechConstant TYPE_AUTO] forKey:[IFlySpeechConstant ENGINE_TYPE]];
    [iFlySpeechSynthesizer setParameter:@"50" forKey:[IFlySpeechConstant VOLUME]];
    // Do any additional setup after loading the view.
}

- (void)buildUI{
    mainTextField = [UITextView new];
    mainTextField.backgroundColor = UIColorFromRGB(0x9b9b9b);
    [self.view addSubview:mainTextField];
    [mainTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(80);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(40);
    }];
    
    speakButton = [UIButton new];
    [speakButton setImage:[UIImage imageNamed:@"speak"] forState:UIControlStateNormal];
    [speakButton addTarget:self action:@selector(speak) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:speakButton];
    [speakButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(mainTextField.mas_right).offset(10);
        make.width.mas_equalTo(34);
        make.height.mas_equalTo(46);
        make.centerY.mas_equalTo(mainTextField.mas_centerY);
    }];
}

- (void)speak{
    [iFlySpeechSynthesizer setParameter:[NSString stringWithFormat:@"%@.pcm",[mainTextField.text substringToIndex:2]] forKey:[IFlySpeechConstant TTS_AUDIO_PATH]];
    [iFlySpeechSynthesizer startSpeaking:mainTextField.text];
}

/**
 *  结束回调
 *  当整个合成结束之后会回调此函数
 *
 *  @param error 错误码
 */
- (void) onCompleted:(IFlySpeechError*) error{
    
}

/**
 *  开始合成回调
 */
- (void) onSpeakBegin{
    
}

/**
 *  缓冲进度回调
 *
 *  @param progress 缓冲进度，0-100
 *  @param msg      附件信息，此版本为nil
 */
- (void) onBufferProgress:(int) progress message:(NSString *)msg{
    
}

/**
 *  播放进度回调
 *
 *  @param progress 当前播放进度，0-100
 *  @param beginPos 当前播放文本的起始位置，0-100
 *  @param endPos 当前播放文本的结束位置，0-100
 */
- (void) onSpeakProgress:(int) progress beginPos:(int)beginPos endPos:(int)endPos{
    
}

/**
 *  暂停播放回调
 */
- (void) onSpeakPaused{
    
}

/**
 *  恢复播放回调
 */
- (void) onSpeakResumed{
    
}

/**
 *  正在取消回调
 * 当调用`cancel`之后会回调此函数
 */
- (void) onSpeakCancel{
    
}

/**
 *  扩展事件回调
 *  根据事件类型返回额外的数据
 *
 *  @param eventType 事件类型，具体参见IFlySpeechEventType枚举。目前只支持EVENT_TTS_BUFFER也就是实时返回合成音频。
 *  @param arg0      arg0
 *  @param arg1      arg1
 *  @param eventData 事件数据
 */
- (void) onEvent:(int)eventType arg0:(int)arg0 arg1:(int)arg1 data:(NSData *)eventData{
    
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
