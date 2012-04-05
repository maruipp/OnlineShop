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

#endif
