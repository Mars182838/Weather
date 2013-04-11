//
//  sqlService.h
//  Weather
//
//  Created by Mars on 13-4-10.
//  Copyright (c) 2013年 Mars. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeartherMessage.h"
#import "DataBase.h"

@interface sqlService : NSObject

/// 插入数据
-(BOOL) insertWeatherModel:(WeartherMessage *)insertList;

/// 更新数据
-(BOOL) updateWeatherModel:(WeartherMessage *)updateList;

/// 获取全部数据
-(NSMutableArray*)getWeatherInfo;

@end
