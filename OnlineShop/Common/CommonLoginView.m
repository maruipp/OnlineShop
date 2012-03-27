//
//  CommonLoginView.m
//  ZhongKeBeiRuan
//
//  Created by 瑞鹏 马 on 12-2-29.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import "CommonLoginView.h"

@implementation CommonLoginView

@synthesize username = _username;
@synthesize password = _password;

-(void) dealloc
{
    [_username release];
    [_password release];
    [userLabel release];
    [pwdLabel  release];
    [super dealloc];
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        userLabel = [[UILabel alloc] init];
        userLabel.textAlignment = UITextAlignmentRight;
        userLabel.backgroundColor = [UIColor clearColor];
        userLabel.text = @"账户:";
        [self addSubview:userLabel];
        
        pwdLabel = [[UILabel alloc] init];
        pwdLabel.textAlignment = UITextAlignmentRight;
        pwdLabel.backgroundColor = [UIColor clearColor];
        pwdLabel.text = @"密码:";
        [self addSubview:pwdLabel]; 
        
        _username = [[UITextField alloc] init];
        _username.delegate = self;
        _username.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        _username.backgroundColor=[UIColor clearColor];
        _username.borderStyle = UITextBorderStyleRoundedRect;
        [self addSubview:_username];
        
        _password = [[UITextField alloc] init];
        _password.delegate = self;
        _password.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        _password.secureTextEntry = YES;
        _password.backgroundColor = [UIColor clearColor];
        _password.borderStyle = UITextBorderStyleRoundedRect;
        [self addSubview:_password];
        
        loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [loginBtn setImage:[UIImage imageNamed:@"button_login.png"] forState:UIControlStateNormal];
        loginBtn.frame = CGRectMake(80, 120, 160, 30);
        [loginBtn addTarget:self action:@selector(loginButtonDown) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:loginBtn];
        
        //_username.backgroundColor = [UIColor yellowColor];
        //_password.backgroundColor = [UIColor yellowColor];
//        _username.background = [UIImage imageNamed:@"loading_bg.9.png"];
//        _password.background = [UIImage imageNamed:@"loading_bg.9.png"];
    }
    return self;
}

- (void) setRatio:(float)ratio
{
    float width = 320 * ratio;
    userLabel.frame = CGRectMake(0, 20, width, 30);
    pwdLabel.frame  = CGRectMake(0, 70, width, 30);
    
    _username.frame = CGRectMake(width+30, 20, 150, 30);
    _password.frame = CGRectMake(width+30, 70,150, 30);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([_username isFirstResponder]) {
        [_username resignFirstResponder];
    }
    if ([_password isFirstResponder]) {
        [_password resignFirstResponder];
    }
    return YES;
}

-(void) loginButtonDown
{
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_LOGIN_BUTTON_DOWN object:nil];
}

@end
