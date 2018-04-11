//
//  ViewController.m
//  VCaddVC
//
//  Created by 鲁征东 on 16/6/13.
//  Copyright © 2016年 鲁征东. All rights reserved.
//




#import "ViewController.h"
#import "HomeViewController.h"
#import "DynamicViewController.h"
#import "OrganizeViewController.h"


#import "JPUSHService.h"
#import "Header.h"
#import "mybutton.h"


#import "EMSDK.h"
#import "ChartVC.h"
#import "ConversationListController.h"


#import "MyfocusViewController.h"
#import "MyCollectVC.h"

#import "MyWalletVC.h"
#import "ImhereVC.h"
#import "SetViewController.h"
#import "MyGoupVC.h"
#import "MyOderListVC.h"


//发布
#import "PostSkillsVC.h"
#import "PostWorksVC.h"
#import "PostSharesVC.h"
#import "PostBabyVC.h"
#import "PostFeelVC.h"
#import "PostDemansVC.h"
#define NUMM 100000


@interface ViewController ()<UIScrollViewDelegate>
{
    SCREEN_WIDTH_AND_HEIGHT
    mybutton *oldBtn;
    UIView *lineView;
    
    UIView *home_view;
    UIButton *pencil_btn;//笔按钮
    UIView *pub_view;//发布的视图




}

@property(nonatomic,strong)HomeViewController *homeVC;
@property(nonatomic,strong)DynamicViewController *dynamicVC;
@property(nonatomic,strong)OrganizeViewController*organizeVC;


@property (nonatomic, strong) NSArray *headArray;
@property (nonatomic, strong) UIScrollView *topScrollView;

@property (nonatomic, strong) UIScrollView *bottomScrollView;


@property(nonatomic,strong) NSArray *data_Array;

@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden= YES;
//    arr_rows = [[NSArray alloc]init];
    pencil_btn.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    SCREEN
//    [self getData];
    

    self.headArray = @[@"首页",@"动态", @"组织"];
    self.automaticallyAdjustsScrollViewInsets = NO;

    self.topScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, _width, 64)];
    self.topScrollView.backgroundColor = APP_ClOUR;
    self.topScrollView.contentSize = CGSizeMake(520, 0);
    self.topScrollView.bounces = NO;
    self.topScrollView.pagingEnabled = YES;
    [self.view addSubview:_topScrollView];

    
    self.bottomScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, _width, _height-64)];
    self.bottomScrollView.backgroundColor = [UIColor purpleColor];
    self.bottomScrollView.contentSize = CGSizeMake(520, 0);
    self.bottomScrollView.bounces = NO;
    self.bottomScrollView.delegate= self;
//    self.bottomScrollView.pagingEnabled = YES;
    [self.view addSubview:_bottomScrollView];
    

    [self setUpTopScrollView];
    
    [self setUpBottomScrollView];

    
    [self creatHomeView];
    
    pencil_btn = [[UIButton alloc]initWithFrame:CGRectMake(_width-55, _height-55, 44, 44)];
    pencil_btn.backgroundColor = RGB(211, 111, 125);
    pencil_btn.layer.cornerRadius = 22;
    pencil_btn.clipsToBounds =YES;
    [self.view addSubview:pencil_btn];
    [pencil_btn addTarget:self action:@selector(pencilClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:pencil_btn];
    NSArray* windows = [UIApplication sharedApplication].windows;
    UIWindow*_window = [windows lastObject];
    [_window addSubview:pencil_btn];
    
//    NSLog(@"windows.count---%lu",(unsigned long)windows.count);


    
    
    
}



