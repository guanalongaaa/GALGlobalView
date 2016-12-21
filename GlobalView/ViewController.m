//
//  ViewController.m
//  GlobalView
//
//  Created by love on 2016/12/21.
//  Copyright © 2016年 love. All rights reserved.
//

#import "ViewController.h"

#import "GlobalView.h"//单例全局滑动按钮
#import "PopoverView.h" //点击弹出框

@interface ViewController ()
{
    UISwitch * Gswitch; //开关
}

@property (nonatomic, strong) GlobalView *globalView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor whiteColor];
    
    [self showUI];
    
    [self addGlobalView];
    
    //开关状态
    NSString *state = [[NSUserDefaults standardUserDefaults] objectForKey:@"SHOWLittleSWITCH"];
    if ([state isEqualToString:@"0"] || state == nil) {
        [Gswitch setOn:YES];
    }else{
        [Gswitch setOn:NO];
    }
    
}

//添加按钮
-(void)addGlobalView
{
    _globalView = [[GlobalView alloc] initWithFrame:CGRectMake(0, 0 , 50, 50)];
    _globalView.layer.cornerRadius = 25;
    
    //是否自动贴边
//    _globalView.isKeepBounds = YES;
    
    _globalView.imageView.image = [UIImage imageNamed:@"icon_weather"];
    [_globalView setBackgroundColor:[UIColor redColor]];
    //限定logoView的活动范围
    _globalView.center = self.view.center;
    
    
    __block ViewController *blockSelf = self;
    
    _globalView.ClickDragViewBlock = ^(WMDragView *dragView){
        
         [blockSelf showAnotherView];//显示弹出框
        
    };
    [self.view addSubview:_globalView];
    
    //是否显示
    NSString *state = [[NSUserDefaults standardUserDefaults] objectForKey:@"SHOWLittleSWITCH"];
    if ([state isEqualToString:@"0"] || state == nil) {
        _globalView.hidden = NO;
    }else{
        _globalView.hidden = YES;
    }

}


-(void)showAnotherView
{
    PopoverView *popoverView = [PopoverView popoverView];
    [popoverView showToView:_globalView withActions:[self QQActions]];
}


- (NSArray<PopoverAction *> *)QQActions {
    // 发起多人聊天 action
    PopoverAction *multichatAction = [PopoverAction actionWithImage:[UIImage imageNamed:@"right_menu_multichat"] title:@"发起多人聊天" handler:^(PopoverAction *action) {
#pragma mark - 该Block不会导致内存泄露, Block内代码无需刻意去设置弱引用.
        
        NSLog(@"发起多人聊天");
        
    }];
    // 加好友 action
    PopoverAction *addFriAction = [PopoverAction actionWithImage:[UIImage imageNamed:@"right_menu_addFri"] title:@"加好友" handler:^(PopoverAction *action) {
        
        NSLog(@"加好友");
    }];
    // 扫一扫 action
    PopoverAction *QRAction = [PopoverAction actionWithImage:[UIImage imageNamed:@"right_menu_QR"] title:@"扫一扫" handler:^(PopoverAction *action) {
        
        NSLog(@"扫一扫");
    }];
    // 面对面快传 action
    PopoverAction *facetofaceAction = [PopoverAction actionWithImage:[UIImage imageNamed:@"right_menu_facetoface"] title:@"面对面快传" handler:^(PopoverAction *action) {
        
        NSLog(@"面对面快传");
    }];
    // 付款 action
    PopoverAction *payMoneyAction = [PopoverAction actionWithImage:[UIImage imageNamed:@"right_menu_payMoney"] title:@"付款" handler:^(PopoverAction *action) {
        
        NSLog(@"付款");
    }];
    
    return @[multichatAction, addFriAction, QRAction, facetofaceAction, payMoneyAction];
}

//显示
-(void)showGlobalView
{
    _globalView.hidden = NO;
}
//隐藏
-(void)hideGlobalView
{
    _globalView.hidden = YES;
}



-(void)showUI
{
    //开关
    Gswitch = [[UISwitch alloc]initWithFrame:CGRectMake(0, 0, 60, 60)];
    [Gswitch addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventValueChanged];
    Gswitch.center = CGPointMake(self.view.center.x , self.view.center.y + 150);
    //提示
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
    label.center = CGPointMake(Gswitch.center.x, Gswitch.center.y + 30);
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"小功能开关";
    [label setFont:[UIFont systemFontOfSize:12]];
    
    [self.view addSubview:label];
    [self.view addSubview:Gswitch];
}

//UISwitch 点击事件
-(void)buttonAction:(UISwitch *)sender
{
    BOOL isshowG = sender.isOn;
    NSString * result = @"";
    
    if (isshowG) {
        result = @"0";
        [self showGlobalView];
    }else
    {
        result = @"1";
        [self hideGlobalView];
    }
    
    NSLog(@"%@",result);
    //保存状态
    [[NSUserDefaults standardUserDefaults] setObject:result forKey:@"SHOWLittleSWITCH"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
