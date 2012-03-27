//
//  NSString+NSString_MD5.h
//  ZhongKeBeiRuan
//
//  Created by 瑞鹏 马 on 12-3-9.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef uint32_t CC_LONG;       /* 32 bit unsigned integer */
extern unsigned char *CC_MD5(const void *data, CC_LONG len, unsigned char *md)
__OSX_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_5_0);

@interface NSString (NSString_MD5)
-(NSString *)createMD5;
@end
