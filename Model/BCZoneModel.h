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
/// 朋友圈

#import <Foundation/Foundation.h>

@interface BCZoneModel : NSObject
@property (nonatomic, assign) NSInteger userid;
@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSString *createdat;
@property (nonatomic, assign) NSInteger likes;
@property (nonatomic, assign) double longitude;
@property (nonatomic, assign) double latitude;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *useravatar;
@property (nonatomic, strong) NSString *usernickname;

/// 我朋友圈里的所有说说
+ (void)requestAllMyZoneListWithOffset:(NSInteger)offset completion:(void(^)(NSArray <BCZoneModel *> *ms, NSError *error))completion;

/// 所有用户的说说
+ (void)requestAllZoneListWithOffset:(NSInteger)offset completion:(void(^)(NSArray <BCZoneModel *> *ms, NSError *error))completion;

/// 用户自己朋友圈的说说
+ (void)requestUserZoneListWithUserId:(NSInteger)userId offset:(NSInteger)offset completion:(void(^)(NSArray <BCZoneModel *> *ms, NSError *error))completion;

/// 发朋友圈
+ (void)postNewZoneWithText:(NSString *)text img:(NSString *)img completion:(void(^)(NSError *error))completion;

@end
