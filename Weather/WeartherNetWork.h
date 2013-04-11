//
//  WeartherNetWork.h
//  Weather
//
//  Created by Mars on 13-4-10.
//  Copyright (c) 2013年 Mars. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeartherMessage.h"
#import "ASIHTTPRequest.h"
#import "sqlService.h"
#import "JSON.h"

#define IS_FIRST @"isFirst"

@protocol WeatherNetWorkDelegate <NSObject>

-(void)addWeatherResource:(WeartherMessage *)model;

-(void)upWeatherResource:(WeartherMessage *)model;

@end

@interface WeartherNetWork : NSObject<ASIHTTPRequestDelegate>
{
    BOOL isFirst;
}

+(WeartherNetWork *)shareInstance;

/// urlArray 请求的URL存放到数组
@property (nonatomic, copy) NSMutableArray *urlArray;

/// queue 创建队列
@property (nonatomic ,strong) NSOperationQueue *queue;

/// message 天气解析后数据存储类
@property (nonatomic, strong) WeartherMessage *message;

@property (nonatomic, assign) id<WeatherNetWorkDelegate> delegate;

/// 获取数据
-(WeartherMessage *)getModelMessage:(NSMutableDictionary *)array;

@end
