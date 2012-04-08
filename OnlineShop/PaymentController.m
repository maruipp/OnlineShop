//
//  PaymentController.m
//  OnlineShop
//
//  Created by 瑞鹏 马 on 12-4-9.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import "PaymentController.h"

@interface PaymentController ()

@end

@implementation PaymentController

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
    dataArray = [PAYMENT_ARRAY retain];
    
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
    if (indexPath.row == [[NSUserDefaults standardUserDefaults] integerForKey:PAYMENT_ID_KEY]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    
    cell.textLabel.text = [dataArray objectAtIndex:indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString * title =  nil;
    
    title = @"支付方式";
    return title;
}

#pragma mark  tableview delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[NSUserDefaults standardUserDefaults] setInteger:indexPath.row forKey:PAYMENT_ID_KEY];
    [detailTableView reloadData];
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_REFRESH_PAYMENT object:nil];
}
#pragma mark -
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
