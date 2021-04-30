//
//  NSMutableDictionary+AXObserve.m
//  AXCollectionObserve
//
//  Created by 小星星吃KFC on 2021/3/29.
//

#import "NSMutableDictionary+AXObserve.h"
#import <ReactiveObjC/ReactiveObjC.h>

@implementation NSMutableDictionary (AXObserve)

-(void)ax_valueChangeObserve:(void(^)(NSMutableDictionary *dict))handler {
    
    NSArray<NSString *> *array = @[
        NSStringFromSelector(@selector(setObject:forKey:)),
        NSStringFromSelector(@selector(removeAllObjects)),
//        NSStringFromSelector(@selector(removeObjectsForKeys:)),
        
            NSStringFromSelector(@selector(removeObjectForKey:)),// 包含 removeObjectsForKeys:
        NSStringFromSelector(@selector(setDictionary:)),
        NSStringFromSelector(@selector(setObject:forKeyedSubscript:)),
    ];
    for (NSString *str in array) {
        [self _ax_addSelector:NSSelectorFromString(str) handler:handler];
    }
    
}

-(void)_ax_addSelector:(SEL)selector handler:(void(^)(NSMutableDictionary *dict))handler{
    
    __weak typeof(self) weakSelf = self;
    [[self rac_signalForSelector:selector] subscribeNext:^(id  _Nullable x) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (handler) {
            handler(strongSelf);
        }
    }];
}
@end
