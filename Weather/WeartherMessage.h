//
//  WeartherMessage.h
//  Weather
//
//  Created by Mars on 13-4-10.
//  Copyright (c) 2013年 Mars. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeartherMessage : NSObject

/// cityPlace 城市
@property (nonatomic, copy) NSString *cityPlace;

/// wearther 天气
@property (nonatomic, copy) NSString *weather;

/// temperature 温度
@property (nonatomic, copy) NSString *temperature;

/// wind 风向
@property (nonatomic, copy) NSString *wind;

/// index 温馨提示信息
@property (nonatomic, copy) NSString *index;

/// update 更新的时间
@property (nonatomic, copy) NSString *update;

@end
