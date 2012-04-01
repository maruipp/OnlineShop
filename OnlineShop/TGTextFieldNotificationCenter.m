//
//  TGTextFieldNotificationCenter.m
//  ZhongKeBeiRuanIpad
//
//  Created by 瑞鹏 马 on 12-3-31.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import "TGTextFieldNotificationCenter.h"
static TGTextFieldNotificationCenter * instance = nil;
@implementation TGTextFieldNotificationCenter

- (void) dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [observerObjects release];
    [super dealloc];
}

- (id) init
{
    if (self = [super init]) {
        keyboardShow = NO;
        [self addNotification];

    }
    return self;
}
+ (id) defaultCenter
{
    if (!instance) {
        instance = [[TGTextFieldNotificationCenter alloc] init];
                
    }
    return instance;
}

- (void) addNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification 
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification 
                                               object:nil];
}
- (void) addObserverObject:(TGTextField *) obj
{
    if ( nil == observerObjects) {
        observerObjects = [[NSMutableArray alloc] init];
    }
    [observerObjects addObject:obj];
}

- (void) removeObserverObject:(TGTextField *) obj
{
    [observerObjects removeObject:obj];
}

#pragma mark - find current active TextField
- (BOOL) findActiveTextField
{
    BOOL found = NO;
    for (TGTextField * tf in observerObjects) {
        if ([tf isFirstResponder]) {
            activeTextField = tf;
            found = YES;
            break;
        }
    }
    return found;
}
#pragma mark -
#pragma mark        compare rect of keyboard and rect of self
- (float) getRelativeDistance:(CGRect) keyboardBound
{
    UIWindow *window = [[[UIApplication sharedApplication] windows] objectAtIndex:0];
    CGRect  keyboradRect = [activeTextField.superview convertRect:keyboardBound fromView:window];
    CGRect myRect = activeTextField.frame;
    float distance = 0;
    distance = keyboradRect.origin.y - myRect.origin.y - myRect.size.height;
    return distance;
}
#pragma mark        move super view certain distance vertically
- (CGRect) moveSuperview:(float) dis
{
    CGRect rect = activeTextField.superview.frame;
    CGPoint pos = rect.origin;
    dis += 50;
    pos.y -= dis;
    rect.origin = pos;
    CLog(@"superview frame is %@", NSStringFromCGRect(rect));
    return rect;
}
#pragma mark        keyboard Methods
-(void) keyboardWillShow:(NSNotification *)note
{
    
    //[publishView becomeFirstResponder];
    // get keyboard size and loctaion
    if (![self findActiveTextField]) {
        return;
    }
    
    
    if (!keyboardShow) {
        superViewRect = activeTextField.superview.frame;
    }
    keyboardShow = YES;
    CGRect keyboardBounds;
    [[note.userInfo valueForKey:UIKeyboardFrameEndUserInfoKey] getValue: &keyboardBounds];
    CLog(@"keyboard frame is %@", NSStringFromCGRect(keyboardBounds));
    NSNumber *duration = [note.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [note.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    float dis = [self getRelativeDistance:keyboardBounds];
    if (dis >= 0) {
        return;
    }
    CGRect frame = [self moveSuperview:-dis];
    //    
    // animations settings
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.25];
    //CLog(@"[duration doubleValue]::%lf", [duration doubleValue]);
    //loginView.frame   =   CGRectMake(0, -160, 320, 460);
    activeTextField.superview.frame = frame;
    //[self.superview addSubview:publishView];
    // commit animations
    [UIView commitAnimations];
    
}

-(void) keyboardWillHide:(NSNotification *)note{
    keyboardShow = NO;
    if (![self findActiveTextField]) {
        return;
    }
    
    NSNumber *duration = [note.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [note.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    
    // animations settings
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:[duration doubleValue]];
    
    activeTextField.superview.frame = superViewRect;
    // commit animations
    [UIView commitAnimations];
    
}

@end
