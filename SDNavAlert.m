





#import "SDNavAlert.h"

// 设备类型
#define IS_IPHONE         (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPAD           (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE_X ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )812 ) < DBL_EPSILON )
//判断iPHoneXr
#define IS_IPHONE_Xr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) && !IS_IPAD : NO)
//判断iPhoneXs
#define IS_IPHONE_Xs ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !IS_IPAD : NO)
//判断iPhoneXs Max
#define IS_IPHONE_Xs_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) && !IS_IPAD : NO)
//判断全面屏
#define IS_IPHONE_X_ALL (IS_IPHONE_X || IS_IPHONE_Xr || IS_IPHONE_Xs || IS_IPHONE_Xs_Max)
#define NAVIGATION_HEIGHT (IS_IPHONE_X_ALL ? 88.0 : 64.0)

@implementation SDNavAlert


+(void)showAlertText:(NSString *)text vc:(UIViewController *)vc{
    
    // 添加按钮
    UIButton *button = [[UIButton alloc] init];
    //插入navbar之下
    [vc.navigationController.view insertSubview:button belowSubview:vc.navigationController.navigationBar];
    //用户交互
    button.userInteractionEnabled = YES;
    //背景色
    button.backgroundColor = [UIColor orangeColor];
    //文字颜色
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //文字字号
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    //显示文字
    [button setTitle:text forState:UIControlStateNormal];

    
    // 设置button frame
    CGFloat buttonH = 32;
    CGFloat buttonX = 0;
    CGFloat buttonY = NAVIGATION_HEIGHT - buttonH;
    CGFloat buttonW = [UIScreen mainScreen].bounds.size.width;
    button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
    
    // 按钮移动动画
    [UIView animateWithDuration:0.4 animations:^{
        
        button.transform = CGAffineTransformMakeTranslation(0, buttonH);
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.4 delay:1 options:UIViewAnimationOptionCurveLinear animations:^{
            
            button.transform = CGAffineTransformIdentity;
            
        } completion:^(BOOL finished) {
            
            [button removeFromSuperview];
            
        }];
        
    }];
}


@end
