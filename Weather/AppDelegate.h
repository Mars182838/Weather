//
//  AppDelegate.h
//  Weather
//
//  Created by Mars on 13-4-10.
//  Copyright (c) 2013年 Mars. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WeatherViewController;

///判断是不是第一次运行程序
#define IS_FIRST_RUN  @"isFirstRun"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/// weatherController 主界面控制器类
@property (strong, nonatomic) WeatherViewController *weatherController;

/// isFirstRun 是否是第一次运行
@property (nonatomic, assign) BOOL isFirstRun;

@end
