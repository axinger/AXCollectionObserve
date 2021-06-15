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
/**
 如果 再次 赋值  self.array = temp; 需要用如下方法
 [RACObserve(self, array) subscribeNext:^(id  _Nullable x) {
     todo
     [self.array ax_valueChangeObserve:^(NSMutableArray * _Nonnull array) {
         [self _logArray];
     }];
 }];
 建议 先 removeAllObjects 再 addObjectsFromArray
 */
-(void)ax_valueChangeObserve:(void(^)(NSMutableArray *array))handler;

@end

NS_ASSUME_NONNULL_END
