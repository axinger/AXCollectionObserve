//
//  NSMutableArray+AXObserve.m
//  AXCollectionObserve
//
//  Created by 小星星吃KFC on 2021/3/29.
//

#import "NSMutableArray+AXObserve.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "AXMutableHelper.h"

@implementation NSMutableArray (AXObserve)

-(NSArray<NSString *> *)selectorArray {
    
    NSArray<NSString *> *array = @[
        NSStringFromSelector(@selector(insertObject:atIndex:)), //insert,包含 addObject:
        NSStringFromSelector(@selector(setObject:atIndexedSubscript:)),
        NSStringFromSelector(@selector(replaceObjectAtIndex:withObject:)),
        NSStringFromSelector(@selector(removeAllObjects)),
        NSStringFromSelector(@selector(removeObjectAtIndex:)), // 包含 removeLastObject removeObject:
        NSStringFromSelector(@selector(addObjectsFromArray:)),
    ];
    return array;
}

-(void)ax_valueChangeObserve:(void(^)(NSMutableArray *array))handler{
    for (NSString *str in self.selectorArray) {
        [AXMutableHelper addWithObjc:self selector:NSSelectorFromString(str) handler:handler];
    }
}

-(RACSignal *)ax_collectSignal {
    return [AXMutableHelper addWithObjc:self signal:self.selectorArray];
}

@end
