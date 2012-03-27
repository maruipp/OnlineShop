//
//  JustifyRenturnValue.h
//  MIX
//
//  Created by  on 11-11-16.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSON.h"

@interface JustifyRenturnValue : NSObject{
    SBJsonParser *jsonParser;
    
}

-(BOOL)isPostOk:(NSString *)jsonString;
+(JustifyRenturnValue *)sharedInstance;
-(BOOL)isFirstLogin:(NSString *)jsonString;
-(void)getUserId:(NSString *)jsonString;
-(NSDictionary *)getUserDetailsDict:(NSString *)jsonString;

@end