//个人中心视图
-(void)creatHomeView{
    
    home_view = [[UIView alloc]initWithFrame:CGRectMake(-_width, 0, _width, _height)];
    NSArray* windows = [UIApplication sharedApplication].windows;
    UIWindow*_window = [windows lastObject];
    [_window addSubview:home_view];
    
    
    
    
    UIView *back_V = [[UIView alloc]initWithFrame:CGRectMake(0, 0, _width*0.6, _height)];
    back_V.backgroundColor = [UIColor blackColor];
    back_V.alpha = 0.7;
    [home_view addSubview:back_V];
    
    UIButton *home_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    home_btn.frame = CGRectMake(CGRectGetWidth(back_V.frame), 0, 44, 64);
    home_btn.backgroundColor = back_V.backgroundColor;
    home_btn.alpha = back_V.alpha;
    [home_btn addTarget:self action:@selector(backhomeClick:) forControlEvents:UIControlEventTouchUpInside];
    [home_view addSubview:home_btn];
    
    
    UIImageView *ho_img = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetWidth(back_V.frame)+10, 30, 24, 24)];
    ho_img.backgroundColor = [UIColor orangeColor];
    ho_img.tag = 10000;
    [home_view addSubview:ho_img];
    
    
    NSArray *cent_A = @[@"收藏",@"关注",@"消息"];
    for (int i = 0; i < cent_A.count; i ++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(i*(CGRectGetWidth(back_V.frame)/cent_A.count-10),20,CGRectGetWidth(back_V.frame)/cent_A.count, 44);
        button.tag = i;
        [button addTarget:self action:@selector(thirdBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [back_V addSubview:button];
        
        UIImageView *image_v =[[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetWidth(button.frame)/2-15, 12, 20, 20)];
        image_v.backgroundColor = [UIColor greenColor];
        [button addSubview:image_v];
        
        UILabel *lab_center = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(image_v.frame)+5, 7, CGRectGetWidth(button.frame)/2, 30)];
        lab_center.textColor = [UIColor whiteColor];
        lab_center.text = cent_A[i];
        lab_center.font = [UIFont systemFontOfSize:12];
        [button addSubview:lab_center];
        if (i!=(cent_A.count-1)) {
            UIView *line_V = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMidX(lab_center.frame)+12, 12, 1, 20)];
            line_V.backgroundColor = [UIColor whiteColor];
            [button addSubview:line_V];
        }
        
    }
    
    
    UIButton *person_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    person_btn.frame = CGRectMake(0, 64, CGRectGetWidth(back_V.frame), 60);
    [person_btn addTarget:self action:@selector(personCick) forControlEvents:UIControlEventTouchUpInside];
    [back_V addSubview:person_btn];
    UIImageView *person_img = [[UIImageView alloc]initWithFrame:CGRectMake(10, 5, 50, 50)];
    person_img.backgroundColor = [UIColor whiteColor];
    person_img.layer.cornerRadius = CGRectGetWidth(person_img.frame)/2;
    person_img.clipsToBounds = YES;
    [person_btn addSubview:person_img];
    
    UILabel *name_lab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(person_img.frame)+4, 10, CGRectGetWidth(back_V.frame)-CGRectGetMaxX(person_img.frame)-10, 20)];
    name_lab.text = @"虾苗再见";
    name_lab.textColor = [UIColor whiteColor];
    name_lab.font = [UIFont systemFontOfSize:14];
    [person_btn addSubview:name_lab];
    
    UILabel *des_lab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(person_img.frame)+4, 30, CGRectGetWidth(back_V.frame)-CGRectGetMaxX(person_img.frame)-10, 20)];
    des_lab.text = @"资料完整度68%";
    des_lab.textColor = [UIColor whiteColor];
    des_lab.font = [UIFont systemFontOfSize:11];
    [person_btn addSubview:des_lab];
    
    
    UIView *hengxian_line = [[UIView alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(person_btn.frame)+5, CGRectGetWidth(back_V.frame)-15, 1)];
    hengxian_line.backgroundColor = [UIColor lightGrayColor];
    [back_V addSubview:hengxian_line];
    
    NSArray *arr_A = @[@"我的钱包",@"我的订单",@"我在XX",@"我的组织",@"设置",@"退出"];
    CGFloat bttun_W = 35;
    for (int i =0; i < arr_A.count; i++) {
        
        UIButton *btton = [UIButton buttonWithType:UIButtonTypeCustom];
        btton.frame = CGRectMake(0, CGRectGetMaxY(hengxian_line.frame)+15+i*bttun_W, CGRectGetWidth(back_V.frame), bttun_W);
        btton.tag = i;
        [btton addTarget:self action:@selector(goPerson:) forControlEvents:UIControlEventTouchUpInside];
        [back_V addSubview:btton];
        
        UIView *spot_v = [[UIView alloc]initWithFrame:CGRectMake(15, (bttun_W-4)/2, 4, 4)];
        spot_v.backgroundColor = [UIColor whiteColor];
        spot_v.clipsToBounds= YES;
        spot_v.layer.cornerRadius = 2;
        [btton addSubview:spot_v];
        
        UILabel *lab_P = [[UILabel alloc]initWithFrame:CGRectMake(25, 0, CGRectGetWidth(back_V.frame)-25, bttun_W)];
        lab_P.text = arr_A[i];
        lab_P.textColor = [UIColor whiteColor];
        lab_P.font = [UIFont systemFontOfSize:17];
        [btton addSubview:lab_P];
        
        
    }
    
    
}

