//
//  AXCollectionObserve.h
//  AXCollectionObserve
//
//  Created by 小星星吃KFC on 2021/3/29.
//

#import "NSMutableArray+AXObserve.h"
#import "NSMutableDictionary+AXObserve.h"
#import "NSMutableOrderedSet+AXObserve.h"
#import "NSMutableSet+AXObserve.h"
#import "RACSignal+AXMutable.h"

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
