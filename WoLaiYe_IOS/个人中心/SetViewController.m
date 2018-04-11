//
//  SetViewController.m
//  WoLaiYe_IOS
//
//  Created by yugang on 16/6/3.
//  Copyright © 2016年 kzk. All rights reserved.
//

#import "SetViewController.h"
#import "Header.h"
#import "Order.h"
#import "DataSigner.h"
#import "UMSocial.h"

#import <AlipaySDK/AlipaySDK.h>
@interface SetViewController ()<UITableViewDelegate,UITableViewDataSource,UMSocialUIDelegate>
{
    SCREEN_WIDTH_AND_HEIGHT
    NSArray *array_A;

}
@property(nonatomic,strong)UITableView *tabel_view;
@end

@implementation SetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    TOP_VIEW(@"设置")
    
    self.tabel_view = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, _width, _height) style:UITableViewStyleGrouped];
    array_A = @[@"通知与消息",@"收货地址",@"检查更新",@"清理缓存",@"关于副本",@"支付1分钱",@"分享"];
    _tabel_view =[[UITableView alloc]initWithFrame:CGRectMake(0, 64, _width, _height-64) style:UITableViewStyleGrouped];
    _tabel_view.delegate = self;
    _tabel_view.dataSource  = self;
    [self.view addSubview:_tabel_view];}

-(void)backClick{
    POP
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 100;
    
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIButton *back_V = [UIButton buttonWithType:UIButtonTypeCustom];
    [back_V addTarget:self action:@selector(gocenter) forControlEvents:UIControlEventTouchUpInside];
    back_V.backgroundColor = [UIColor whiteColor];
    UIImageView *user_img = [[UIImageView alloc]initWithFrame:CGRectMake(15, 15, 70, 70)];
    user_img.backgroundColor =[UIColor greenColor];
    user_img.layer.cornerRadius = 35;
    user_img.clipsToBounds = YES;
    [back_V addSubview:user_img];
    
    UILabel *username = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(user_img.frame)+6, CGRectGetMidY(user_img.frame)-15, _width-CGRectGetMaxX(user_img.frame)-20, 20)];
    username.text = @"下个路考再见";
    username.textColor = [UIColor blackColor];
    username.font = [UIFont systemFontOfSize:14];
    [back_V addSubview:username];
    
    UIImageView *ident_img = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(username.frame), CGRectGetMaxY(username.frame), 15, 15)];
    ident_img.backgroundColor =[UIColor redColor];
    [back_V addSubview:ident_img];
    
    UILabel *ident_descripe = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(ident_img.frame)+4, CGRectGetMaxY(username.frame), _width-CGRectGetMaxX(ident_img.frame), 15)];
    ident_descripe.text = @"已经实名认证";
    ident_descripe.textColor = [UIColor darkGrayColor];
    ident_descripe.font = [UIFont systemFontOfSize:10];
    [back_V addSubview:ident_descripe];
    
    UILabel *complete_Lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 40, _width-30, 20)];
    complete_Lab.text = @"资料完成度65%";
    complete_Lab.textColor = [UIColor darkGrayColor];
    complete_Lab.font = [UIFont systemFontOfSize:10];
    complete_Lab.textAlignment = NSTextAlignmentRight;
    [back_V addSubview:complete_Lab];
    
    UIImageView *right_img = [[UIImageView alloc]initWithFrame:CGRectMake(_width-25, 42, 16, 16)];
    right_img.backgroundColor =[UIColor redColor];
    [back_V addSubview:right_img];


    
    return back_V;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return array_A.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.text = array_A[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 5) {
        
        [self zhifubao];
    }
    if ((indexPath.row ==6)) {
        [self shareToOther];
    }
    
    
    
}

-(void)shareToOther{
    
    
    
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:UMAPPKEY
                                      shareText:@"我来也测试分享"
                                     shareImage:[UIImage imageNamed:@"lvjuren.jpg"]
                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToQQ,UMShareToSina,UMShareToQzone,UMShareToWechatSession,UMShareToWechatTimeline,UMShareToTencent, nil] delegate:self];
    
    [UMSocialData defaultData].extConfig.sinaData.shareText=[NSString stringWithFormat:@"%@%@",@"我来也测试分享",[NSString stringWithFormat:@"http://waptx.yunshangweiqi.com/products_detail.html?productId=%@",@281]];
    
    [UMSocialData defaultData].extConfig.wechatSessionData.title = @"我来也测试分享";;
    [UMSocialData defaultData].extConfig.wechatSessionData.url = @"http://www.baidu.com";
    [UMSocialData defaultData].extConfig.wechatTimelineData.title = @"我来也测试分享";;
    [UMSocialData defaultData].extConfig.wechatTimelineData.url = @"http://www.baidu.com";
    
    
    [UMSocialData defaultData].extConfig.qzoneData.title = @"我来也测试分享";
    [UMSocialData defaultData].extConfig.qzoneData.url = @"http://www.baidu.com";
}


