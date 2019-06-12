//
//  LMJBaseRequest.m
//  PLMMPRJK
//
//  Created by HuXuPeng on 2017/4/24.
//  Copyright © 2017年 GoMePrjk. All rights reserved.
//

#import "LMJBaseRequest.h"

@implementation LMJBaseRequest


- (void)GET:(NSString *)URLString parameters:(id)parameters completion:(void(^)(LMJBaseResponse *response))completion
{
    
    @weakify(self);
    [[LMJRequestManager sharedManager] GET:URLString parameters:parameters completion:^(LMJBaseResponse *response) {
        @strongify(self)
        if (!self) {
            return ;
        }
        
        
        !completion ?: completion(response);
        
    }];
}

- (void)POST:(NSString *)URLString parameters:(id)parameters completion:(void(^)(LMJBaseResponse *response))completion
{
    @weakify(self);
    [[LMJRequestManager sharedManager] POST:URLString parameters:parameters completion:^(LMJBaseResponse *response) {
        @strongify(self)
        if (!self) {
            return ;
        }
        
        
        !completion ?: completion(response);
        
    }];
}



@end
