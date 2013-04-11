//
//  WeartherNetWork.m
//  Weather
//
//  Created by Mars on 13-4-10.
//  Copyright (c) 2013年 Mars. All rights reserved.
//

#import "WeartherNetWork.h"

#define URL @"http://m.weather.com.cn/data/"

@implementation WeartherNetWork

static WeartherNetWork *instance = nil;

/** 懒汉式单利*/
+(WeartherNetWork *)shareInstance
{
    @synchronized([WeartherNetWork class]){
    
        if (instance == nil) {
            
            instance = [[WeartherNetWork alloc] init];
            
        }
    }
    
    return instance;
}

-(id)init
{
    if (self = [super init]) {
        
        _urlArray = [[NSMutableArray alloc] init];
        [_urlArray addObject:[self weartherURLWithString:@"101010100.html"]];///>北京
        [_urlArray addObject:[self weartherURLWithString:@"101020100.html"]];///>上海
        [_urlArray addObject:[self weartherURLWithString:@"101280101.html"]];///>广州
        [_urlArray addObject:[self weartherURLWithString:@"101280601.html"]];///>深圳

       _queue = [[[NSOperationQueue alloc] init] autorelease];
        
        for (NSURL *url in _urlArray) {
            
            ASIHTTPRequest * request = [ASIHTTPRequest requestWithURL:url];
            request.delegate = self;
            
            [_queue addOperation:request];
        }
    }
    
    return self;
}

-(NSURL *)weartherURLWithString:(NSString *)urlString
{
    NSString *string = [NSString stringWithFormat:@"%@%@",URL,urlString];
    NSURL *url = [NSURL URLWithString:string];
    
    return url;
}

-(void)requestFinished:(ASIHTTPRequest *)request
{
    NSString *responseString = [request responseString];
    
    NSMutableDictionary *dic = [responseString JSONValue];
    
    [_delegate addWeatherResource:[self getModelMessage:[dic objectForKey:@"weatherinfo"]]];
}

-(WeartherMessage *)getModelMessage:(NSMutableDictionary *)array
{
    _message = [[WeartherMessage alloc] init];
    
    _message.cityPlace = [array objectForKey:@"city"];
    _message.weather = [array objectForKey:@"weather1"];
    _message.temperature = [array objectForKey:@"temp1"];
    _message.wind = [array objectForKey:@"wind1"];
    _message.index = [array objectForKey:@"index_d"];
    _message.update = [array objectForKey:@"date_y"];
    
    return _message;
}

-(void)dealloc
{
    [_urlArray release];
    [super dealloc];
}

@end
