//
//  NSMutableOrderedSet+AXObserve.m
//  AXCollectionObserve
//
//  Created by 小星星吃KFC on 2021/3/29.
//

#import "NSMutableOrderedSet+AXObserve.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "AXMutableHelper.h"

@implementation NSMutableOrderedSet (AXObserve)

-(NSArray<NSString *> *)selectorArray {
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
    return array;
}

-(void)ax_valueChangeObserve:(void(^)(NSMutableOrderedSet *set))handler {
    for (NSString *str in self.selectorArray) {
        [AXMutableHelper addWithObjc:self selector:NSSelectorFromString(str) handler:handler];
    }
}

-(RACSignal *)ax_collectSignal {
    return [AXMutableHelper addWithObjc:self signal:self.selectorArray];
}

@end
