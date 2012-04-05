//
//  MyFankeController.h
//  OnlineShop
//
//  Created by 瑞鹏 马 on 12-3-28.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import "TGViewController.h"
#import "CommonLoginTableViewCell.h"
@interface MyFankeController : TGModuleHomeController <UITableViewDataSource,UITableViewDelegate>
{
    TGTableView * detailTableView;
}
@end
