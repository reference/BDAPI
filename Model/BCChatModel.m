/**
 MIT License
 
 Copyright (c) 2018 Scott Ban (https://github.com/reference/BDAPI)
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 */

#import "BCChatModel.h"
#import <BDToolKit/BDToolKit.h>
#import <StandardPageSize/StandardPageSize.h>
#import "HTTP.h"
#import "BDAPI.h"

@implementation BCChatModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID":@"id"};
}

+ (void)requestChatsWithFriendUserId:(NSInteger)friendId offset:(NSInteger)offset completion:(void(^)(NSArray <BCChatModel *> *ms, NSError *error))completion
{
    NSString *path = @"/api/chat/mychats";
    [HTTP requestWithPath:path params:@{@"friendUserId":@(friendId),@"offset":@(offset),@"size":@(Standard_Page_Size_Default)} responseDataClass:self.class completion:^(HTTPResponse *response, NSError *error) {
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
