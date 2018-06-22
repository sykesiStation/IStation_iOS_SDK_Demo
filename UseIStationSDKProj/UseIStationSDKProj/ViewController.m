//
//  ViewController.m
//  UseWskSDKProj
//
//  Created by 焱 孙 on 16/7/26.
//  Copyright © 2016年 焱 孙. All rights reserved.
//

#import "ViewController.h"
#import <IStationSDK/IStationSDK.h>
#import "Common.h"
#import "CommonNavigationController.h"

@interface ViewController () {
    BOOL isDefaultLayout;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"wsk  Demo";
    isDefaultLayout = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//自定义UI
- (void)setWskSDKUI {
    //消息颜色
    [[IStationSDK sharedSDK] customUIConfig].serviceMessageTextColor = [UIColor blackColor];
    [[IStationSDK sharedSDK] customUIConfig].customMessageTextColor = [UIColor whiteColor];
    
    //设置聊天背景
    UIImage *backgroundImage = [[UIImage imageNamed:@"chat_bg"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0) resizingMode:UIImageResizingModeTile];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:backgroundImage];
    imageView.contentMode = UIViewContentModeScaleToFill;
    [[IStationSDK sharedSDK] customUIConfig].chatBackground = imageView;
    
    //设置自定义气泡
    [[IStationSDK sharedSDK] customUIConfig].customerMessageBubbleNormalImage = [[UIImage imageNamed:@"icon_sender_node"] resizableImageWithCapInsets:UIEdgeInsetsMake(15,15,30,30) resizingMode:UIImageResizingModeStretch];
    [[IStationSDK sharedSDK] customUIConfig].customerMessageBubblePressedImage = [[UIImage imageNamed:@"icon_sender_node"] resizableImageWithCapInsets:UIEdgeInsetsMake(15,15,30,30) resizingMode:UIImageResizingModeStretch];
    [[IStationSDK sharedSDK] customUIConfig].serviceMessageBubbleNormalImage = [[UIImage imageNamed:@"icon_receiver_node"] resizableImageWithCapInsets:UIEdgeInsetsMake(15,30,30,15) resizingMode:UIImageResizingModeStretch];
    [[IStationSDK sharedSDK] customUIConfig].serviceMessageBubblePressedImage = [[UIImage imageNamed:@"icon_receiver_node"] resizableImageWithCapInsets:UIEdgeInsetsMake(15,30,30,15) resizingMode:UIImageResizingModeStretch];
    
    //提示文字颜色和背景颜色
    [[IStationSDK sharedSDK] customUIConfig].tipMessageTextColor = [UIColor colorWithRed:163/255.0 green:175/255.0 blue:183/255.0 alpha:1.0];
    [[IStationSDK sharedSDK] customUIConfig].tipMessageBackgroundColor = [UIColor colorWithRed:238.0/255.0 green:238.0/255.0 blue:238.0/255.0 alpha:1.0];
    
    //时间颜色
    [[IStationSDK sharedSDK] customUIConfig].messageTimeColor = [UIColor colorWithRed:163/255.0 green:175/255.0 blue:183/255.0 alpha:1.0];
    
    //输入框文字颜色
    [[IStationSDK sharedSDK] customUIConfig].inputTextColor = [UIColor blackColor];
    
    //客户头像
    [[IStationSDK sharedSDK] customUIConfig].customerHeadURL = [NSURL URLWithString:@"http://visionet.findest.com/letsdesk/assets/img/logo-1.png"];
    [[IStationSDK sharedSDK] customUIConfig].customerHeadImage = [UIImage imageNamed:@"customer_avatar"];
    
    //默认进入聊天界面键盘弹起
    [[IStationSDK sharedSDK] customUIConfig].isShowKeyboard = YES;
}

