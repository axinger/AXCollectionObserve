//
//  ABViewController.m
//  AXCollectionObserve_Example
//
//  Created by 小星星吃KFC on 2021/3/30.
//  Copyright © 2021 axinger. All rights reserved.
//

#import "ABViewController.h"
#import <AXCollectionObserve/AXCollectionObserve.h>
@interface ABViewController ()
@property(nonatomic,strong)  NSMutableArray *array;
@end

@implementation ABViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"测试页面";
    [self _testArray];
    [self _testDict];
    [self _testSet];
    [self _lastLoadBottomAttribute];
    
//    NSArray * array = @[@"大吉大利",@"今晚吃鸡",@66666,@99999];
//    [array.rac_sequence.signal subscribeNext:^(id  _Nullable x) {
//        NSLog(@"%@",x);
//    }];

}

- (NSMutableArray *)array {
    if (!_array) {
        _array = [[NSMutableArray alloc]init];
    }
    return _array;
}
-(void)_logArray {
    NSLog(@"_logArray array = %@",self.array);
}
-(void)_testArray {
    
    [self _titlelabel:@"数组"];
//    NSMutableArray *array = NSMutableArray.array;
//    self.array = array;
    
//    [RACObserve(self, array) subscribeNext:^(id  _Nullable x) {
//        [self _logArray];
        [self.array ax_valueChangeObserve:^(NSMutableArray * _Nonnull array) {
            [self _logArray];
        }];
//    }];
    
    
    
//    [self.array ax_valueChangeObserve:^(NSMutableArray * _Nonnull array) {
//        NSLog(@"ax_valueChangeObserve array = %@",array);
//    }];
    
    
    [self _buttonTitle:@"数组内容" handler:^(UIButton * _Nonnull btn) {
        
        NSLog(@"array = %@",self.array);
    }];
    
    
    
    [self _buttonTitle:@"数组添加元素" handler:^(UIButton * _Nonnull btn) {
        
        NSString *str = [NSString stringWithFormat:@"array-%ld",self.array.count];
        [self.array addObject:str];
    }];
    [self _buttonTitle:@"数组插入元素" handler:^(UIButton * _Nonnull btn) {
        
        NSString *str = [NSString stringWithFormat:@"array-%ld",self.array.count];
        [self.array insertObject:str atIndex:0];
    }];
    [self _buttonTitle:@"数组删除最后一个元素" handler:^(UIButton * _Nonnull btn) {
        
        if (self.array.count>0) {
            [self.array removeLastObject];
        }
        
    }];

    [self _buttonTitle:@"数组删除第一个元素" handler:^(UIButton * _Nonnull btn) {
        
        if (self.array.count>0) {
            [self.array removeObjectAtIndex:0];
        }
    }];
    
    [self _buttonTitle:@"removeObject:inRange:" handler:^(UIButton * _Nonnull btn) {
        
        if (self.array.count>0) {
            [self.array removeObject:@"1" inRange:NSMakeRange(0, 2)];
        }
    }];
    
    
    [self _buttonTitle:@"数组清空元素" handler:^(UIButton * _Nonnull btn) {
        
        [self.array removeAllObjects];
    }];
    @weakify(self)
    [self _buttonTitle:@"数组赋值" handler:^(UIButton * _Nonnull btn) {
        @strongify(self)
        NSMutableArray *temp = NSMutableArray.array;
        [temp addObject:@"1"];
        self.array = temp;
    }];
    
    [self _buttonTitle:@"数组先removeAllObjects,在addObjectsFromArray" handler:^(UIButton * _Nonnull btn) {
        @strongify(self)
        NSMutableArray *temp = NSMutableArray.array;
        [temp addObject:@"1"];
        [self.array removeAllObjects];
        [self.array addObjectsFromArray:temp];
    }];
}

-(void)_testDict {
    
    [self _titlelabel:@"字典"];
    NSMutableDictionary *dict = NSMutableDictionary.dictionary;
    
    [dict ax_valueChangeObserve:^(NSMutableDictionary * _Nonnull dict) {
        NSLog(@"dict = %@",dict);
    }];
    
    [self _buttonTitle:@"数组添加元素" handler:^(UIButton * _Nonnull btn) {
        
        NSString *key = [NSString stringWithFormat:@"key-%ld",dict.count];
        dict[key] = key;
    }];
    [self _buttonTitle:@"removeObjectsForKeys" handler:^(UIButton * _Nonnull btn) {
        if (dict.allKeys.count>2) {
            [dict removeObjectsForKeys:@[dict.allKeys[0],dict.allKeys[1]]];
        }
    }];
    [self _buttonTitle:@"removeObjectForKey" handler:^(UIButton * _Nonnull btn) {
        
        if (dict.allKeys.count>0) {
            [dict removeObjectForKey:dict.allKeys.firstObject];
        }
        
    }];
    [self _buttonTitle:@"setDictionary" handler:^(UIButton * _Nonnull btn) {
        
        [dict setDictionary:@{@"name":@"jim"}];
    }];
    
    [self _buttonTitle:@"removeAllObjects" handler:^(UIButton * _Nonnull btn) {
        
        [dict removeAllObjects];
    }];
}

-(void)_testSet {
    // 重要的方法member 判断该集合是否含有某个对象，有则返回该对象，无则返回nil
    [self _titlelabel:@"set"];
    NSMutableSet *set = NSMutableSet.set;
    
    [set ax_valueChangeObserve:^(NSMutableSet * _Nonnull set) {
        NSLog(@"set = %@",set);
    }];
    
    [self _buttonTitle:@"addObject" handler:^(UIButton * _Nonnull btn) {
        
        NSString *key = [NSString stringWithFormat:@"set-%ld",set.count];
        [set addObject:key];
    }];
    [self _buttonTitle:@"removeObject" handler:^(UIButton * _Nonnull btn) {
        if (set.count>0) {
            [set removeObject: set.allObjects.lastObject];
        }
        
    }];
    
    [self _buttonTitle:@"removeAllObjects" handler:^(UIButton * _Nonnull btn) {
        
        [set removeAllObjects];
    }];
}

- (void)dealloc {
    NSLog(@"dealloc = %@",self.class);
}
@end
