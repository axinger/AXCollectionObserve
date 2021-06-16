//
//  AXMutableObserveProtocol.h
//  AXCollectionObserve
//
//  Created by 小星星吃KFC on 2021/6/16.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/RACSignal.h>

NS_ASSUME_NONNULL_BEGIN

@protocol AXMutableObserveProtocol <NSObject>

@required
/// 值变化监听
/// @param handler 回调
-(void)ax_valueChangeObserve:(void(^)(id val))handler;

/// 多个信号
@property(nonatomic, strong, readonly) RACSignal *ax_collectSignal;

/// 方法
/// 存放 NSStringFromSelector(@selector())
@property(nonatomic, strong, readonly)NSArray<NSString/*SEL*/ *> *selectorArray;

@end

NS_ASSUME_NONNULL_END
