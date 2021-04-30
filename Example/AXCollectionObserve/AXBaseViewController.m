//
//  _00BaseViewController.m
//  AXiOSKit
//
//  Created by 小星星吃KFC on 2020/12/8.
//  Copyright © 2020 axinger. All rights reserved.
//

#import "AXBaseViewController.h"

@interface AXBaseViewController ()

//@property(nonatomic, strong) UIScrollView *scrollView;

@end

@implementation AXBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    UIScrollView *scrollView = [UIScrollView.alloc init];
    //    self.scrollView = scrollView;
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    // 2.给scrollView添加一个containerView
    UIView *containerView = [UIView.alloc init];
    containerView.backgroundColor = UIColor.whiteColor;
    self.containerView = containerView;
    [scrollView addSubview:containerView];
    [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView);
        make.width.equalTo(scrollView); // 需要设置宽度和scrollview宽度一样
    }];
    
    self.bottomAttribute = self.containerView.mas_top;
    
}

//- (void)viewDidAppear:(BOOL)animated {
//    [super viewDidAppear:animated];
//    if (@available(iOS 11.0, *)){
//        if (self.navigationController.isNavigationBarHidden) {
//            self.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
//        }
////        [[UITableView appearance] setEstimatedRowHeight:0];
////        [[UITableView appearance] setEstimatedSectionFooterHeight:0];
////        [[UITableView appearance] setEstimatedSectionHeaderHeight:0];
//    }
//}

-(MASViewAttribute *)_p00ButtonTopView:(MASViewAttribute *)viewBottomAttribute title:(NSString *)title handler:(void(^)(void))handler {
    if (title.length==0) {
        title = @"title";
    }
    UIButton *btn = [[UIButton alloc] init];
    [self.containerView addSubview:btn];
    btn.backgroundColor = UIColor.blueColor;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(viewBottomAttribute).mas_equalTo(20);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(500);
    }];
    /// 按钮事件
    [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(UIButton *x) {
        if (handler) {
            handler();
        }
    }];
    viewBottomAttribute =  btn.mas_bottom;
    return viewBottomAttribute;
}


-(void )_buttonTitle:(NSString *)title handler:(void(^)(UIButton *btn))handler {
    if (title.length==0) {
        title = @"title";
    }
    UIButton *btn = [[UIButton alloc] init];
    [self.containerView addSubview:btn];
    btn.backgroundColor = UIColor.blueColor;
    [btn setTitle:title forState:UIControlStateNormal];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bottomAttribute).mas_equalTo(20);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
    }];
    /// 按钮事件
    [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(UIButton *x) {
        if (handler) {
            handler(btn);
        }
    }];
    self.bottomAttribute =  btn.mas_bottom;
}

-(void )_titlelabel:(NSString *)title {
    
    UILabel *label = UILabel.alloc.init;
    [self.containerView addSubview:label];
    label.numberOfLines  = 0;    label.backgroundColor = UIColor.blackColor;
    label.textColor = UIColor.whiteColor;
    label.text = title;
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bottomAttribute).mas_equalTo(20);
        make.centerX.mas_equalTo(0);
        make.left.mas_greaterThanOrEqualTo(5);
        make.right.mas_lessThanOrEqualTo(-5);
    }];
    self.bottomAttribute =  label.mas_bottom;
}

-(void)_loadConstraintsWithView:(UIView *)aView {
    [self.containerView addSubview:aView];
    [aView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bottomAttribute).mas_equalTo(20);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
    }];
    self.bottomAttribute =  aView.mas_bottom;
}

-(void)_loadCenterXWithView:(UIView *)aView size:(CGSize )size {
    [self.containerView addSubview:aView];
    [aView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bottomAttribute).mas_equalTo(20);
        make.centerX.mas_equalTo(0);
        make.size.mas_equalTo(size);
    }];
    self.bottomAttribute =  aView.mas_bottom;
}

-(void )_p01ButtonTitle:(NSString *)title handler:(void(^)(UIButton *btn))handler {
    if (title.length==0) {
        title = @"title";
    }
    UIButton *btn = [[UIButton alloc] init];
    [self.containerView addSubview:btn];
    btn.backgroundColor = UIColor.blueColor;
    [btn setTitle:title forState:UIControlStateNormal];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bottomAttribute).mas_equalTo(20);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
    }];
    /// 按钮事件
    [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(UIButton *x) {
        if (handler) {
            handler(btn);
        }
    }];
    self.bottomAttribute =  btn.mas_bottom;
}


-(void)_lastLoadBottomAttribute {
    
    // 这里放最后一个view的底部
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bottomAttribute).mas_equalTo(100);
    }];
}

@end