-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response
{
    //根据`responseCode`得到发送结果,如果分享成功
    if(response.responseCode == UMSResponseCodeSuccess)
    {
        //得到分享到的平台名
        NSLog(@"share to sns name is %@",[[response.data allKeys] objectAtIndex:0]);
    }
}
-(void)zhifubao{
    
    
    {
        
        /*
         *点击获取prodcut实例并初始化订单信息
         */
//        Product *product = [self.productList objectAtIndex:indexPath.row];
        
        /*
         *商户的唯一的parnter和seller。
         *签约后，支付宝会为每个商户分配一个唯一的 parnter 和 seller。
         */
        
        /*============================================================================*/
        /*=======================需要填写商户app申请的===================================*/
        /*============================================================================*/
        NSString *partner = @"2088511883511290";
        NSString *seller = @"pay@kingrocket.com";
        NSString *privateKey = @"MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBANExHY3m078ItvSkoppo8pDehpSPI1FDWsaW+R8dTaIMIZDRlsDfPxI+jWmO2oDVfz+XugwbIrIjs49Vr8r9jYryqr58YredIsUJar4uYJ6OAEj2yZ6fD4p1RDpszPjeQ4Vy6/5OsOhIpf6uVxcLkOdCRZy7XnVuQEoO80aqcIGjAgMBAAECgYAw2L4k71xMRDWsZHEPiyfwyfU05UOC6y5cJs6fBFGnYBvKXBZOjRKGKRMOLew5nyCqcbxgrUlpvUplUsXMqW4OMrPwenOmQnT3+qMOnjDavBFaR0SfYuhK8G5r3Fdl5jZWse++hFZn7kpOlZQrkjTBAw0qszgvBnHl1xL+ToE3yQJBAPHgbtAxAMKRkpCqmNBI52IACNTJuRMezwQ4X6WGfO8agDsNGYhpTYy0Nm+g4uElpHU1R86YP6B/KkMMuFXQTHcCQQDdaBxGf3204+WThBXjqe0OdOCmxv3C0OZjjpFxjYs2zjOaOnWPekV0wnm0lipsW7dexKexOMxI9oA4sL/9aPs1AkA5jXeQnjhaE51WQuF9nftAfFWdnConfIsxq+BGWIvdsOaWJnXO2Y+UTUUupo+VlwlcwkLFy8BIBjoeHia2dIvdAkEAyFGs23/4HVTgXtJv95bD24OVym9aIwxclpDkOOgGn+R6vbzMpq7K7rQR53jCE138D2tACdFIy27zXddVLZLxTQJANMhRayHT3KsMSGpFnyDeqJmx/b6ELPeKs2j5cdVlqIl/LNnu6T1jI6xAEmXmJrQbXAURMfUszTIDtklqYVoU9Q==";
        /*============================================================================*/
        /*============================================================================*/
        /*============================================================================*/
        
        //partner和seller获取失败,提示
        if ([partner length] == 0 ||
            [seller length] == 0 ||
            [privateKey length] == 0)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                            message:@"缺少partner或者seller或者私钥。"
                                                           delegate:self
                                                  cancelButtonTitle:@"确定"
                                                  otherButtonTitles:nil];
            [alert show];
            return;
        }
        
        /*
         *生成订单信息及签名
         */
        //将商品信息赋予AlixPayOrder的成员变量
        Order *order = [[Order alloc] init];
        order.partner = partner;
        order.sellerID = seller;
        order.outTradeNO = [self generateTradeNO]; //订单ID（由商家自行制定）
        order.subject = @"不要钱"; //商品标题
        order.body = @"测试商品"; //商品描述
        order.totalFee = [NSString stringWithFormat:@"%.2f",0.01]; //商品价格
        order.notifyURL =  @"http://www.xxx.com"; //回调URL
        
        order.service = @"mobile.securitypay.pay";
        order.paymentType = @"1";
        order.inputCharset = @"utf-8";
        order.itBPay = @"30m";
        order.showURL = @"m.alipay.com";
        
        //应用注册scheme,在AlixPayDemo-Info.plist定义URL types
        NSString *appScheme = @"wolaiye";
        
        //将商品信息拼接成字符串
        NSString *orderSpec = [order description];
        NSLog(@"orderSpec = %@",orderSpec);
        
        //获取私钥并将商户信息签名,外部商户可以根据情况存放私钥和签名,只需要遵循RSA签名规范,并将签名字符串base64编码和UrlEncode
        id<DataSigner> signer = CreateRSADataSigner(privateKey);
        NSString *signedString = [signer signString:orderSpec];
        
        //将签名成功字符串格式化为订单字符串,请严格按照该格式
        NSString *orderString = nil;
        if (signedString != nil) {
            orderString = [NSString stringWithFormat:@"%@&sign=\"%@\"&sign_type=\"%@\"",
                           orderSpec, signedString, @"RSA"];
            
            [[AlipaySDK defaultService] payOrder:orderString fromScheme:appScheme callback:^(NSDictionary *resultDic) {
                NSLog(@"reslut = %@",resultDic);
            }];
        }
//        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
    
}


- (NSString *)generateTradeNO
{
    static int kNumber = 15;
    
    NSString *sourceStr = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSMutableString *resultStr = [[NSMutableString alloc] init];
    srand((unsigned)time(0));
    for (int i = 0; i < kNumber; i++)
    {
        unsigned index = rand() % [sourceStr length];
        NSString *oneStr = [sourceStr substringWithRange:NSMakeRange(index, 1)];
        [resultStr appendString:oneStr];
    }
    return resultStr;
}



-(void)gocenter{
    NSLog(@"完善个人信息");
}

-(NSString *)getTheNoNullStr:(id)str andRepalceStr:(NSString*)replace{
    NSString *string=nil;
    if (![str isKindOfClass:[NSNull class]]) {
        string =  [NSString stringWithFormat:@"%@",str];
        
        if (string.length ==0||(NSNull*)string == [NSNull null]||[string containsString:@"null"]) {
            string =replace;
            
        }
    }else{
        string =replace;
    }
    return string;
}

@end
