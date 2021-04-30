//
//  _00BaseViewController.h
//  AXiOSKit
//
//  Created by 小星星吃KFC on 2020/12/8.
//  Copyright © 2020 axinger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>
#import <ReactiveObjC/ReactiveObjC.h>

NS_ASSUME_NONNULL_BEGIN

@interface AXBaseViewController : UIViewController

@property(nonatomic, strong) UIView *containerView;

@property (nonatomic, strong) MASViewAttribute *bottomAttribute;

-(void)_loadConstraintsWithView:(UIView *)aView;

-(void)_loadCenterXWithView:(UIView *)aView size:(CGSize )size;

-(void )_buttonTitle:(NSString *)title handler:(void(^)(UIButton *btn))handler;

-(void )_titlelabel:(NSString *)title;

/// 子约束最后调用一下
-(void)_lastLoadBottomAttribute;

@end

NS_ASSUME_NONNULL_END
