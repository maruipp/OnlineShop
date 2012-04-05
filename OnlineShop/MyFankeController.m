//
//  MyFankeController.m
//  OnlineShop
//
//  Created by 瑞鹏 马 on 12-3-28.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import "MyFankeController.h"

@implementation MyFankeController

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
        self.navigationItem.leftBarButtonItem = BARBUTTON(@"取消",@selector(cancel));
        self.navigationItem.rightBarButtonItem = BARBUTTON(@"登录",@selector(login));
        detailTableView = [[TGTableView alloc] initWithFrame:CGRectMake(0, 0, 320, 367) style:UITableViewStyleGrouped];
        detailTableView.dataSource = self;
        detailTableView.delegate = self;
        [self.view addSubview:detailTableView];
    }
    return self;
}

- (void) cancel
{
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HIDE_KEYBOARD_IN_LOGINVIEW object:nil];
}

- (void) login
{
    
}
//- (void) readData:(int) index
//{
//    if (!dataArray) {
//        [dataArray release];
//        dataArray = nil;
//    }
//    dataArray = [[NSMutableArray alloc] init];
//    [super readData:index];
//    NSMutableDictionary * dic = [[NSMutableDictionary alloc] init];
//    for (int i = 0; i < 10; i++) {
//        [dic removeAllObjects];
//        [dic setObject:@"IMG_0395.PNG" forKey:@"imageurl"];
//        [dic setObject:[NSNumber numberWithInt:12] forKey:@"id"];
//        [dic setObject:[NSNumber numberWithInt:199] forKey:@"price"];
//        [dataArray addObject:dic];
//    }
//    [dic release];
//    
//}
//
//-(void)getReturnValue:(MRPNetwork *)sender obj:(NSDictionary *)obj
//{
//    [super getReturnValue:sender obj:obj];
//    
//}

#pragma mark --
#pragma mark  tableView datasource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * indentifier = @"cell";
    if (0 == indexPath.section) {
        indentifier = @"CommonLoginTableViewCell";
        CommonLoginTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
        if (!cell) {
            cell = [[[CommonLoginTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier] autorelease];
        }
        //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.sideLabel.textAlignment = UITextAlignmentLeft;
        if (0 == indexPath.row) {
            cell.sideLabel.text = @"用户名:";
            [cell setPlaceholder:@"请输入邮箱/手机号"];
            [cell.textField becomeFirstResponder];
        }
        else if(1 == indexPath.row){
            cell.sideLabel.text = @"密码:";
            [cell setPlaceholder:@"请输入密码"];
        }
        cell.indentationLevel = 2;
        return cell;
    }
    else 
    {
        TGTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
        if (!cell) {
            cell = [[[TGTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier] autorelease];
        }
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        if (1 == indexPath.section) {
            cell.textLabel.text = @"使用新浪微博帐号登录";
        }
        else if(2 == indexPath.section)
        {
            cell.textLabel.text = @"注册新用户";
        }
        return cell;
    }
    //cell.textLabel.text = [dataArray objectAtIndex:indexPath.row];
    //[cell setDataDic:nil];
    return nil;//cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int rows = 0;
    switch (section) {
        case 0:
            rows = 2;
            break;
        case 1:
            rows = 1;
            break;
        case 2:
            rows = 1;
            break;
            
            
        default:
            break;
    }
    return rows;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

#pragma mark -
- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