- (IBAction)pushControllerAction:(id)sender {
    //设置用户信息
    [self setUserInfo];
    
//    //商品信息
//    IStationCommodityVo *commodityVo = [[IStationCommodityVo alloc]init];
//    commodityVo.desc = @"商品描述信息";
//    commodityVo.urlString = @"http://www.baidu.com";
    
    //启动聊天界面
    IStationChatViewController *chatViewController = [[IStationSDK sharedSDK] chatViewController];
    chatViewController.chatTitle = @"wsk SDK测试";
//    chatViewController.commodityVo = commodityVo;
    
    //文字
//    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"返回1" style:UIBarButtonItemStylePlain target:self action:@selector(onPop:)];
//    backButton.tintColor = [UIColor redColor];
//    chatViewController.navigationItem.leftBarButtonItem = backButton;
    
//    图片
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"common_nav_icon_back"] style:UIBarButtonItemStylePlain target:self action:@selector(onPop:)];
    backButton.tintColor = [UIColor colorWithRed:66.0/255 green:133.0/255 blue:244.0/255 alpha:1.0];
    chatViewController.navigationItem.leftBarButtonItem = backButton;
    
    
    chatViewController.navigationController.navigationBar.tintColor = [UIColor colorWithRed:98.0/255 green:168.0/255 blue:234.0/255 alpha:1.0];
    
    [self.navigationController pushViewController:chatViewController animated:YES];
}

- (IBAction)presentControllerAction:(id)sender {
    //设置用户信息
    [self setUserInfo];
    
    //启动聊天界面
    IStationChatViewController *chatViewController = [[IStationSDK sharedSDK] chatViewController];
    chatViewController.chatTitle = @"wsk SDK测试";
    //文字
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(onBack:)];
    backButton.tintColor = [UIColor greenColor];
    chatViewController.navigationItem.leftBarButtonItem = backButton;
    
    //图片
//    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_present_back"] style:UIBarButtonItemStylePlain target:self action:@selector(onBack:)];
//    backButton.tintColor = [UIColor greenColor];
//    chatViewController.navigationItem.leftBarButtonItem = backButton;

    //自定义视图(自定义视图设置target、action无效，需要类似添加UIButton控件处理事件)
    //...
    
    UINavigationController *navigationController  = [[UINavigationController alloc] initWithRootViewController:chatViewController];
    [navigationController.navigationBar setBackgroundImage:[Common getImageWithColor:[UIColor colorWithRed:18/255.0 green:183/255.0 blue:246/255.0 alpha:1.0]] forBarMetrics:UIBarMetricsDefault];
//    navigationController.navigationBar.translucent = NO;
    [self presentViewController:navigationController animated:YES completion:nil];
}

//注销操作
- (IBAction)logout:(id)sender {
    [[IStationSDK sharedSDK] logout:^{
        NSLog(@"注销成功！");
    }];
}

//切换聊天样式
- (IBAction)switchChatLayout:(id)sender {
    isDefaultLayout = !isDefaultLayout;
    if (isDefaultLayout) {
        //重置为默认UI
        [[[IStationSDK sharedSDK] customUIConfig] resetUIConfig];
    } else {
        //自定义UI
        [self setWskSDKUI];
    }
}

- (void)setUserInfo {
    //设置用户信息 传递nil就对该字段不做处理，不会传递到服务端
    IStationUserVo *userVo = [[IStationUserVo alloc]init];
    userVo.userID = @"45471429667";    //开发账号 test2
    userVo.userName = @"Mary";//@"Mary";
    userVo.headerImageURL = @"http://tupian.enterdesk.com/2014/lxy/2014/12/03/6/8.png";
    userVo.gender = 1;  //1：男、2：女
    userVo.phoneNumber = @"18622222222";
    userVo.telephone = @"021-12345678";
    userVo.email = @"222222222222@qq.com";
    
    userVo.address = @"上海市长宁区";
    userVo.position = @"人事经理";
    userVo.department = @"人事部";
    userVo.birthday = @"1988-12-12";
    userVo.remark = @"备注SDK1111111";
    
    [[IStationSDK sharedSDK] setUserInfo:userVo];
}

- (void)onBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)onPop:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
