//
//  AXMutableHelper.h
//  AXCollectionObserve
//
//  Created by 小星星吃KFC on 2021/6/16.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>

NS_ASSUME_NONNULL_BEGIN

@interface AXMutableHelper : NSObject

+(RACSignal *)addWithObjc:(id )objc signal:(NSArray<NSString/*SEL*/ *> *)array;

+(void)addWithObjc:(id )objc selector:(SEL)selector handler:(void(^)(id val))handler;

@end

NS_ASSUME_NONNULL_END
