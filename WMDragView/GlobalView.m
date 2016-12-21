//
//  GlobalView.m
//  gocom
//
//  Created by love on 2016/12/20.
//  Copyright © 2016年 gocomtech. All rights reserved.
//

#import "GlobalView.h"

#import "PopoverView.h" //弹出框


@implementation GlobalView
{
     WMDragView *orangeView;
    
}



static GlobalView *globalView;

+(instancetype)shareGlobalView
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        globalView = [[GlobalView alloc] init];
    });
    return globalView;
}


-(void)showGlobalView
{
    
    self.isshowAnother = YES;

    globalView = [[GlobalView alloc] initWithFrame:CGRectMake(0, 0 , 50, 50)];
    globalView.layer.cornerRadius = 25;
    
    //是否自动贴边
//   globalView.isKeepBounds = YES;
    
    globalView.imageView.image = [UIImage imageNamed:@"icon_weather"];
    [globalView setBackgroundColor:[UIColor blackColor]];
    //限定logoView的活动范围
    globalView.center = CGPointMake(del.window.centerX + 130 , del.window.centerY + 130);
    globalView.ClickDragViewBlock = ^(WMDragView *dragView){
        
        if (self.isshowAnother == YES) {
             [self showAnotherView];
            
        }
        else
        {
            [self removefromView];
    
        }
        
    };
    [del.window addSubview:globalView];


}

-(void)showAnotherView
{
//    orangeView = [[WMDragView alloc] initWithFrame:CGRectMake(29, 64 , 200, 100)];
//    orangeView.button.titleLabel.font = [UIFont systemFontOfSize:15.0];
//    [orangeView.button setTitle:@"可拖曳" forState:UIControlStateNormal];
//    //12.20 是不是自动黏贴边界
//    orangeView.isKeepBounds = NO;
//    
//    orangeView.backgroundColor = [UIColor orangeColor];
//    
//    orangeView.center = CGPointMake(del.window.centerX, del.window.centerY - 120);
//    
//    orangeView.ClickDragViewBlock = ^(WMDragView *dragView){
//        NSLog(@"绿色view被点击了");
//        
//        dragView.dragEnable = !dragView.dragEnable;
//        if (dragView.dragEnable) {
//            [dragView.button setTitle:@"可拖曳" forState:UIControlStateNormal];
//        }else{
//            [dragView.button setTitle:@"不可拖曳" forState:UIControlStateNormal];
//        }
//        
//    };
//    
//    [del.window addSubview:orangeView];
//     self.isshowAnother = NO;
    
//    self.isshowAnother = NO;
    PopoverView *popoverView = [PopoverView popoverView];
    [popoverView showToView:globalView withActions:[self QQActions]];

    
    

}

-(void)removefromView
{
    //移除
//    [orangeView removeFromSuperview];
    self.isshowAnother = YES;
}


- (NSArray<PopoverAction *> *)QQActions {
    // 发起多人聊天 action
    PopoverAction *multichatAction = [PopoverAction actionWithImage:[UIImage imageNamed:@"right_menu_multichat"] title:@"发起多人聊天" handler:^(PopoverAction *action) {
#pragma mark - 该Block不会导致内存泄露, Block内代码无需刻意去设置弱引用.
       
    }];
    // 加好友 action
    PopoverAction *addFriAction = [PopoverAction actionWithImage:[UIImage imageNamed:@"right_menu_addFri"] title:@"加好友" handler:^(PopoverAction *action) {
        
    }];
    // 扫一扫 action
    PopoverAction *QRAction = [PopoverAction actionWithImage:[UIImage imageNamed:@"right_menu_QR"] title:@"扫一扫" handler:^(PopoverAction *action) {
        
    }];
    // 面对面快传 action
    PopoverAction *facetofaceAction = [PopoverAction actionWithImage:[UIImage imageNamed:@"right_menu_facetoface"] title:@"面对面快传" handler:^(PopoverAction *action) {
        
    }];
    // 付款 action
    PopoverAction *payMoneyAction = [PopoverAction actionWithImage:[UIImage imageNamed:@"right_menu_payMoney"] title:@"付款" handler:^(PopoverAction *action) {
        
    }];
    
    return @[multichatAction, addFriAction, QRAction, facetofaceAction, payMoneyAction];
}


-(void)hideGlobalView
{
    globalView.hidden = YES;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
