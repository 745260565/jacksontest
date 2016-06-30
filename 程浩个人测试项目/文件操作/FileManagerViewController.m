//
//  FileManagerViewController.m
//  程浩个人测试项目
//
//  Created by ch on 16/6/14.
//  Copyright © 2016年 id. All rights reserved.
//

#import "FileManagerViewController.h"

@interface FileManagerViewController ()
{
    UILabel *label1 ;
    UILabel *label2 ;
    UILabel *label3 ;
    UILabel *label4 ;
    UILabel *label5 ;
}
@end

@implementation FileManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"文件管理";
    label1 = [UILabel new];
    label2 = [UILabel new];
    label3 = [UILabel new];
    label4 = [UILabel new];
    label5 = [UILabel new];
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(10, 74, 72, 30)];
    [button1 addTarget:self action:@selector(showPath:) forControlEvents:UIControlEventTouchUpInside];
    [button1 setTitle:@"沙盒路径" forState:UIControlStateNormal];
    [button1 setTitleColor:BlackColor forState:UIControlStateNormal];
    [self.view addSubview:button1];
    
    
    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(92, 74, 72, 30)];
    [button2 addTarget:self action:@selector(filePathManager) forControlEvents:UIControlEventTouchUpInside];
    [button2 setTitle:@"路径处理" forState:UIControlStateNormal];
    [button2 setTitleColor:BlackColor forState:UIControlStateNormal];
    [self.view addSubview:button2];
    // Do any additional setup after loading the view.
}

- (void)showPath:(UIButton*)sender{
    sender.selected = !sender.selected;
    if (sender.selected) {
        //根目录
        NSString *homePath = NSHomeDirectory();
        label1.text = homePath;
        label1.numberOfLines = 0;
        [self.view addSubview:label1];
        [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(114);
            make.width.mas_equalTo(self.view.mas_width).offset(-20);
        }];
        NSLog(@"HomePath:%@",homePath);
        //Document目录
        NSArray *paths1 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [paths1 lastObject];
        
        label2.text = docPath;
        label2.numberOfLines = 0;
        [self.view addSubview:label2];
        [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(label1.mas_bottom).offset(10);
            make.width.mas_equalTo(label1.mas_width);
        }];
        NSLog(@"DocPath:%@",docPath);
        //Library目录
        NSArray *paths2 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
        NSString *libPath = [paths2 lastObject];
        
        label3.text = libPath;
        label3.numberOfLines = 0;
        [self.view addSubview:label3];
        [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(label2.mas_bottom).offset(10);
            make.width.mas_equalTo(label1.mas_width);
        }];
        NSLog(@"DocPath:%@",libPath);
        //Library中的Cache
        NSArray *paths3 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        NSString *cachesPath = [paths3 lastObject];
        
        label4.text = cachesPath;
        label4.numberOfLines = 0;
        [self.view addSubview:label4];
        [label4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(label3.mas_bottom).offset(10);
            make.width.mas_equalTo(label1.mas_width);
        }];
        NSLog(@"DocPath:%@",cachesPath);
        //temp路径
        NSString *tempPath = NSTemporaryDirectory();
        
        label5.text = tempPath;
        label5.numberOfLines = 0;
        [self.view addSubview:label5];
        [label5 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(label4.mas_bottom).offset(10);
            make.width.mas_equalTo(label1.mas_width);
        }];
        NSLog(@"DocPath:%@",tempPath);
    }else{
        [label1 removeFromSuperview];
        [label2 removeFromSuperview];
        [label3 removeFromSuperview];
        [label4 removeFromSuperview];
        [label5 removeFromSuperview];
    }
    
}

- (void)filePathManager{
    
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
