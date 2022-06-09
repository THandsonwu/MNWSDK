#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "MNWSDK.h"
#import "MNWSDKRegister.h"
#import "MNWSDKTypeDefine.h"
#import "MNWToken.h"
#import "MNWUser.h"
#import "MNWBindAccoutParam.h"
#import "MNWBindingVerCodeParam.h"
#import "MNWLoginParam.h"
#import "MNWVerCodeParam.h"

FOUNDATION_EXPORT double MNWSDKVersionNumber;
FOUNDATION_EXPORT const unsigned char MNWSDKVersionString[];

