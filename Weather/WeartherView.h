//
//  weartherView.h
//  Weather
//
//  Created by Mars on 13-4-10.
//  Copyright (c) 2013年 Mars. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeartherView : UIView

/// weatherImage 天气图片 
@property (nonatomic, strong) UIImageView *weatherImage;

/// cityLabel 城市名字
@property (nonatomic, strong) UILabel *cityLabel;

/// weatherlabel 天气情况
@property (nonatomic, strong) UILabel *weatherlabel;

/// tempLabel 温度情况
@property (nonatomic, strong) UILabel *tempLabel;

/// wdlabel 风向情况
@property (nonatomic, strong) UILabel *wdLabel;

/// indexLabel 提示信息
@property (nonatomic, strong) UILabel *indexLabel;

@end
