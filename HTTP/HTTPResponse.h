//
//  HTTPResponse.h
//  Fund3D
//
//  Created by xyz on 2018/8/17.
//  Copyright © 2018年 kubo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTTPResponse : NSObject
@property (nonatomic, assign) NSInteger code;
@property (nonatomic, strong) id data;
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, strong) NSString *message;

@end