-(void)setUpTopScrollView{
    UIButton *home_Btn = [[UIButton alloc]initWithFrame:CGRectMake(14, 30, 25,25 )];
    home_Btn.backgroundColor = [UIColor whiteColor];
    [home_Btn addTarget:self action:@selector(homeClick) forControlEvents:UIControlEventTouchUpInside];
    [_topScrollView addSubview:home_Btn];
    
    UIButton *search_btn = [[UIButton alloc]initWithFrame:CGRectMake(_width-40, 30, 25, 25)];
    search_btn.backgroundColor = [UIColor greenColor];
    [search_btn addTarget:self action:@selector(seaerchClick) forControlEvents:UIControlEventTouchUpInside];
    
    [_topScrollView addSubview:search_btn];
    
    
    for (int i = 0; i <3; i ++) {
        mybutton *btn = [[mybutton alloc]initWithFrame:CGRectMake(80+i*(_width-160)/3, 20, (_width-160)/3, 42)];
        
        [btn setTitle:self.headArray[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        btn.tag = i+NUMM;
//        btn.BtnArray = data_A;
        btn.titleLabel.font = [UIFont boldSystemFontOfSize:17];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        
        [_topScrollView addSubview:btn];
        if (i==0) {
            btn.selected = YES;
            oldBtn = btn;
            
            lineView = [[UIView alloc]init];
            lineView.bounds = CGRectMake(0, 0, (_width-160)/4, 2);
            lineView.center = CGPointMake(btn.center.x, CGRectGetMaxY(btn.frame)+1);
            lineView.backgroundColor = [UIColor whiteColor];
            [_topScrollView addSubview:lineView];
        }
    }


    

    

}

//收缩个人中心
-(void)backhomeClick:(UIButton*)sender{
    
    [UIView animateWithDuration:0.4 animations:^{
        home_view.frame = CGRectMake(-_width, 0, _width, _height);
        
    }];
    
    
}
// 收藏  关注  消息
-(void)thirdBtnClick:(UIButton*)sender{
    [UIView animateWithDuration:0.4 animations:^{
        home_view.frame = CGRectMake(-_width, 0, _width, _height);
        
    }];
    if (sender.tag==0) {
        PUSH(MyCollectVC)
        
    }else if (sender.tag==1){
        PUSH(MyfocusViewController)
        
    }else {
        PUSH(ConversationListController)
        
        
        
    }
    
    
}
//个人中心
-(void)personCick{
    [UIView animateWithDuration:0.4 animations:^{
        home_view.frame = CGRectMake(-_width, 0, _width, _height);
        
    }];
    
    
}
//钱包 订单。。等等
-(void)goPerson:(UIButton*)sender{
    
    [UIView animateWithDuration:0.4 animations:^{
        home_view.frame = CGRectMake(-_width, 0, _width, _height);
        
    }];
    if (sender.tag ==0) {
        //钱包
        PUSH(MyWalletVC)
        
    }else if (sender.tag==1){
        //订单列表
        PUSH(MyOderListVC)
        
    }else if (sender.tag==2){
        //我在XXX
        PUSH(ImhereVC)
        
    }else if (sender.tag==3){
        //我的组织
        PUSH(MyGoupVC)
        
        
    }else if (sender.tag==4){
        //设置
        PUSH(SetViewController)
    }else if (sender.tag==5){
        //退出
    }
    
    
}

//顶部三个分类对应的点击事件
-(void)btnClick:(mybutton*)sender{
    if (sender !=oldBtn) {
        sender.selected = YES;
        oldBtn.selected = NO;
        oldBtn = sender;
        [UIView animateWithDuration:0.5 animations:^{
            lineView.center = CGPointMake(sender.center.x, CGRectGetMaxY(sender.frame)+1);
        }];
        [self.bottomScrollView setContentOffset:CGPointMake((sender.tag-NUMM) * self.bottomScrollView.frame.size.width, 0) animated:YES];

    }
    

    
}

-(void)homeClick{
    
//       根据homeView的X坐标移动它的位置。
    
    if (CGRectGetMinX(home_view.frame)<0) {
        //        NSLog(@"______________");
        [UIView animateWithDuration:0.4 animations:^{
            home_view.frame = CGRectMake(0, 0, _width, _height);
        }];
        
    }else{
        
        [UIView animateWithDuration:0.4 animations:^{
            home_view.frame = CGRectMake(-_width, 0, _width, _height);
            
        }];
        
    }
    
}
-(void)seaerchClick{
    
    
    NSLog(@"search");
    
    
    
    
    //    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    //
    //
    //        EMError *error1 = [[EMClient sharedClient] loginWithUsername:@"f1650874da589ec785417bce8a5b3e26" password:@"11843f562233d61f03c8e9664fb4a8af"];
    //
    //        if (!error1) {
    //
    //            dispatch_async(dispatch_get_main_queue(), ^{
    //
    //
    
    ChartVC *chatController = [[ChartVC alloc] initWithConversationChatter:@"wang1bao9qiang" conversationType:EMConversationTypeChat];
    
    chatController.title = @"wang1bao9qiang";
    
    [self.navigationController pushViewController:chatController animated:YES];
    //                NSLog(@"登录成功");
    //
    //            });
    //
    //        }else{
    //            dispatch_async(dispatch_get_main_queue(), ^{
    //
    //                NSLog(@"登录失败");
    //
    //
    //                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"您还没有登录！" preferredStyle:UIAlertControllerStyleAlert];
    //
    //                UIAlertAction *cancleAction  = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    //
    //                UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    //                    [self okClick];
    //                }];
    //
    //                [alertController addAction:cancleAction];
    //                [alertController addAction:okAction];
    //                [self presentViewController:alertController animated:YES completion:^{
    //
    //                }];
    //
    //            });
    //            
    //        }
    //
    //
    //    });
    
    
    
    
}


//发布技能作品等等
-(void)publickCilck:(UIButton*)button{
    NSLog(@"-- Go 发布---");
    
    pencil_btn.selected = !pencil_btn.selected;
    [pub_view removeFromSuperview];
    if (button.tag==0) {
        PUSH(PostSkillsVC);
        
    }else
        if (button.tag==1) {
            PUSH(PostWorksVC);
            
        }else
            if (button.tag==2) {
                PUSH(PostSharesVC);
                
            }else
                if (button.tag==3) {
                    PUSH(PostBabyVC);
                    
                }else
                    if (button.tag==4) {
                        PUSH(PostFeelVC);
                        
                    }else
                    {
                        PUSH(PostDemansVC);
                        
                    }
    
}
//发布
-(void)pencilClick:(UIButton*)button{
    
    button.selected = !button.selected;
    if (button.selected == YES) {
        
        [self creaPubView];
        
    }else{
        [pub_view removeFromSuperview];
    }
}
//取消发布信息
-(void)cancleCilck{
    pencil_btn.selected = !pencil_btn.selected;
    [pub_view removeFromSuperview];
    
}


-(void)creaPubView{
    
    pub_view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, _width, _height)];
    [self.view addSubview:pub_view];
    
    pub_view.backgroundColor = [UIColor blackColor];
    pub_view.alpha = 0.7;
    
    NSArray *pub_arr = @[@"发布技能",@"发布作品",@"发布分享",@"发布宝贝",@"发布心情",@"发布需求"];
    for (int i =0; i <pub_arr.count; i ++) {
        
        int X = i%3;
        int Y = i/3;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [pub_view addSubview:btn];
        btn.bounds = CGRectMake(0, 0, _width*0.15, _width*0.15);
        
        btn.center = CGPointMake(_width/4*(X+1), _height/2+(_width*0.15+40)*Y-_width*0.15*0.5);
        btn.layer.cornerRadius =_width*0.15/2;
        btn.backgroundColor = [UIColor whiteColor];
        btn.tag = i ;
        [btn addTarget:self action:@selector(publickCilck:) forControlEvents:UIControlEventTouchUpInside];
        
        UILabel *lab_P = [[UILabel alloc]init];
        lab_P.bounds = CGRectMake(0, 0, _width*0.2, 20);
        lab_P.center = CGPointMake(CGRectGetMidX(btn.frame), CGRectGetMidY(btn.frame)+CGRectGetHeight(btn.frame)/2+10);
        lab_P.textAlignment = NSTextAlignmentCenter;
        lab_P.font = [UIFont systemFontOfSize:13];
        lab_P.textColor = [UIColor whiteColor];
        lab_P.text = pub_arr[i];
        [pub_view addSubview:lab_P];
        
        
        
    }
    
    UIButton *cancleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [pub_view addSubview:cancleBtn];
    
    [cancleBtn addTarget:self action:@selector(cancleCilck) forControlEvents:UIControlEventTouchUpInside];
    cancleBtn.frame = CGRectMake(_width/2-22, _height-100, 44, 44);
    
    [cancleBtn setTitle:@"X" forState:UIControlStateNormal];
    cancleBtn.titleLabel.font = [UIFont boldSystemFontOfSize:25];
    
    
}

