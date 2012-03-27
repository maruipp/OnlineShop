//
//  NSString+NSString_MD5.m
//  ZhongKeBeiRuan
//
//  Created by 瑞鹏 马 on 12-3-9.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import "NSString+NSString_MD5.h"


@implementation NSString (NSString_MD5) 
-(NSString *)createMD5
{
    const char*cStr =[self UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, strlen(cStr), result);
    return[NSString stringWithFormat:
           @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
           result[0], result[1], result[2], result[3],
           result[4], result[5], result[6], result[7],
           result[8], result[9], result[10], result[11],
           result[12], result[13], result[14], result[15]
           ];
}
@end
