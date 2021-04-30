//
//  NSMutableArray+AXObserve.h
//  AXCollectionObserve
//
//  Created by 小星星吃KFC on 2021/3/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (AXObserve)

/// NSMutableArray 值变化监听
/// @param handler 回调
-(void)ax_valueChangeObserve:(void(^)(NSMutableArray *array))handler;

@end

NS_ASSUME_NONNULL_END
