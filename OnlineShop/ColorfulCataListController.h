//
//  ColorfulCataListController.h
//  OnlineShop
//
//  Created by 瑞鹏 马 on 12-4-2.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColorfulCataListCell.h"
@interface ColorfulCataListController : TGViewController <UITableViewDataSource,UITableViewDelegate>
{
    UITableView * detailTableView;
    //NSMutableArray * dataArray;
}
@end
