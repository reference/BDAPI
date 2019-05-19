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
/// 聊天

#import <Foundation/Foundation.h>

@interface BCChatModel : NSObject
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, assign) NSInteger belonguserid;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSString *createdat;
@property (nonatomic, assign) NSInteger senderid;
@property (nonatomic, strong) NSString *senderavatar;
@property (nonatomic, assign) NSInteger receiverid;
@property (nonatomic, strong) NSString *receiveravatar;


+ (void)requestChatsWithFriendUserId:(NSInteger)friendId offset:(NSInteger)offset completion:(void(^)(NSArray <BCChatModel *> *ms, NSError *error))completion;


/**
 发消息

 @param text 文字
 @param img 图片
 @param friendid 朋友id
 @param completion callback
 */
+ (void)sendMessage:(NSString *)text img:(NSString *)img toFriendID:(NSInteger)friendid completion:(void(^)(NSError *error))completion;


/**
 清除与好友的聊天记录

 @param friendid 好友id
 @param completion callback
 */
+ (void)clearChatsWithFriendId:(NSInteger)friendid completion:(void(^)(NSError *error))completion;
@end
