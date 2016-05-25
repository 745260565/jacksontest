//
//  UIView+Masonry_layout.h
//  chAutoLayout
//
//  Created by ch on 16/5/5.
//  Copyright © 2016年 ch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Masonry_layout)
- (void)distributeSpaceingHorizontallyWith:(NSArray*)views;
- (void)distributeSpacingVerticallyWith:(NSArray*)views;
@end
