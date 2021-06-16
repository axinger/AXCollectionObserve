//
//  AXMutableHelper.m
//  AXCollectionObserve
//
//  Created by 小星星吃KFC on 2021/6/16.
//

#import "AXMutableHelper.h"

@implementation AXMutableHelper

+(RACSignal *)addWithObjc:(id )objc signal:(NSArray<NSString/*SEL*/ *> *)array{
    
    RACSignal *signal = nil;
    for (NSString *str in array) {
        SEL sel = NSSelectorFromString(str);
        if (sel==nil) {
            break;
        }
        RACSignal *temp = [objc rac_signalForSelector:NSSelectorFromString(str)];
        if (!signal) {
            signal =  temp;
        }else{
            signal = [signal merge:temp];
        }
    }
    return signal;
}


+(void)addWithObjc:(id )objc selector:(SEL)selector handler:(void(^)(id val))handler {
    
    @weakify(objc)
    [[objc rac_signalForSelector:selector] subscribeNext:^(id  _Nullable x) {
        @strongify(objc)
        if (handler) {
            handler(objc);
        }
    }];
}


@end
