//
//  WeatherViewController.m
//  Weather
//
//  Created by Mars on 13-4-10.
//  Copyright (c) 2013年 Mars. All rights reserved.
//

#import "WeatherViewController.h"
#import "WeartherNetWork.h"

#define Width  self.view.frame.size.width

#define Height self.view.frame.size.height

#define View_Height 320

#define Number 4

@interface WeatherViewController ()

@end

@implementation WeatherViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.title = @"天气通";
        
        _colorArray = [[NSArray alloc] initWithObjects:[UIColor blueColor],[UIColor brownColor],[UIColor greenColor],[UIColor orangeColor], nil];
        
        _retainArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bj.jpg"]];
    
    /// 实时更新数据
    UIBarButtonItem *rightBut = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(getNetWorkSource)];
    self.navigationItem.rightBarButtonItem = rightBut;
    [rightBut release];
    
    _dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, Width, 30)];
    _dateLabel.font = [UIFont systemFontOfSize:15.0f];
    _dateLabel.textAlignment = NSTextAlignmentRight;
    _dateLabel.backgroundColor = [UIColor clearColor];
    _dateLabel.textColor = [UIColor whiteColor];
    _dateLabel.text = @"更新时间: 2012-04-04 15:20";
    [self.view addSubview:_dateLabel];
    
    [self getNetWorkSource];
    
    [self initScrollView];

}

#pragma mark - WeartherNetWork Delegate

/** 获取网络数据 */
-(void)getNetWorkSource
{
    _netWork = [WeartherNetWork shareInstance];
    _netWork.delegate = self;
}

/** 添加model到数据库 */
-(void)addWeatherResource:(WeartherMessage *)model
{
    sqlService *service = [[sqlService alloc] init];
    [service insertWeatherModel:model];
    
    self.retainArray = [service getWeatherInfo];///>获取数据库中的数据
    [_scrollView removeFromSuperview];
    
    [self initScrollView];
    
    [service release];

}

/** 更新数据库中的model*/

-(void)upWeatherResource:(WeartherMessage *)model
{
    sqlService *service = [[sqlService alloc] init];
    [service updateWeatherModel:model];
    
    self.retainArray = [service getWeatherInfo];
    
    [_scrollView removeFromSuperview];
    
    [self initScrollView];
    [service release];
}

#pragma mark - LoadView ScrollView
-(void)initScrollView
{
    WeartherMessage *message = [[[WeartherMessage alloc] init] autorelease];

    sqlService *service = [[sqlService alloc] init];
    
    self.retainArray = [service getWeatherInfo];///>读取数据库中的数据
    int number = self.retainArray.count;
    if (self.retainArray.count > 0 && self.retainArray.count > 4) {
        
        number = 4;
    }
    [service release];

    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 30, Width, Height)];
    _scrollView.contentSize = CGSizeMake(Width, number*View_Height);
    
    for (int i = 0; i < number ; i++) {
    
        _weartherView = [[WeartherView alloc] initWithFrame:CGRectMake(0, i*View_Height, Width, View_Height)];
        
        _weartherView.cityLabel.backgroundColor = [_colorArray objectAtIndex:i];
        
        message = [self.retainArray objectAtIndex:i];
        _weartherView.cityLabel.text = message.cityPlace;
        _weartherView.weatherlabel.text = message.weather;
        _weartherView.tempLabel.text = message.temperature;
        _weartherView.indexLabel.text = message.index;
        _weartherView.wdLabel.text = message.wind;
       
         _dateLabel.text = [NSString stringWithFormat:@"更新时间：%@",message.update];
        
        /// 检测关键字是否含有多云
        NSRange range = [message.weather rangeOfString:@"多云" options:NSCaseInsensitiveSearch];
        
        /// 检测关键字是否含有雨
        NSRange rainRange = [message.weather rangeOfString:@"雨" options:NSCaseInsensitiveSearch];
        
        if ([message.weather isEqualToString:@"晴"]) {
            
            _weartherView.weatherImage.image = [UIImage imageNamed:@"sunny.png"];
        }
        else if (range.length > 0){
            
             _weartherView.weatherImage.image = [UIImage imageNamed:@"partly_cloudy.png"];
            
        }
        else if (rainRange.length > 0)
        {
             _weartherView.weatherImage.image = [UIImage imageNamed:@"rain.png"];
        }
        else{
        
             _weartherView.weatherImage.image = [UIImage imageNamed:@"sunny.png"];
        }
        
        [_scrollView addSubview:_weartherView];
        
    }
    [self.view addSubview:_scrollView];
}

-(void)dealloc
{
    [_colorArray   release];
    [_scrollView   release];
    [_dateLabel    release];
    [_weartherView release];
    [_retainArray  release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
