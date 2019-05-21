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
/// 社区内容
#import <Foundation/Foundation.h>

@interface BCCommunityPuhlishModel : NSObject
@property (nonatomic, strong) NSString *content;
@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, assign) NSInteger userid;
@property (nonatomic, strong) NSString *images;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *useravatar;
@property (nonatomic, strong) NSString *mobile;
@property (nonatomic, strong) NSString *contactname;
@property (nonatomic, strong) NSString *createdat;
@property (nonatomic, assign) BOOL istop;
@property (nonatomic, strong) NSString *topdesc;
@property (nonatomic, assign) NSInteger categoryid;
@property (nonatomic, assign) NSInteger communityid;

/**
 发布

 @param content 内容
 @param userId 用户ID
 @param images 图片用英文逗号,分隔
 @param mobile 联系人手机号
 @param contactName 联系人姓名
 @param isTop 是否置顶
 @param topDesc 置顶描述
 @param categoryId 分类ID
 @param communityId 社区ID
 @param completion nil
 */
+ (void)newPublishWithContent:(NSString *)content
                       userId:(NSString *)userId
                       images:(NSString *)images
                       mobile:(NSString *)mobile
                  contactName:(NSString *)contactName
                        isTop:(BOOL)isTop
                      topDesc:(NSString *)topDesc
                   categoryId:(NSInteger)categoryId
                  communityId:(NSInteger)communityId
                   completion:(void(^)(NSError *error))completion;


/**
 分页获取社区发布列表

 @param offset 偏移量
 @param categoryId 分类ID
 @param communityId 社区ID
 @param completion nil
 */
+ (void)requestPublishedListWithOffset:(NSInteger)offset
                            categoryId:(NSInteger)categoryId
                           communityId:(NSInteger)communityId
                            completion:(void(^)(NSArray <BCCommunityPuhlishModel *> *ms,NSError *error))completion;

@end
