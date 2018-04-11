//
//  AppDelegate.m
//  WoLaiYe_IOS
//
//  Created by KouZhiKai on 16/5/30.
//  Copyright © 2016年 kzk. All rights reserved.
//


#import "AppDelegate.h"
#import "HomeViewController.h"
#import "EMSDK.h"
#import "ViewController.h"
#import "JPUSHService.h"
#import "jpushVC.h"
#import "Header.h"
#import "define.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AdSupport/AdSupport.h>
#import <AlipaySDK/AlipaySDK.h>
//友盟
#import "UMSocial.h"
#import "UMSocialQQHandler.h"
#import "UMSocialWechatHandler.h"

//极光appkey
static NSString *appKey = @"fce27365244715b2fd7fbc64";
static NSString *channel = @"Publish channel";

static BOOL isProduction = FALSE;

@interface AppDelegate ()<UIAlertViewDelegate>
{
        NSString*_couponsId;
        NSString*_noticeId;
        NSString*_type;
        CGFloat         _width;
        CGFloat         _height;
        
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    UINavigationController *NV = [[UINavigationController alloc]initWithRootViewController:[[ViewController alloc]init]];
    self.window.rootViewController = NV;
    
    
    
    [self registJPUSHWithOptions:(NSDictionary *)launchOptions];
    
    [self huanxinWithOptions:(NSDictionary *)launchOptions];
    
    [self UMWithOptions:(NSDictionary *)launchOptions];

    
    
    return YES;
}


#pragma mark 极光推送

-(void)registJPUSHWithOptions:(NSDictionary *)launchOptions{
    
    
    //注册通知
    
    //    NSString *advertisingId = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        //可以添加自定义categories
        [JPUSHService registerForRemoteNotificationTypes:(UIUserNotificationTypeBadge |
                                                          UIUserNotificationTypeSound |
                                                          UIUserNotificationTypeAlert)
                                              categories:nil];
    } else {
        //categories 必须为nil
        [JPUSHService registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge |
                                                          UIRemoteNotificationTypeSound |
                                                          UIRemoteNotificationTypeAlert)
                                              categories:nil];
    }
    
    //如不需要使用IDFA，advertisingIdentifier 可为nil
    [JPUSHService setupWithOption:launchOptions appKey:appKey
                          channel:channel
                 apsForProduction:isProduction
            advertisingIdentifier:nil];
    

}
#pragma mark 环信

-(void)huanxinWithOptions:(NSDictionary *)launchOptions{
    //    EMOptions *options = [EMOptions optionsWithAppkey:@"easemob-demo#chatdemoui"];
    
    EMOptions *options = [EMOptions optionsWithAppkey:@"1101#testrongyun"];
    options.apnsCertName = @"TestHuanXin";
    [[EMClient sharedClient] initializeSDKWithOptions:options];
    
    
    
    EMError *error = [[EMClient sharedClient] registerWithUsername:@"demolu090309" password:@"111111"];
    if (error==nil) {
        NSLog(@"注册成功");
    }else{
        NSLog(@"注册失败==%@",error.errorDescription);
        
    }
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        
        
        
        EMError *error1 = [[EMClient sharedClient] loginWithUsername:@"demolu090309" password:@"111111"];
        
        if (!error1) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                
                //                ChartVC *chatController = [[ChartVC alloc] initWithConversationChatter:@"denmolu" conversationType:EMConversationTypeChat];
                //
                //                chatController.title = @"denmolu";
                //
                //                [self.navigationController pushViewController:chatController animated:YES];
                NSLog(@"登录成功");
                
            });
            
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                
                NSLog(@"登录失败");
                
                
                
            });
            
        }
        
        
    });

}
#pragma mark 友盟

-(void)UMWithOptions:(NSDictionary *)launchOptions{
    
    [UMSocialData setAppKey:UMAPPKEY];
    
    [UMSocialQQHandler setQQWithAppId:@"1105475316" appKey:@"6Sg2kuhFSIfa5wcd" url:@"http://www.umeng.com/social"];
    [UMSocialWechatHandler setWXAppId:WXAppId appSecret:@"188ab0d286ffef5bb0dcc9cb9f868047" url:@"http://www.umeng.com/social"];
    

}