#pragma mark - 实现UIScrollViewDelegate代理方法

//滚动动画停止的时候调用
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    NSInteger idx = self.bottomScrollView.contentOffset.x / self.bottomScrollView.frame.size.width;
    
    mybutton *button = (mybutton*)[_topScrollView viewWithTag:idx+NUMM];
    
    if (button !=oldBtn) {
        button.selected = YES;
        oldBtn.selected = NO;
        oldBtn = button;
        [UIView animateWithDuration:0.5 animations:^{
            lineView.center = CGPointMake(button.center.x, CGRectGetMaxY(button.frame)+1);
        }];
    }
   

}

//减速完毕调用
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollViewDidEndScrollingAnimation:scrollView];
}


//滚动的时候调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat index = scrollView.contentOffset.x / scrollView.frame.size.width;
    NSInteger currentIndex = (NSInteger)index;
    
    NSInteger nextIndex = currentIndex + 1;
    
    if (nextIndex < self.headArray.count)
    {
        UIViewController *vc = (UIViewController *)self.childViewControllers[nextIndex];
        
        
        NSLog(@"==========%ld===%@",nextIndex,vc.view.superview);

//        当用户滚动的时候，才将控制器的view添加到scrollView中
        if (vc.view.superview == nil)
        {
            vc.view.frame = CGRectMake(nextIndex * scrollView.frame.size.width, 0, scrollView.frame.size.width, scrollView.frame.size.height);
            
            [scrollView addSubview:vc.view];
        }
        
    }
    
}



