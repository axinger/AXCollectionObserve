//
//  RACSignal+AXMutable.m
//  AXCollectionObserve
//
//  Created by 小星星吃KFC on 2021/6/16.
//

#import "RACSignal+AXMutable.h"
#import "NSMutableArray+AXObserve.h"
#import "NSMutableDictionary+AXObserve.h"
#import "NSMutableOrderedSet+AXObserve.h"
#import "NSMutableSet+AXObserve.h"

@implementation RACSignal (AXMutable)

-(void)ax_subscribeNext:(void (^)(id x))nextBlock {
    
    [self subscribeNext:^(id  _Nullable x) {
        
        if (nextBlock) {
            nextBlock(x);
        }
        if ([x isKindOfClass:NSMutableArray.class]) {
            NSMutableArray *xValue = x;
            [xValue.ax_collectSignal subscribeNext:nextBlock];
            
        }else if ([x isKindOfClass:NSMutableDictionary.class]) {
            
            NSMutableDictionary *xValue = x;
            [xValue.ax_collectSignal subscribeNext:nextBlock];
        }else if ([x isKindOfClass:NSMutableOrderedSet.class]) {
            
            NSMutableOrderedSet *xValue = x;
            [xValue.ax_collectSignal subscribeNext:nextBlock];
        }else if ([x isKindOfClass:NSMutableSet.class]) {
            
            NSMutableSet *xValue = x;
            [xValue.ax_collectSignal subscribeNext:nextBlock];
        }
    }];
}

@end
