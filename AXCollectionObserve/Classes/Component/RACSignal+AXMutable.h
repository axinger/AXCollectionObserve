//
//  RACSignal+AXMutable.h
//  AXCollectionObserve
//
//  Created by 小星星吃KFC on 2021/6/16.
//

#import <ReactiveObjC/ReactiveObjC.h>

NS_ASSUME_NONNULL_BEGIN

@interface RACSignal (AXMutable)

/**
 可以监听初始化 效果与如下 一样
 [RACObserve(self, array) subscribeNext:^(id  _Nullable x) {
 todo
 [self.array ax_valueChangeObserve:^(NSMutableArray * _Nonnull array) {
 [self _logArray];
 }];
 }];
 建议 先 removeAllObjects 再 addObjectsFromArray
 */
/// NSMutable 集合 监听,包含初始化监听
/// @param nextBlock 回调
-(void)ax_subscribeNext:(void (^)(id x))nextBlock;

@end

NS_ASSUME_NONNULL_END
