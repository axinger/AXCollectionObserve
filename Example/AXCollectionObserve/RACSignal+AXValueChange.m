//
//  RACSignal+AXValueChange.m
//  AXCollectionObserve_Example
//
//  Created by 小星星吃KFC on 2021/6/15.
//  Copyright © 2021 axinger. All rights reserved.
//

#import "RACSignal+AXValueChange.h"
#import <AXCollectionObserve/AXCollectionObserve.h>

@implementation RACSignal (AXValueChange)


-(void)ax_valueChange:(void (^)(id x))nextBlock {
    
    [self subscribeNext:^(id  _Nullable x) {
        
        if (nextBlock) {
            nextBlock(x);
        }
        if ([x isKindOfClass:NSMutableArray.class]) {
            NSMutableArray *array = x;
            [array ax_valueChangeObserve:^(NSMutableArray * _Nonnull array) {
                if (nextBlock) {
                    nextBlock(array);
                }
            }];
        }
    }];
}
@end