-(void)setUpBottomScrollView{
    
    self.homeVC = [[HomeViewController alloc] init];
    [self.homeVC.view setFrame:CGRectMake(0, 64, _width, _height - 64)];
    [self addChildViewController:_homeVC];
    
    self.dynamicVC = [[DynamicViewController alloc] init];
    [self.dynamicVC.view setFrame:CGRectMake(0, 64, _width, _height - 64)];
    [self addChildViewController:_dynamicVC];
    
    self.organizeVC = [[OrganizeViewController alloc]init];
    [self.organizeVC.view setFrame:CGRectMake(0, 64, _width, _height - 64)];
    [self addChildViewController:_organizeVC];

    

    
    CGFloat VCViewW = self.bottomScrollView.frame.size.width;
    CGFloat VCViewH = self.bottomScrollView.frame.size.height;
    CGFloat VCViewY = 0;
    
    //一开始，默认添加第一个控制器的view到scrollView中，其他view在滚动时动态添加
    CGFloat VCViewX = 0;
    self.homeVC.view.frame = CGRectMake(VCViewX, VCViewY, VCViewW, VCViewH);
    [self.bottomScrollView addSubview:self.homeVC.view];

    
    //设置contentSize
    self.bottomScrollView.contentSize = CGSizeMake(_headArray.count * _width, 0);
    
    //取消水平滚动条
    self.bottomScrollView.showsHorizontalScrollIndicator = NO;
    self.bottomScrollView.showsVerticalScrollIndicator = NO;
    
    //设置分页
    self.bottomScrollView.pagingEnabled = YES;

    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
