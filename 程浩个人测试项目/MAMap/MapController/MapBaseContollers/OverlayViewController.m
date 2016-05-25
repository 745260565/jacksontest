//
//  OverlayViewController.m
//  程浩个人测试项目
//
//  Created by ch on 16/5/9.
//  Copyright © 2016年 id. All rights reserved.
//

#import "OverlayViewController.h"

enum{
    OverlayViewControllerOverlayTypeCircle = 0,
    OverlayViewControllerOverlayTypePolygon,
    OverlayViewControllerOverlayTypePolyline,
    OverlayViewControllerOverlayTypeColoredPolyline,
    OverlayViewControllerOverlayTypeGradientPolyline
};

@interface OverlayViewController()
@property (nonatomic,strong) NSMutableArray *overlays;
@end

@implementation OverlayViewController

- (MAOverlayRenderer*)mapView:(MAMapView *)mapView rendererForOverlay:(id<MAOverlay>)overlay{
    if ([overlay isKindOfClass:[MACircle class]]) {
        MACircleRenderer *circleRenderer = [[MACircleRenderer alloc] initWithOverlay:overlay];
        circleRenderer.lineWidth = 4.0f;
        circleRenderer.strokeColor = [UIColor blueColor];
        circleRenderer.fillColor = [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:0.3];
        return circleRenderer;
    }
    else if ([overlay isKindOfClass:[MAPolygon class]])
    {
        MAPolygonRenderer *polygonRenderer = [[MAPolygonRenderer alloc] initWithPolygon:overlay];
        polygonRenderer.lineWidth   = 4.f;
        polygonRenderer.strokeColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:1];
        polygonRenderer.fillColor   = [UIColor redColor];
        
        return polygonRenderer;
    }
    else if ([overlay isKindOfClass:[MAMultiPolyline class]])
    {
        MAMultiColoredPolylineRenderer * polylineRenderer = [[MAMultiColoredPolylineRenderer alloc] initWithMultiPolyline:overlay];
        
        polylineRenderer.lineWidth = 10.f;
        
        if (overlay == self.overlays[OverlayViewControllerOverlayTypeGradientPolyline])
        {
            polylineRenderer.strokeColors = @[[UIColor blueColor], [UIColor whiteColor], [UIColor blackColor], [UIColor greenColor]];
            polylineRenderer.gradient = YES;
        }
        else
        {
            polylineRenderer.strokeColors = @[[UIColor redColor], [UIColor yellowColor], [UIColor greenColor]];
            polylineRenderer.gradient = NO;
        }
        
        return polylineRenderer;
    }
    return nil;
}



@end
