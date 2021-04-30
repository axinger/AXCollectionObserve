//
//  NSMutableOrderedSet+AXObserve.m
//  AXCollectionObserve
//
//  Created by 小星星吃KFC on 2021/3/29.
//

#import "NSMutableOrderedSet+AXObserve.h"
#import <ReactiveObjC/ReactiveObjC.h>
@implementation NSMutableOrderedSet (AXObserve)

-(void)ax_valueChangeObserve:(void(^)(NSMutableOrderedSet *set))handler {
    
    NSArray<NSString *> *array = @[
        NSStringFromSelector(@selector(insertObject:atIndex:)),
        NSStringFromSelector(@selector(removeObjectAtIndex:)),
        NSStringFromSelector(@selector(replaceObjectAtIndex:withObject:)),
        NSStringFromSelector(@selector(addObject:)),
        NSStringFromSelector(@selector(addObjects:count:)),
        NSStringFromSelector(@selector(addObjectsFromArray:)),
        //        NSStringFromSelector(@selector(exchangeObjectAtIndex:withObjectAtIndex:)),//交换位置的不需要
        NSStringFromSelector(@selector(moveObjectsAtIndexes:toIndex:)),
        NSStringFromSelector(@selector(insertObjects:atIndexes:)),
        NSStringFromSelector(@selector(setObject:atIndex:)),
        NSStringFromSelector(@selector(setObject:atIndexedSubscript:)),
        NSStringFromSelector(@selector(replaceObjectsInRange:withObjects:count:)),
        NSStringFromSelector(@selector(replaceObjectsAtIndexes:withObjects:)),
        NSStringFromSelector(@selector(removeObjectsInRange:)),
        NSStringFromSelector(@selector(removeObjectsAtIndexes:)),
        NSStringFromSelector(@selector(removeAllObjects)),
        NSStringFromSelector(@selector(removeObject:)),
        NSStringFromSelector(@selector(removeObjectsInArray:)),
        NSStringFromSelector(@selector(intersectOrderedSet:)),
        NSStringFromSelector(@selector(intersectSet:)),
        NSStringFromSelector(@selector(minusSet:)),
        NSStringFromSelector(@selector(unionSet:)),
        NSStringFromSelector(@selector(minusOrderedSet:)),
        NSStringFromSelector(@selector(unionOrderedSet:)),
    ];
    for (NSString *str in array) {
        [self _ax_addSelector:NSSelectorFromString(str) handler:handler];
    }
    
}

-(void)_ax_addSelector:(SEL)selector handler:(void(^)(NSMutableOrderedSet *set))handler{
    
    __weak typeof(self) weakSelf = self;
    [[self rac_signalForSelector:selector] subscribeNext:^(id  _Nullable x) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (handler) {
            handler(strongSelf);
        }
    }];
}

@end
