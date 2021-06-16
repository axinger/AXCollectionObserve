//
//  NSMutableSet+AXObserve.m
//  AXCollectionObserve
//
//  Created by 小星星吃KFC on 2021/3/29.
//

#import "NSMutableSet+AXObserve.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "AXMutableHelper.h"

@implementation NSMutableSet (AXObserve)

-(NSArray<NSString *> *)selectorArray {
    NSArray<NSString *> *array = @[
        NSStringFromSelector(@selector(addObject:)),
        NSStringFromSelector(@selector(removeObject:)),
        NSStringFromSelector(@selector(addObjectsFromArray:)),
        NSStringFromSelector(@selector(intersectSet:)),
        NSStringFromSelector(@selector(minusSet:)),
        NSStringFromSelector(@selector(removeAllObjects)),
        NSStringFromSelector(@selector(unionSet:)),
        NSStringFromSelector(@selector(setSet:)),
    ];
    return array;
}

-(void)ax_valueChangeObserve:(void(^)(NSMutableSet *set))handler {
    
    for (NSString *str in self.selectorArray) {
        [AXMutableHelper addWithObjc:self selector:NSSelectorFromString(str) handler:handler];
    }
    
}
-(RACSignal *)ax_collectSignal {
    return [AXMutableHelper addWithObjc:self signal:self.selectorArray];
}

@end
