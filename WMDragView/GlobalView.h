//
//  GlobalView.h
//  gocom
//
//  Created by love on 2016/12/20.
//  Copyright © 2016年 gocomtech. All rights reserved.
//

#import "WMDragView.h"

@interface GlobalView : WMDragView


+(instancetype)shareGlobalView;

-(void)showGlobalView;

-(void)hideGlobalView;

@property (nonatomic, assign) BOOL isshowAnother;

@end
