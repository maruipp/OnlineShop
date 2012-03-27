//
//  DataBase.m
//  DataBaseTest
//
//  Created by 瑞鹏 马 on 12-3-12.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import "DataBase.h"

@implementation DataBase
- (void) dealloc
{
    [databaseName release];
    [super dealloc];
}
- (id) initWithDbName:(NSString *)dbName
{
    self = [super init];
    if (self) {
        databaseName = [dbName retain];
    }
    return self;
}

- (BOOL) insert:(NSString *) sql
{
    BOOL success;
    NSError *error;
    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray  *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:databaseName];
    success = [fm fileExistsAtPath:writableDBPath];
    if(!success){
        NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:databaseName];
        success = [fm copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
        if(!success){
            NSLog([error localizedDescription]);
        }
    }
    
    // 连接DB
    FMDatabase* db = [FMDatabase databaseWithPath:writableDBPath];
    if ([db open]) {
        [db setShouldCacheStatements:YES];
        
        // INSERT
        [db beginTransaction];
        //int i = 0;
//        while (i++ < 20) {
//            [db executeUpdate:@"INSERT INTO shoplist (name) values (?)" , [NSString stringWithFormat:@"number %d", i]];
//            if ([db hadError]) {
//                NSLog(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
//            }
//        }
        [db executeUpdate:sql];
        [db commit];
        
        
        [db close];
    }else{
        NSLog(@"Could not open db.");
    }
    
    return YES;
}
- (NSArray *) select:(NSString *) sql
{
    BOOL success;
    NSError *error;
    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray  *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"shopcar.db"];
    success = [fm fileExistsAtPath:writableDBPath];
    if(!success){
        NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"shopcar.db"];
        success = [fm copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
        if(!success){
            NSLog([error localizedDescription]);
        }
    }
    
    NSMutableArray * dataArray = [[NSMutableArray alloc] init];
    
    // 连接DB
    FMDatabase* db = [FMDatabase databaseWithPath:writableDBPath];
    if ([db open]) {
        [db setShouldCacheStatements:YES];
        
        
        
        // SELECT
        FMResultSet *rs = [db executeQuery:sql];
        while ([rs next]) {
            NSLog(@"%d %@", [rs intForColumn:@"productID"], [rs stringForColumn:@"name"]);
            NSMutableDictionary * dic = [[NSMutableDictionary alloc] init];
            int productID = [rs intForColumn:@"productID"];
            [dic setObject:[NSNumber numberWithInt:productID] forKey:@"productID"];
            int price = [rs intForColumn:@"price"];
            [dic setObject:[NSNumber numberWithInt:price] forKey:@"price"];
            int pv = [rs intForColumn:@"pv"];
            [dic setObject:[NSNumber numberWithInt:pv] forKey:@"pv"];
            NSString * name = [rs stringForColumn:@"name"];
            [dic setObject:name forKey:@"name"];
            [dataArray addObject:dic];
            [dic release];
        }
        [rs close];
        [db close];
    }else{
        NSLog(@"Could not open db.");
    }
    
    return dataArray;
}

- (NSNumber *) count:(NSString *)sql
{
    BOOL success;
    NSError *error;
    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray  *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"shopcar.db"];
    success = [fm fileExistsAtPath:writableDBPath];
    if(!success){
        NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"shopcar.db"];
        success = [fm copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
        if(!success){
            NSLog([error localizedDescription]);
        }
    }
    
    //NSMutableArray * dataArray = [[NSMutableArray alloc] init];
    int count = 0;
    // 连接DB
    FMDatabase* db = [FMDatabase databaseWithPath:writableDBPath];
    if ([db open]) {
        [db setShouldCacheStatements:YES];
        
        
        
        // SELECT
        FMResultSet *rs = [db executeQuery:sql];
        while ([rs next]) {
            count++;
        }
        [rs close];
        [db close];
    }else{
        NSLog(@"Could not open db.");
    }
    
    return [NSNumber numberWithInt:count];
}

- (BOOL) deleteRecord:(NSString *) sql
{
    return [self insert:sql];
}
@end
