//
//  DataBase.h
//  DataBaseTest
//
//  Created by 瑞鹏 马 on 12-3-12.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
@interface DataBase : NSObject
{
    NSString * databaseName;
    NSString * tableName;
}

- (id) initWithDbName:(NSString *)dbName;

- (BOOL) insert:(NSString *) sql;
- (BOOL) deleteRecord:(NSString *) sql;
- (NSArray *) select:(NSString *) sql;
- (NSNumber *) count:(NSString *)sql;
@end
