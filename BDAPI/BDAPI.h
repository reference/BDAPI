//
//  BDAPI.h
//  BDAPI
//
//  Created by 向荣华 on 2019/5/19.
//  Copyright © 2019 scottban. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for BDAPI.
FOUNDATION_EXPORT double BDAPIVersionNumber;

//! Project version string for BDAPI.
FOUNDATION_EXPORT const unsigned char BDAPIVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <BDAPI/PublicHeader.h>

#define keyUserLogoutNotification @"keyLogout"
#define FDPageSize 20
#define APP @"bookclub"

#import "HTTP.h"
#import "HTTPResponse.h"
#import "NSError+LocalizedDescription.h"

#import "BCUserModel.h"
#import "BCZoneModel.h"
#import "BCContactModel.h"
#import "BCContactRequestModel.h"
#import "BCChatModel.h"
#import "BCChatListModel.h"
