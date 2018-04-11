//
//  collectTableViewCell.m
//  WoLaiYe_IOS
//
//  Created by yugang on 16/6/6.
//  Copyright © 2016年 kzk. All rights reserved.
//


#import "collectTableViewCell.h"
#import "Header.h"
#import "Masonry.h"
#import "CollectModel.h"


//#define iconH  80
//#define iconW 100



@interface collectTableViewCell ()
@property (nonatomic,weak) UIImageView *icon;  //头像
@property (nonatomic,weak) UILabel *content; //显示文本的label
@property (nonatomic,weak) UIImageView *person_img;  //头像

//定义一个contentLabel文本高度的属性
@property (nonatomic,assign) CGFloat contentLabelH;

@end

@implementation collectTableViewCell
{
    SCREEN_WIDTH_AND_HEIGHT
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatSubviews];
    }
    return self;
}

-(void)creatSubviews{
    _width =[UIScreen mainScreen].bounds.size.width;
    
    CGFloat iconH = _width*0.35;
    CGFloat iconW =_width-100;

    //添加红色条
    UIView *redLine = [[UIView alloc]init];
    redLine.backgroundColor = APP_ClOUR;
    [self.contentView addSubview:redLine];
    
    //添加时间
    UILabel *time_lab = [[UILabel alloc]init];
    time_lab.textColor = [UIColor darkGrayColor];
    time_lab.text = @"6月3号";
    [self.contentView addSubview:time_lab];
    //添加图片
    UIImageView *icon_imag = [UIImageView new];
    icon_imag.clipsToBounds = YES;
    icon_imag.backgroundColor = [UIColor greenColor];
    icon_imag.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:icon_imag];
    self.icon = icon_imag;
    
    //添加标题
    UILabel *title_lab = [UILabel new];
    title_lab.font = [UIFont boldSystemFontOfSize:15];
    title_lab.textColor = [UIColor blackColor];
    title_lab.text = @"水电费是的是的发放";
    [self.contentView addSubview:title_lab];
    
    //添加内容
    UILabel *content_lab = [UILabel new];
    content_lab.font = [UIFont systemFontOfSize:13];
    content_lab.numberOfLines=0;
    content_lab.textColor = [UIColor darkGrayColor];
    [self.contentView addSubview:content_lab];
    self.content = content_lab;
    //添加店家
    
    UIImageView *person_img = [[UIImageView alloc]init];
    person_img.backgroundColor= APP_ClOUR;
    person_img.layer.cornerRadius = 13;
    person_img.clipsToBounds = YES;
    [self.contentView addSubview:person_img];
    self.person_img = person_img;
    
    UILabel *person_name = [UILabel new];
    person_name.font = [UIFont systemFontOfSize:10];
    person_name.text = @"慕容胸小";
    person_name.textColor = [UIColor darkGrayColor];
    [self.contentView addSubview:person_name];
    
    UILabel *person_state = [UILabel new];
    person_state.font = [UIFont systemFontOfSize:10];
    person_state.text = @"已通过实名认证";
    person_state.textColor = [UIColor darkGrayColor];
    [self.contentView addSubview:person_state];
    
    UIButton *share_btn = [UIButton new];
    share_btn.backgroundColor = APP_ClOUR;
    [self.contentView addSubview:share_btn];
    _share_btn = share_btn;
    
    
    UIButton *garbage_btn = [UIButton new];
    garbage_btn.backgroundColor = APP_ClOUR;
    [self.contentView addSubview:garbage_btn];
    _garbage_btn = garbage_btn;

    //
    //设置约束
    
    __weak __typeof (&*self) weakSelf = self;
    //设置红色条大小
    [redLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(5);
        make.top.mas_equalTo(weakSelf.mas_top).offset(10);
        make.left.mas_equalTo(weakSelf.mas_left).offset(15);
        make.right.mas_equalTo(weakSelf.mas_right).offset(-10);
        
        
        
    }];
    //设置时间约束
    [time_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(redLine.mas_left).offset(0);
        make.top.mas_equalTo(redLine.mas_bottom).offset(0);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(_width);
    }];
    //设置图片的大小
    [icon_imag mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(iconH);
        make.width.mas_equalTo(iconW);
        make.top.mas_equalTo(redLine.mas_bottom).offset(0);
        make.right.mas_equalTo(weakSelf.mas_right).offset(-10);
        
        
    }];
    
    //设置标题约束
    
    [title_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(icon_imag.mas_bottom).offset(0);
        make.left.mas_equalTo(icon_imag.mas_left).offset(0);
        make.right.mas_equalTo(icon_imag.mas_right).offset(0);
        make.height.mas_equalTo(30);
    }];
    
    [content_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(title_lab.mas_bottom).offset(0);
        make.left.equalTo(title_lab.mas_left).offset(0);
        make.right.equalTo(title_lab.mas_right).offset(0);

    }];
    //店家约束
    [person_img mas_makeConstraints:^(MASConstraintMaker *make) {
    
        make.top.equalTo(content_lab.mas_bottom).offset(5);
        make.left.equalTo(content_lab.mas_left).offset(0);
        make.width.mas_equalTo(26);
        make.height.mas_equalTo(26);
    }];
    
    [person_name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(person_img.mas_top).offset(0);
        make.left.mas_equalTo(person_img.mas_right).offset(3);
        make.height.mas_equalTo(13);
        make.width.mas_equalTo(_width);
        
    }];
    
    [person_state mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(person_img.mas_centerY).offset(0);
        make.left.mas_equalTo(person_img.mas_right).offset(3);
        make.height.mas_equalTo(13);
        make.width.mas_equalTo(_width);
        
    }];
    
   
    [garbage_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(person_state.mas_bottom).offset(0);
        make.right.mas_equalTo(content_lab.mas_right).offset(0);
        make.height.mas_equalTo(25);
        make.width.mas_equalTo(20);
    }];

    
    [share_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(person_state.mas_bottom).offset(0);
        make.right.mas_equalTo(garbage_btn.mas_right).offset(-40);
        make.height.mas_equalTo(25);
        make.width.mas_equalTo(25);

    
    }];

}


-(void)setCollectModel:(CollectModel *)collectModel{
    
    _collectModel = collectModel;
    
    self.icon.image=[UIImage imageNamed:collectModel.icon];
    self.content.text=collectModel.content;

}


-(CGFloat)rowHeightWithCellModel:(CollectModel *)collectModel{

    _collectModel = collectModel;
    __weak __typeof(&*self) weakSelf = self;
    [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(weakSelf.contentLabelH);
    }];
    
    //跟新约束
    [self layoutIfNeeded];
    
    CGFloat h = CGRectGetMaxY(self.person_img.frame);
    
    
    return h;
}

-(CGFloat)contentLabelH{
    if (!_contentLabelH) {
        CGFloat h=[self.collectModel.content boundingRectWithSize:CGSizeMake(_width-100, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil].size.height;
        
        _contentLabelH=h;
    }
    return _contentLabelH;
}
@end
