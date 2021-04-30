//
//  NSMutableSet+AXObserve.m
//  AXCollectionObserve
//
//  Created by 小星星吃KFC on 2021/3/29.
//

#import "NSMutableSet+AXObserve.h"
#import <ReactiveObjC/ReactiveObjC.h>

@implementation NSMutableSet (AXObserve)

-(void)ax_valueChangeObserve:(void(^)(NSMutableSet *set))handler {
    
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
    for (NSString *str in array) {
        [self _ax_addSelector:NSSelectorFromString(str) handler:handler];
    }
    
}

-(void)_ax_addSelector:(SEL)selector handler:(void(^)(NSMutableSet *set))handler{
    
    __weak typeof(self) weakSelf = self;
    [[self rac_signalForSelector:selector] subscribeNext:^(id  _Nullable x) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (handler) {
            handler(strongSelf);
        }
    }];
}

@end
