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
/// 好友申请列表模型

#import <Foundation/Foundation.h>
@interface BCContactRequestModel : NSObject
@property (nonatomic, assign) NSInteger userid;
@property (nonatomic, assign) NSInteger fromid;
@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString *fromnickname;
@property (nonatomic, strong) NSString *fromavatar;
@property (nonatomic, assign) NSInteger fromsex;
@property (nonatomic, assign) NSInteger agree;
@property (nonatomic, strong) NSString *createdat;
@property (nonatomic, strong) NSString *message;

+ (void)requestMyContactRequests:(void(^)(NSArray <BCContactRequestModel *> *ms, NSError *error))completion;


/**
 同意请求还是拒绝

 @param status 1 同意 2 拒绝
 @param requestUserId 发起请求者的Userid
 @param completion callback
 */
+ (void)agreeOrRefuseStatus:(NSInteger)status requestUserId:(NSInteger)requestUserId completion:(void(^)(NSError *error))completion;


/**
 申请加好友

 @param toUserId <#toUserId description#>
 @param completion <#completion description#>
 */
+ (void)addFriendRequestWithToUserId:(NSInteger)toUserId completion:(void(^)(NSError *error))completion;

@end
