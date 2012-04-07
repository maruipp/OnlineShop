//
//  SettlementCenterController.h
//  OnlineShop
//
//  Created by 瑞鹏 马 on 12-4-7.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import "TGViewController.h"

@interface SettlementCenterController : TGViewController<UITableViewDataSource,UITableViewDelegate>
{
    TGTableView * detailTableView;
}
@end
