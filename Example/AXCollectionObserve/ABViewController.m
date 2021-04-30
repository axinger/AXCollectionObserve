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
}

-(void)_testArray {
    
    [self _titlelabel:@"数组"];
    NSMutableArray *array = NSMutableArray.array;
    self.array = array;
    [array ax_valueChangeObserve:^(NSMutableArray * _Nonnull array) {
        NSLog(@"array = %@",array);
    }];
    
    [self _buttonTitle:@"数组添加元素" handler:^(UIButton * _Nonnull btn) {
        
        NSString *str = [NSString stringWithFormat:@"array-%ld",array.count];
        [array addObject:str];
    }];
    [self _buttonTitle:@"数组插入元素" handler:^(UIButton * _Nonnull btn) {
        
        NSString *str = [NSString stringWithFormat:@"array-%ld",array.count];
        [array insertObject:str atIndex:0];
    }];
    [self _buttonTitle:@"数组删除最后一个元素" handler:^(UIButton * _Nonnull btn) {
        
        if (array.count>0) {
            [array removeLastObject];
        }
        
    }];
    [self _buttonTitle:@"数组删除第一个元素" handler:^(UIButton * _Nonnull btn) {
        
        if (array.count>0) {
            [array removeObjectAtIndex:0];
        }
    }];
    [self _buttonTitle:@"数组清空元素" handler:^(UIButton * _Nonnull btn) {
        
        [array removeAllObjects];
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
