//
//  BCChatListModel.m
//  BookClub
//
//  Created by 向荣华 on 2019/5/3.
//  Copyright © 2019 scottban. All rights reserved.
//

#import "BCChatListModel.h"
#import "HTTP.h"

@implementation BCChatListModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID":@"id"};
}

+ (void)requestMyChatLists:(void(^)(NSArray <BCChatListModel *> *ms, NSError *error))completion
{
    NSString *path = @"/api/chat/list";
    [HTTP requestWithPath:path params:nil responseDataClass:self.class completion:^(HTTPResponse *response, NSError *error) {
        if (completion) {
            completion(response.data,error);
        }
    }];
}

+ (void)deleteChatListWithFriendId:(NSInteger)friendid completion:(void(^)(NSError *error))completion
{
    NSString *path = @"/api/chat/delete";
    [HTTP requestWithPath:path params:@{@"friendid":@(friendid)} responseDataClass:self.class completion:^(HTTPResponse *response, NSError *error) {
        if (completion) {
            completion(error);
        }
    }];
}
@end
