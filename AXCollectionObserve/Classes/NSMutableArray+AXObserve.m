//
//  NSMutableArray+AXObserve.m
//  AXCollectionObserve
//
//  Created by 小星星吃KFC on 2021/3/29.
//

#import "NSMutableArray+AXObserve.h"
#import <ReactiveObjC/ReactiveObjC.h>
@implementation NSMutableArray (AXObserve)

-(void)ax_valueChangeObserve:(void(^)(NSMutableArray *array))handler{
    NSArray<NSString *> *array = @[
        NSStringFromSelector(@selector(insertObject:atIndex:)), //insert,包含 addObject:
        NSStringFromSelector(@selector(setObject:atIndexedSubscript:)),
        NSStringFromSelector(@selector(replaceObjectAtIndex:withObject:)),
        NSStringFromSelector(@selector(removeAllObjects)),
        NSStringFromSelector(@selector(removeObjectAtIndex:)), // 包含 removeLastObject removeObject:
    ];
    for (NSString *str in array) {
        [self _ax_addSelector:NSSelectorFromString(str) handler:handler];
    }
    
}

-(void)_ax_addSelector:(SEL)selector handler:(void(^)(NSMutableArray *array))handler{
    
    __weak typeof(self) weakSelf = self;
    [[self rac_signalForSelector:selector] subscribeNext:^(id  _Nullable x) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (handler) {
            handler(strongSelf);
        }
    }];
}


//-(RACSignal *)ax_addObserve {
//
//    RACSignal *nal = nil;
//    NSArray<NSString *> *array = @[
//        @"addObject:",
//        @"insertObject:atIndex:",
//        @"removeObjectAtIndex:",
//    ];
//    for (NSString *str in array) {
//        RACSignal *temp = [self _ax_addSelector:NSSelectorFromString(str)];
//        if (!nal) {
//            nal =  temp;
//        }else{
//            nal = [nal merge:temp];
//        }
//
//    }
//
//    return nal;
//}
//-(RACSignal *)_ax_addSelector:(SEL)selector{
//    return [self rac_signalForSelector:selector];
//}

@end
