//
//  ClassificationController.h
//  OnlineShop
//
//  Created by 瑞鹏 马 on 12-3-28.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import "TGViewController.h"

@interface ClassificationController : TGModuleHomeController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView * detailTableView;
    NSMutableArray * dataArray;
}
- (void) readData;
@end
