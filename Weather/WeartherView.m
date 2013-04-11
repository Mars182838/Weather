//
//  weartherView.m
//  Weather
//
//  Created by Mars on 13-4-10.
//  Copyright (c) 2013年 Mars. All rights reserved.
//

#import "WeartherView.h"

#define WIDTH self.frame.size.width

@implementation WeartherView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        ///  城市名字
        _cityLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 30)];
        _cityLabel.backgroundColor = [UIColor blueColor];
        _cityLabel.font = [UIFont systemFontOfSize:25.0f];
        _cityLabel.textColor = [UIColor whiteColor];
        [self addSubview:_cityLabel];
        
        /// weatherImage 天气图片
        _weatherImage = [[UIImageView alloc] initWithFrame:CGRectMake(130, 50, 60, 40)];
        _weatherImage.image = [UIImage imageNamed:@"sunny.png"];
        [self addSubview:_weatherImage];
        
        /// weatherlabel 天气情况
        _weatherlabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, WIDTH, 30)];
        _weatherlabel.textAlignment = NSTextAlignmentCenter;
        _weatherlabel.backgroundColor = [UIColor clearColor];
        _weatherlabel.font = [UIFont systemFontOfSize:18.0f];
        _weatherlabel.textColor = [UIColor whiteColor];

        [self addSubview:_weatherlabel];
        
        /// tempLabel 温度情况
        _tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 130, WIDTH, 30)];
        _tempLabel.backgroundColor = [UIColor clearColor];
        _tempLabel.font = [UIFont systemFontOfSize:18.0f];
        _tempLabel.textAlignment = NSTextAlignmentCenter;
        _tempLabel.textColor = [UIColor whiteColor];

        [self addSubview:_tempLabel];
        
        /// wdlabel 风向情况
        _wdLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 160, WIDTH, 30)];
        _wdLabel.backgroundColor = [UIColor clearColor];
        _wdLabel.textAlignment = NSTextAlignmentCenter;
        _wdLabel.font = [UIFont systemFontOfSize:18.0f];
        _wdLabel.textColor = [UIColor whiteColor];

        [self addSubview:_wdLabel];
        
        /// indexLabel 提示信息
        _indexLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 200, WIDTH, 100)];
        _indexLabel.backgroundColor = [UIColor clearColor];
        _indexLabel.font = [UIFont systemFontOfSize:18.0f];
        _indexLabel.contentMode = NSLineBreakByCharWrapping;
        _indexLabel.numberOfLines = 0;
        _indexLabel.textColor = [UIColor whiteColor];

        [self addSubview:_indexLabel];
        
    }
    
    return self;
}

@end
