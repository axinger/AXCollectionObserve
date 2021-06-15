//
//  RACSignal+AXValueChange.h
//  AXCollectionObserve_Example
//
//  Created by 小星星吃KFC on 2021/6/15.
//  Copyright © 2021 axinger. All rights reserved.
//

#import <ReactiveObjC/ReactiveObjC.h>

NS_ASSUME_NONNULL_BEGIN

@interface RACSignal (AXValueChange)

-(void)ax_valueChange:(void (^)(id x))nextBlock;


@end

NS_ASSUME_NONNULL_END
