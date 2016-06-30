//
//  QLViewController.m
//  程浩个人测试项目
//
//  Created by ch on 16/6/12.
//  Copyright © 2016年 id. All rights reserved.
//

#import "QLViewController.h"
#import <QuickLook/QuickLook.h>
@interface QLViewController ()<QLPreviewControllerDataSource,QLPreviewControllerDelegate>

@end

@implementation QLViewController
{
    NSArray *filenamesArray;
    int currentPreviewIndex;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 100, 30)];
    [button setTitle:@"show" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor blackColor]];
    [button addTarget:self action:@selector(show) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    // Do any additional setup after loading the view.
}

- (void)show{
    filenamesArray = [NSArray arrayWithObjects:@"S5.png",@"S2.dotecx",@"S3.doc",@"S4.rtf",@"S1.ppt",@"S6.csv",@"S7.pdf", nil];
    QLPreviewController *previewVC = [[QLPreviewController alloc] init];
    previewVC.delegate = self;
    previewVC.dataSource = self;
    previewVC.currentPreviewItemIndex = 1;
    [self.navigationController pushViewController:previewVC animated:YES];
}

-(NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller{
    return [filenamesArray count];
    //return 1;
}
-(id<QLPreviewItem>)previewController:(QLPreviewController *)controller previewItemAtIndex:(NSInteger)index{
    NSString *path=[[NSBundle mainBundle] pathForResource:[filenamesArray objectAtIndex:index] ofType:nil];
    NSLog(@"%@",path);
    return [NSURL fileURLWithPath:path];
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
