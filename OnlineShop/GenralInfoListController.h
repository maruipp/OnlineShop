//
//  GenralInfoListController.h
//  OnlineShop
//
//  Created by 瑞鹏 马 on 12-4-1.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GeneralInfoCell.h"
@interface GenralInfoListController : TGViewController <UITableViewDataSource,UITableViewDelegate>
{
    UITableView * detailTableView;
}
@end
