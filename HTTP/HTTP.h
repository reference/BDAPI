//
//  HTTP.h
//  Fund3D
//
//  Created by xyz on 2018/7/26.
//  Copyright © 2018年 TTLX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPResponse.h"
#import <ZXToolBox/ZXToolBox.h>

// 强制切换到正式环境
#ifdef DEVELOP
#undef DEVELOP
#endif

// 强制切换到测试环境
//#ifndef DEVELOP
//#define DEVELOP
//#endif

#pragma mark - HTTP_SERVER_API
/* HTTP_SERVER_API */
#ifdef DEVELOP  /* 测试环境 */

    #ifdef HotBookClub
        #define HTTP_SERVER_API         @"http://192.168.1.128:18000"
//        #define HTTP_SERVER_API         @"http://www.jihejingjia.cn:18000"
    #else
//        #define HTTP_SERVER_API         @"http://www.jihejingjia.cn:18000"
        #define HTTP_SERVER_API         @"http://192.168.1.128:18000"
    #endif

#else /* 正式环境 */

    // 取消强制定义
    #ifdef HTTP_SERVER_API
        #undef HTTP_SERVER_API
    #endif

    // HTTP_SERVER_API
    #ifdef HotBookClub
        #define HTTP_SERVER_API         @"http://www.jihejingjia.cn:18000"
    #else
        #define HTTP_SERVER_API         @"http://www.jihejingjia.cn:18000"
    #endif

#endif /* HTTP_SERVER_API */

#define kIMAGE_URL @"http://image.votue.com.cn/operation/transaction/uploadFile"


@interface HTTP : NSObject

+ (void)requestWithURL:(NSString *)url
                params:(NSDictionary *)params
                  body:(id)body
         responseClass:(Class)responseClass
     responseDataClass:(NSDictionary *)responseDataClass
            completion:(void(^)(id responseObject, NSError *error))completion;

+ (void)requestWithURL:(NSString *)url
                params:(NSDictionary *)params
                  body:(id)body
            completion:(void(^)(id responseObject, NSError *error))completion;

+ (void)uploadWithURL:(NSString *)url
               params:(NSDictionary *)params
                 data:(NSArray<ZXHTTPFormData *> *)data
        responseClass:(Class)responseClass
           completion:(void(^)(id responseObject, NSError *error))completion;

//FROM MTO
+ (void)requestWithPath:(NSString *)path responseDataClass:(Class)responseDataClass completion:(void(^)(HTTPResponse *response, NSError *error))completion;

+ (void)requestWithPath:(NSString *)path body:(id)body responseDataClass:(Class)responseDataClass completion:(void(^)(HTTPResponse *response, NSError *error))completion;

+ (void)requestWithPath:(NSString *)path params:(NSDictionary *)params responseDataClass:(Class)responseDataClass completion:(void(^)(HTTPResponse *response, NSError *error))completion;

+ (void)requestWithPath:(NSString *)path params:(NSDictionary *)params body:(id)body responseDataClass:(Class)responseDataClass completion:(void(^)(HTTPResponse *response, NSError *error))completion;

+ (void)requestWithURL:(NSString *)url params:(NSDictionary *)params body:(id)body responseDataClass:(Class)responseDataClass completion:(void(^)(HTTPResponse *response, NSError *error))completion;

+ (void)requestWithURL:(NSString *)url params:(NSDictionary *)params body:(id)body responseClass:(Class)responseClass completion:(void(^)(id responseObject, NSError *error))completion;
@end
