//
//  BCChatModel.m
//  BookClub
//
//  Created by 向荣华 on 2019/5/9.
//  Copyright © 2019 scottban. All rights reserved.
//

#import "BCChatModel.h"
#import <BDToolKit/BDToolKit.h>
#import "HTTP.h"
#import "BDAPI.h"

@implementation BCChatModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID":@"id"};
}

+ (void)requestChatsWithFriendUserId:(NSInteger)friendId offset:(NSInteger)offset completion:(void(^)(NSArray <BCChatModel *> *ms, NSError *error))completion
{
    NSString *path = @"/api/chat/mychats";
    [HTTP requestWithPath:path params:@{@"friendUserId":@(friendId),@"offset":@(offset),@"size":@(FDPageSize)} responseDataClass:self.class completion:^(HTTPResponse *response, NSError *error) {
        if (completion) {
            completion(response.data,error);
        }
    }];
}

+ (void)sendMessage:(NSString *)text img:(NSString *)img toFriendID:(NSInteger)friendid completion:(void(^)(NSError *error))completion
{
    NSString *path = @"/api/chat/sendMessage";
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param setObject:@(friendid) forKey:@"friendUserId"];
    if ([text isNotEmpty]) {
        [param setObject:[text stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]] forKey:@"text"];
    }
    if ([img isNotEmpty]) {
        [param setObject:[img stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]] forKey:@"img"];
    }
    [HTTP requestWithPath:path params:param responseDataClass:nil completion:^(HTTPResponse *response, NSError *error) {
        if (completion) {
            completion(error);
        }
    }];
}

+ (void)clearChatsWithFriendId:(NSInteger)friendid completion:(void(^)(NSError *error))completion
{
    NSString *path = @"/api/chat/deleteChatsWithFriend";
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param setObject:@(friendid) forKey:@"friendUserId"];
    [HTTP requestWithPath:path params:param responseDataClass:nil completion:^(HTTPResponse *response, NSError *error) {
        if (completion) {
            completion(error);
        }
    }];
}
@end
