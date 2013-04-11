//
//  WeatherViewController.h
//  Weather
//
//  Created by Mars on 13-4-10.
//  Copyright (c) 2013年 Mars. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeartherView.h"
#import "sqlService.h"
#import "WeartherNetWork.h"

@interface WeatherViewController : UIViewController<WeatherNetWorkDelegate>

/// weartherView 主界面的View
@property (nonatomic, strong) WeartherView *weartherView;

/// dateLabel 更新的时间
@property (nonatomic, strong) UILabel *dateLabel;

@property (nonatomic, strong) UIScrollView *scrollView;

/// colorArray 字体的颜色数组
@property (nonatomic, strong) NSArray *colorArray;

/// netWork 网络数据下载类
@property (nonatomic, strong) WeartherNetWork *netWork;

/// 获取数据库中的数据
@property (nonatomic, strong) NSMutableArray *retainArray;

@end
