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
