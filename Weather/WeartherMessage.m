//
//  WeartherMessage.m
//  Weather
//
//  Created by Mars on 13-4-10.
//  Copyright (c) 2013年 Mars. All rights reserved.
//

#import "WeartherMessage.h"

@implementation WeartherMessage

-(id)init
{
    _wind        = @"";
    _index       = @"";
    _cityPlace   = @"";
    _weather     = @"";
    _temperature = @"";
    _update      = @"";
   
    return self;
}

-(void)dealloc
{
    [_index       release];
    [_cityPlace   release];
    [_weather     release];
    [_wind        release];
    [_update      release];
    [_temperature release];
    
    [super dealloc];
}

@end
