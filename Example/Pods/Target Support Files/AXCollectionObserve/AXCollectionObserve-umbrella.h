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

#import "AXCollectionObserve.h"
#import "NSMutableArray+AXObserve.h"
#import "NSMutableDictionary+AXObserve.h"
#import "NSMutableOrderedSet+AXObserve.h"
#import "NSMutableSet+AXObserve.h"

FOUNDATION_EXPORT double AXCollectionObserveVersionNumber;
FOUNDATION_EXPORT const unsigned char AXCollectionObserveVersionString[];

