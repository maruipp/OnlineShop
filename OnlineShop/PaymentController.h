//
//  PaymentController.h
//  OnlineShop
//
//  Created by 瑞鹏 马 on 12-4-9.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import "TGViewController.h"

@interface PaymentController : TGViewController<UITableViewDataSource,UITableViewDelegate>
{
    TGTableView * detailTableView;
}


@end
