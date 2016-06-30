//
//  GesViewController.m
//  程浩个人测试项目
//
//  Created by ch on 16/6/29.
//  Copyright © 2016年 id. All rights reserved.
//

#import "GesViewController.h"
#import "KMGestureRecognizer.h"

@interface GesViewController ()
@property(nonatomic,retain)UIImageView *mainImage;
@property (nonatomic,strong)KMGestureRecognizer *customGestureRecognizer;
@end

@implementation GesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = WhiteColor;
    self.mainImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"123"]];
    [self.view addSubview:self.mainImage];
    [self.mainImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(200);
    }];
    CGFloat cornerRadius = 100;
    self.mainImage.userInteractionEnabled = YES;
    self.mainImage.layer.cornerRadius = cornerRadius;
    self.mainImage.layer.masksToBounds = YES;
    self.mainImage.layer.borderWidth = 2;
    self.mainImage.layer.borderColor = GrayColor.CGColor;
    
//    [self binPan:self.mainImage];
    [self binRotation:self.mainImage];
    [self binPinch:self.mainImage];
    [self binTap:self.mainImage];
    [self binLongPress:self.mainImage];
    //为了处理手势识别优先级的问题，这里需先绑定自定义挠痒手势
    [self binCustomGesutreRecognizer];
    [self binSwipe];
    // Do any additional setup after loading the view.
}

#pragma mark - 处理手势操作
/**
*  处理拖动手势
*
*  @param recognizer 拖动手势识别器对象实例
*/
- (void)handlePan:(UIPanGestureRecognizer*)recognizer{
    [recognizer.view.superview bringSubviewToFront:recognizer.view];
    CGPoint center = recognizer.view.center;
    CGFloat cornerRadius = recognizer.view.frame.size.width/2;
    CGPoint translation = [recognizer translationInView:self.view];
    recognizer.view.center = CGPointMake(center.x+translation.x, center.y+translation.y);
    [recognizer setTranslation:CGPointZero inView:self.view];
    //滑行一段
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        CGPoint velocity = [recognizer velocityInView:self.view];
        CGFloat magnitude = sqrtf((velocity.x*velocity.x)+(velocity.y)*(velocity.y));
        CGFloat slideMult = magnitude/200;
        float slideFactor = 0.1*slideMult;
        CGPoint finalPoint = CGPointMake(center.x+(velocity.x*slideFactor), center.y+(velocity.y*slideFactor));
        finalPoint.x = MIN(MAX(finalPoint.x, cornerRadius),self.view.bounds.size.width-cornerRadius);
        finalPoint.y = MIN(MAX(finalPoint.y, cornerRadius), self.view.bounds.size.height-cornerRadius);
        [UIView animateWithDuration:slideFactor*2 animations:^{
            recognizer.view.center = finalPoint;
        }];
    }
}

/**
 *  处理旋转手势
 *
 *  @param recognizer 旋转手势识别器对象实例
 */
- (void)handleRotation:(UIRotationGestureRecognizer*)recognizer{
    recognizer.view.transform = CGAffineTransformRotate(recognizer.view.transform, recognizer.rotation);
    recognizer.rotation = 0.0;
}
/**
 *  处理捏合手势
 *
 *  @param recognizer 捏合手势识别器对象实例
 */
- (void)handlePinch:(UIPinchGestureRecognizer*)recognizer{
    CGFloat scale = recognizer.scale;
    recognizer.view.transform = CGAffineTransformScale(recognizer.view.transform, scale, scale);
    recognizer.scale = 1.0;
}

/**
 *  处理点按手势
 *
 *  @return 点按手势识别器对象实例
 */
- (void)handleTap:(UITapGestureRecognizer*)recognizer{
    UIView *view = recognizer.view;
    view.transform = CGAffineTransformMakeScale(1.0, 1.0);
    view.transform = CGAffineTransformMakeRotation(0.0);
    view.alpha = 1.0;
}

/**
 *  处理长按手势
 *
 *  @return 点按手势识别器对象实例
 */
- (void)handleLongPress:(UILongPressGestureRecognizer*)recognizer{
    recognizer.view.alpha = 0.7;
}

/**
 *   处理轻扫手势
 *
 *  @return 轻扫手势识别器对象实例
 */
- (void)handleSwipe:(UISwipeGestureRecognizer*)recognizer{
    //代码块方式封装操作方法
    void(^positionOperation)() = ^(){
        CGPoint newPoint = recognizer.view.center;
        newPoint.y -= 20.0;
        self.mainImage.center = newPoint;
    };
    switch (recognizer.direction) {
        case UISwipeGestureRecognizerDirectionRight:
        {
            positionOperation();
        }
            break;
        case UISwipeGestureRecognizerDirectionLeft:
        {
            positionOperation();
        }
            break;
        case UISwipeGestureRecognizerDirectionUp: {
            break;
        }
        case UISwipeGestureRecognizerDirectionDown: {
            break;
        }
    }
}

- (void)hadleCustomGestureRecognizer:(KMGestureRecognizer*)recognizer{
    void(^positionOperation)() = ^(){
        CGPoint newPoint = recognizer.view.center;
        newPoint.x -= 20.0;
        _mainImage.center = newPoint;
    };
    positionOperation();
}

#pragma mark - 绑定手势操作
- (void)binPan:(UIImageView*)imgVCustom{
    UIPanGestureRecognizer *recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [imgVCustom addGestureRecognizer:recognizer];
}

- (void)binRotation:(UIImageView*)imgVCustom{
    UIRotationGestureRecognizer *recognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(handleRotation:)];
    [imgVCustom addGestureRecognizer:recognizer];
}

- (void)binPinch:(UIImageView*)imgVCustom{
    UIPinchGestureRecognizer *recognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];
    [imgVCustom addGestureRecognizer:recognizer];
}

- (void)binTap:(UIImageView*)imgVCustom{
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    recognizer.numberOfTapsRequired = 2;
    recognizer.numberOfTouchesRequired = 1;
    [imgVCustom addGestureRecognizer:recognizer];
}

- (void)binLongPress:(UIImageView*)imgVCustom{
    UILongPressGestureRecognizer *recognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
    recognizer.minimumPressDuration = 0.5;
    [imgVCustom addGestureRecognizer:recognizer];
}

/**
 *  绑定轻扫手势；支持四个方向的轻扫，但是不同的方向要分别定义轻扫手势
 */
- (void)binSwipe{
    UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    recognizer.direction = UISwipeGestureRecognizerDirectionRight;//设置轻扫方向；默认是 UISwipeGestureRecognizerDirectionRight，即向右轻扫
    [self.view addGestureRecognizer:recognizer];
    [recognizer requireGestureRecognizerToFail:_customGestureRecognizer];
    //向左轻扫手势
    recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    recognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:recognizer];
    [recognizer requireGestureRecognizerToFail:_customGestureRecognizer];
}

/**
 *  绑定自定义挠痒手势；判断是否有三次不同方向的动作，如果有则手势结束，将执行回调方法
 */
- (void)binCustomGesutreRecognizer{
    _customGestureRecognizer = [[KMGestureRecognizer alloc] initWithTarget:self action:@selector(hadleCustomGestureRecognizer:)];
    [self.view addGestureRecognizer:_customGestureRecognizer];
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
