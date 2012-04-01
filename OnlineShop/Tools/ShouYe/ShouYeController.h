//
//  ShouYeController.h
//  OnlineShop
//
//  Created by 瑞鹏 马 on 12-3-27.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageScrollView.h"
#import "PublicShareDef.h"
@interface ShouYeController : TGModuleHomeController <UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
{
    ImageScrollView * detailScrollView;
    UITableView * detailTableView;
    NSMutableArray * dataArray;
}
- (void) readData;
@end
