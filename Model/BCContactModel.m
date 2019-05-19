//
//  BCContactModel.m
//  BookClub
//
//  Created by 向荣华 on 2019/5/3.
//  Copyright © 2019 scottban. All rights reserved.
//

#import "BCContactModel.h"
#import "HTTP.h"

@implementation BCContactModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID":@"id"};
}

+ (void)requestMyContacts:(void(^)(NSArray <BCContactModel *> *ms, NSError *error))completion
{
    NSString *path = @"/api/contact/list";
    [HTTP requestWithPath:path params:nil responseDataClass:self.class completion:^(HTTPResponse *response, NSError *error) {
        if (completion) {
            completion(response.data,error);
        }
    }];
}

+ (void)deleteFriendById:(NSInteger)friendId completion:(void(^)(NSError *error))completion
{
    NSString *path = @"/api/contact/deleteFriend";
    [HTTP requestWithPath:path params:@{@"friendId":@(friendId)} responseDataClass:nil completion:^(HTTPResponse *response, NSError *error) {
        if (completion) {
            completion(error);
        }
    }];
}

@end
