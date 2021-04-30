//
//  AXViewController.m
//  AXCollectionObserve
//
//  Created by axinger on 03/29/2021.
//  Copyright (c) 2021 axinger. All rights reserved.
//

#import "AXViewController.h"
#import "ABViewController.h"
@interface AXViewController ()


@end

@implementation AXViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    __weak typeof(self) weakSelf = self;
    [self _buttonTitle:@"点击进入测试页面,检查是否被引用" handler:^(UIButton * _Nonnull btn) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        ABViewController *vc = ABViewController.alloc.init;
        [strongSelf.navigationController pushViewController:vc animated:YES];
    }];
    
    [self _lastLoadBottomAttribute];
}

@end
