//
//  sqlService.m
//  Weather
//
//  Created by Mars on 13-4-10.
//  Copyright (c) 2013年 Mars. All rights reserved.
//

#import "sqlService.h"


@implementation sqlService

-(BOOL)insertWeatherModel:(WeartherMessage *)insertList
{
    
    sqlite3 *db = [DataBase openDB];
    
    sqlite3_stmt *stmt = nil;
    
    static char *sql = "insert into Weather(cityPlace,weather,temperature,wind,advise,date) values(?,?,?,?,?,?)";
    
    int success = sqlite3_prepare_v2(db, sql, -1, &stmt, NULL);
    
    if (success != SQLITE_OK) {
        
        NSLog(@"Error: failed to insert:weatherTable");
        
        [DataBase closeDB];
        return NO;
    }
    
    /** 这里的数字1，2，3代表第几个问号，这里将两个值绑定到两个绑定变量 */
    
    sqlite3_bind_text(stmt, 1, [insertList.cityPlace UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(stmt, 2, [insertList.weather UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(stmt, 3, [insertList.temperature UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(stmt, 4, [insertList.wind UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(stmt, 5, [insertList.index UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(stmt, 6, [insertList.update UTF8String], -1, SQLITE_TRANSIENT);
    /** 插入数据 */
    success = sqlite3_step(stmt);
    
    /** 释放 stmt*/
    sqlite3_finalize(stmt);
    if (success == SQLITE_ERROR) {
        
        NSLog(@"Error: failed to insert into the database with message.");
        
        /**关闭数据库*/
        [DataBase closeDB];
        return NO;
    }
    
    /**关闭数据库*/
    [DataBase closeDB];
    return YES;
}

-(NSMutableArray *) getWeatherInfo
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:1000];

    sqlite3 *db = [DataBase openDB];
    
    sqlite3_stmt *stmt = nil;
    static char *sql = "SELECT * FROM Weather";
    if (sqlite3_prepare_v2(db, sql, -1, &stmt, NULL) == SQLITE_OK) {
        
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            
            WeartherMessage *sqlList = [[WeartherMessage alloc] init];
            sqlList.cityPlace = [NSString stringWithUTF8String:(char *)sqlite3_column_text(stmt, 1)];
            sqlList.weather = [NSString stringWithUTF8String:(char *)sqlite3_column_text(stmt, 2)];
            sqlList.temperature = [NSString stringWithUTF8String:(char *)sqlite3_column_text(stmt, 3)];
            sqlList.wind = [NSString stringWithUTF8String:(char *)sqlite3_column_text(stmt, 4)];
            sqlList.index = [NSString stringWithUTF8String:(char *)sqlite3_column_text(stmt, 5)];
            sqlList.update = [NSString stringWithUTF8String:(char *)sqlite3_column_text(stmt, 6)];
            
            [array addObject:sqlList];
            [sqlList release];
        }
    }
    
    /** 释放数据 */
    sqlite3_finalize(stmt);
    /** 关闭数据库 */
    [DataBase closeDB];
    
    return array;
}

-(BOOL) updateWeatherModel:(WeartherMessage *)updateList
{
    sqlite3 *db = [DataBase openDB];
    sqlite3_stmt *stmt;
    
    static char *sql = "update Weather set weather = ?,temperature = ?,wind = ?,advise = ? ,date = ? where cityPlace = ?";
    
    /** 将SQL语句放入sqlite3_stmt中 */
    
    int success = sqlite3_prepare_v2(db, sql, -1, &stmt, NULL);
    if (success != SQLITE_OK) {
        NSLog(@"Error: failed to update:testTable");
        /** 关闭数据库 */
        [DataBase closeDB];
        return NO;
    }
    
    /** 这里的数字1，2，3代表第几个问号 */
    
    sqlite3_bind_text(stmt, 1, [updateList.weather UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(stmt, 2, [updateList.temperature UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(stmt, 3, [updateList.wind UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(stmt, 4, [updateList.index UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(stmt, 5, [updateList.update UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(stmt, 6, [updateList.cityPlace UTF8String], -1, SQLITE_TRANSIENT);
    
    /** 执行SQL语句， 这里更新数据库 */
    success = sqlite3_step(stmt);
    
    /** 释放stmt */
    sqlite3_finalize(stmt);
    
    /** 如果执行失败 */
    if (success == SQLITE_ERROR) {
        NSLog(@"Error: failed to update the database with message.");
        /** 关闭数据库 */
        [DataBase closeDB];
        return NO;
    }
    
    /**执行成功后依然要关闭数据库*/
    [DataBase closeDB];
    
    return YES;
}

@end
