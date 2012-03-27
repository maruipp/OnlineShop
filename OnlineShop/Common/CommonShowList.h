//
//  CommonShowList.h
//  ZhongKeBeiRuan
//
//  Created by 瑞鹏 马 on 12-3-4.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommonShowList : UIView
//configArray负责配置title，和其所对应的值的在dataDic中的key
//dataDic是服务器返回的数据字典
- (id) initWithConfig:(NSArray *) configArray andDic:(NSDictionary *) dataDic;
//设置位置
- (void) setPosition:(CGPoint) pos;
@end