- (void)application:(UIApplication *)application didReceiveRemoteNotification:
(NSDictionary *)userInfo {
    // Required,For systems with less than or equal to iOS6
    [JPUSHService handleRemoteNotification:userInfo];
}

- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    /// Required -    DeviceToken
    [JPUSHService registerDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:
(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    // IOS 7 Support Required
    [JPUSHService handleRemoteNotification:userInfo];

    
    //调用震动
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    
    //调用声音
    AudioServicesPlaySystemSound(1007);
    
        NSLog(@"userInfo======%@======",userInfo);
    [UIApplication sharedApplication].applicationIconBadgeNumber=0;
    //UIApplication
    _type=[userInfo objectForKey:@"type"];
    _noticeId=[userInfo objectForKey:@"noticeId"];
    _couponsId=[userInfo objectForKey:@"couponsId"];
    
    NSString*string=[[userInfo objectForKey:@"aps"] objectForKey:@"alert"];
    
    
    UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"新消息" message:string delegate:self cancelButtonTitle:@"忽略" otherButtonTitles:@"查看", nil];
    [alert show];
    
    
    completionHandler(UIBackgroundFetchResultNewData);

    
    
}


-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [UIApplication sharedApplication].applicationIconBadgeNumber=0;
    if (buttonIndex==0) {
        
    }else
    {
        jpushVC*vc=[[jpushVC alloc]init];
        
        
        if ([_type intValue]==1) {
            vc.whoPush=@"coup";
//            vc.url=NOTICE_DETAIL(_couponsId);
            
        }else
        {
            vc.whoPush=@"noti";
//            vc.url=NOTICE_DETAIL(_noticeId);
            
        }
        
        [[self activityViewController] presentViewController:vc animated:YES completion:^{
            
        }];
    }
}
- (UIViewController *)activityViewController
{
    UIViewController* activityViewController = nil;
    
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    if(window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow *tmpWin in windows)
        {
            if(tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    NSArray *viewsArray = [window subviews];
    if([viewsArray count] > 0)
    {
        UIView *frontView = [viewsArray objectAtIndex:0];
        
        id nextResponder = [frontView nextResponder];
        
        if([nextResponder isKindOfClass:[UIViewController class]])
        {
            activityViewController = nextResponder;
        }
        else
        {
            activityViewController = window.rootViewController;
        }
    }
    
    return activityViewController;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
    [[EMClient sharedClient] applicationDidEnterBackground:application];

    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

//8.注册失败
- (void)application:(UIApplication *)app didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    NSLog(@"error --------------------------------------------------------------------------------------- %@",error);
    
}
- (void)applicationWillEnterForeground:(UIApplication *)application {
    [[EMClient sharedClient] applicationWillEnterForeground:application];
   
    [application setApplicationIconBadgeNumber:0];
    [application cancelAllLocalNotifications];

    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark 支付宝
// NOTE: 9.0以后使用新API接口
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options
{
    
    BOOL result = [UMSocialSnsService handleOpenURL:url];
    if (result == FALSE) {
        
        if ([url.host isEqualToString:@"safepay"]) {
            //跳转支付宝钱包进行支付，处理支付结果
            [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
                NSLog(@"result = %@",resultDic);
            }];
        }
        
    }else{
        return result;

    }


    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    
    //如果极简开发包不可用，会跳转支付宝钱包进行支付，需要将支付宝钱包的支付结果回传给开发包
    if ([url.host isEqualToString:@"safepay"]) {
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            //【由于在跳转支付宝客户端支付的过程中，商户app在后台很可能被系统kill了，所以pay接口的callback就会失效，请商户对standbyCallback返回的回调结果进行处理,就是在这个方法里面处理跟callback一样的逻辑】
            NSLog(@"result = %@",resultDic);
        }];
    }
    if ([url.host isEqualToString:@"platformapi"]){//支付宝钱包快登授权返回authCode
        
        [[AlipaySDK defaultService] processAuthResult:url standbyCallback:^(NSDictionary *resultDic) {
            //【由于在跳转支付宝客户端支付的过程中，商户app在后台很可能被系统kill了，所以pay接口的callback就会失效，请商户对standbyCallback返回的回调结果进行处理,就是在这个方法里面处理跟callback一样的逻辑】
            NSLog(@"result = %@",resultDic);
        }];
    }
    return YES;
}

@end
