//
//  BCContactRequestModel.m
//  BookClub
//
//  Created by 向荣华 on 2019/5/3.
//  Copyright © 2019 scottban. All rights reserved.
//

#import "BCContactRequestModel.h"
#import "HTTP.h"

@implementation BCContactRequestModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID":@"id"};
}

+ (void)requestMyContactRequests:(void(^)(NSArray <BCContactRequestModel *> *ms, NSError *error))completion
{
    NSString *path = @"/api/contact/request/list";
    [HTTP requestWithPath:path params:nil responseDataClass:self.class completion:^(HTTPResponse *response, NSError *error) {
        if (completion) {
            completion(response.data,error);
        }
    }];
}

+ (void)agreeOrRefuseStatus:(NSInteger)status requestUserId:(NSInteger)requestUserId completion:(void(^)(NSError *error))completion
{
    NSString *path = @"/api/contact/request/updateStatus";
    [HTTP requestWithPath:path params:@{@"status":@(status),@"requestUserId":@(requestUserId)} responseDataClass:nil completion:^(HTTPResponse *response, NSError *error) {
        if (completion) {
            completion(error);
        }
    }];
}

+ (void)addFriendRequestWithToUserId:(NSInteger)toUserId completion:(void(^)(NSError *error))completion
{
    NSString *path = @"/api/contact/request/newRequest";
    [HTTP requestWithPath:path params:@{@"toid":@(toUserId)} responseDataClass:nil completion:^(HTTPResponse *response, NSError *error) {
        if (completion) {
            completion(error);
        }
    }];
}

@end
