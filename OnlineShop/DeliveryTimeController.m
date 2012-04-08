//
//  DeliveryTimeController.m
//  OnlineShop
//
//  Created by 瑞鹏 马 on 12-4-9.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import "DeliveryTimeController.h"

@interface DeliveryTimeController ()

@end

@implementation DeliveryTimeController

- (void) dealloc
{
    
    [detailTableView release];
    [super dealloc];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationItem.rightBarButtonItem = BARBUTTON(@"提交订单",@selector(commitOrder));
        
        detailTableView = [[TGTableView alloc] initWithFrame:RECT_TABBAR_NAVIGATIONBAR_STATUS style:UITableViewStyleGrouped];
        detailTableView.dataSource = self;
        detailTableView.delegate = self;
        [self.view addSubview:detailTableView];
        
        
    }
    return self;
}

#pragma mark --
#pragma mark  read data
- (void) readData:(int)index
{
    dataArray = [DELIVERY_TIME_ARRAY retain];
    
}

#pragma mark --
#pragma mark  tableView datasource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * indentifier = @"cell";
    TGTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (!cell) {
        cell = [[TGTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
        cell.textLabel.font = [UIFont systemFontOfSize:15];
    }
    if (indexPath.row == [[NSUserDefaults standardUserDefaults] integerForKey:DELIVERY_TIME_ID_KEY]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    cell.textLabel.font = [UIFont systemFontOfSize:11];
    cell.textLabel.lineBreakMode = UILineBreakModeWordWrap;
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.text = [dataArray objectAtIndex:indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}



#pragma mark  tableview delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[NSUserDefaults standardUserDefaults] setInteger:indexPath.row forKey:DELIVERY_TIME_ID_KEY];
    [detailTableView reloadData];
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_REFRESH_DELIVERY_TIME object:nil];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int height = 40;
    
    
    if (0 == indexPath.section) {
        if (0 == indexPath.row) {
            height = 40;
        }
        else if(1 == indexPath.row)
        {
            height = 40;
        }
        else if(2 == indexPath.row)
        {
            height = 70;
        }
        else if(3 == indexPath.row)
        {
            height = 80;
        }
    }
    return height;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
