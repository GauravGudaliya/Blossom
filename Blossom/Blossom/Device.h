//
//  Device.h
//  Yatayat
//
//  Created by IQR IT on 6/19/15.
//  Copyright (c) 2015 IQR IT. All rights reserved.
//

#ifndef Blossom_Device_h
#define Blossom_Device_h

#define IS_LANDSCAPE  UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation)


#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

#define kSEGMENT_HEIGHT 44
#define kPORTRAIT_HEIGHT 0.0
#define kLANDSCAPE_HEIGHT 30.0

#define kMANAGE_BOOKINGS_PORTRAIT_HEIGHT 0
#define kMANAGE_BOOKINGS_LANDSCAPE_HEIGHT 0.0

#endif
