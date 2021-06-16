//
//  NSMutableDictionary+AXObserve.m
//  AXCollectionObserve
//
//  Created by 小星星吃KFC on 2021/3/29.
//

#import "NSMutableDictionary+AXObserve.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "AXMutableHelper.h"
@implementation NSMutableDictionary (AXObserve)

-(NSArray<NSString *> *)selectorArray {
    
    NSArray<NSString *> *array = @[
        NSStringFromSelector(@selector(setObject:forKey:)),
        NSStringFromSelector(@selector(removeAllObjects)),
        //        NSStringFromSelector(@selector(removeObjectsForKeys:)),
        NSStringFromSelector(@selector(removeObjectForKey:)),// 包含 removeObjectsForKeys:
        NSStringFromSelector(@selector(setDictionary:)),
        NSStringFromSelector(@selector(setObject:forKeyedSubscript:)),
        NSStringFromSelector(@selector(addEntriesFromDictionary:)),
    ];
    return array;
}

-(void)ax_valueChangeObserve:(void(^)(NSMutableDictionary *dict))handler {
    for (NSString *str in self.selectorArray) {
        [AXMutableHelper addWithObjc:self selector:NSSelectorFromString(str) handler:handler];
    }
}

-(RACSignal *)ax_collectSignal {
    return [AXMutableHelper addWithObjc:self signal:self.selectorArray];
}

@end
