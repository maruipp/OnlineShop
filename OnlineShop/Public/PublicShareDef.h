//
//  PublicShareDef.h
//  OnlineShop
//
//  Created by 瑞鹏 马 on 12-3-27.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#ifndef OnlineShop_PublicShareDef_h
#define OnlineShop_PublicShareDef_h

//用户id
#define CUSTOMER_ID @"CUSTOMER_ID"
//用户名保存用的key
#define USERNAME_KEY @"GLOBAL_USERNAME"
//保存密码的key
#define PASSWORD_KEY @"GLOBAL_PASSWORD"
//由密码通过md5加密后生成的私有key保存用的key
#define PRIVATEKEY_KEY @"GLOBAL_PRIVATE_KEY"

//当前查看的产品类别id
#define CURRENT_PRODUCT_CATEGORY_ID_KEY @"CURRENT_PRODUCT_CATEGORY_ID_KEY"
//当前导航栏标题的key
#define CURRENT_NAVIGATIONITEM_TITLE_KEY @"CURRENT_NAVIGATIONITEM_TITLE_KEY"
//当前查看的公告的id的key
#define CURRENT_BULLETIN_ID_KEY @"CURRENT_BULLETIN_ID_KEY"
//当前查看的留言的id的key
#define CURRENT_MESSAGE_ID_KEY @"CURRENT_MESSAGE_ID_KEY"
//要转到的controller的title的key
#define CURRENT_CONTROLLER_TITLE_KEY @"CURRENT_CONTROLLER_TITLE_KEY"

//付款方式key
#define PAYMENT_ID_KEY @"GLOBAL_PAYMENT_ID_KEY"

//付款方式（选项）
#define PAYMENT_ARRAY [NSMutableArray arrayWithObjects:@"现金支付（货到付款）",@"pos机刷卡（货到付款）",@"支付宝",nil]
//付款方式更新后发出消息通知父controller刷新
#define NOTIFICATION_REFRESH_PAYMENT @"NOTIFICATION_REFRESH_PAYMENT"


//送货时间key
#define DELIVERY_TIME_ID_KEY @"DELIVERY_TIME_ID_KEY"
//送货时间（选项）
#define DELIVERY_TIME_ARRAY [NSMutableArray arrayWithObjects:@"工作日、双休日与假日均可送货",@"只双休日、假日送货（工作日不用送）",@"只工作日送货（双休日、假日不用送）\n（注：写字楼／商用地址客户请选择）",@"学校地址／地址白天没人，请尽量安排其它时间送货（注：特别安排可能超出预计送货天数）",nil]
//送货时间更新后发出消息通知父controller刷新
#define NOTIFICATION_REFRESH_DELIVERY_TIME @"NOTIFICATION_REFRESH_DELIVERY_TIME"


//获取用户名
#define USERNAME   [[NSUserDefaults standardUserDefaults] objectForKey:USERNAME_KEY]
//获取密码
#define PASSWORD   [[NSUserDefaults standardUserDefaults] objectForKey:PASSWORD_KEY]
//获取私有key
#define PRIVATEKEY [[NSUserDefaults standardUserDefaults] objectForKey:PRIVATEKEY_KEY]


//导航栏button
#define BARBUTTON(TITLE, SELECTOR) [[[UIBarButtonItem alloc] initWithTitle:TITLE style:UIBarButtonItemStyleBordered target:self action:SELECTOR] autorelease]
#define PAGECONTROLLER(CONTROLLER) [[[NSClassFromString(CONTROLLER) alloc] initWithNibName:nil bundle:nil] autorelease]

//消息中心
#define NOTIFICATION_TO_SETTLEMENT_CENTER @"NOTIFICATION_TO_SETTLEMENT_CENTER"
#define NOTIFICATION_LOGIN_BUTTON_DOWN @"NOTIFICATION_LOGIN_BUTTON_DOWN"
#define NOTIFICATION_LOGIN_SUCCESS @"NOTIFICATION_LOGIN_SUCCESS"

#define NOTIFICATION_HOME_TO_NEXT_PAGE @"NOTIFICATION_HOME_TO_NEXT_PAGE"
#define NOTIFICATION_SHOW_TABBAR                        @"GLOBAL_SHOW_TABBAR"
#define NOTIFICATION_HIDE_TABBAR                        @"GLOBAL_HIDE_TABBAR"

#define NOTIFICATION_HIDE_KEYBOARD_IN_LOGINVIEW @"NOTIFICATION_HIDE_KEYBOARD_IN_LOGINVIEW"
//菜单数据
#define MENU_DICTIONARY [NSMutableDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Menu.plist" ofType:nil]]
#define List_ITEM_CONFIG [NSMutableDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Menu.plist" ofType:nil]]

//list数据  
#define PLIST_CONFIGS [NSMutableDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Configs.plist" ofType:nil]]


//除去navigationbar、tabbar、状态条后剩下的view的frame
#define RECT_TABBAR_NAVIGATIONBAR_STATUS CGRectMake(0, 0, 320, 367)
#endif
