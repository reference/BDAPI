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

#import "BCCommunityPuhlishModel.h"
#import "HTTP.h"
#import "BDAPI.h"

@implementation BCCommunityPuhlishModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID":@"id"};
}

+ (void)newPublishWithContent:(NSString *)content userId:(NSString *)userId images:(NSString *)images mobile:(NSString *)mobile contactName:(NSString *)contactName isTop:(BOOL)isTop topDesc:(NSString *)topDesc categoryId:(NSInteger)categoryId communityId:(NSInteger)communityId completion:(void(^)(NSError *error))completion
{
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param setObject:content forKey:@"content"];
    [param setObject:images forKey:@"images"];
    [param setObject:mobile forKey:@"mobile"];
    [param setObject:mobile forKey:@"contactName"];
    [param setObject:@(isTop) forKey:@"isTop"];
    [param setObject:topDesc forKey:@"topDesc"];
    [param setObject:@(categoryId) forKey:@"categoryId"];
    [param setObject:@(communityId) forKey:@"communityId"];
    
    NSString *path = @"/api/community/newPublish";
    [HTTP requestWithPath:path params:param responseDataClass:nil completion:^(HTTPResponse *response, NSError *error) {
        if (completion) {
            completion(error);
        }
    }];
}

+ (void)requestPublishedListWithOffset:(NSInteger)offset
                            categoryId:(NSInteger)categoryId
                           communityId:(NSInteger)communityId
                            completion:(void(^)(NSArray <BCCommunityPuhlishModel *> *ms,NSError *error))completion
{
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param setObject:@(offset) forKey:@"offset"];
    [param setObject:@(FDPageSize) forKey:@"pageSize"];
    [param setObject:@(categoryId) forKey:@"categoryId"];
    [param setObject:@(communityId) forKey:@"communityId"];
    
    NSString *path = @"/api/community/publishedList";
    [HTTP requestWithPath:path params:param responseDataClass:nil completion:^(HTTPResponse *response, NSError *error) {
        if (completion) {
            completion(response.data,error);
        }
    }];
}
@end
