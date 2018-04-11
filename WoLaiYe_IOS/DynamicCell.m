//
//  DynamicCell.m
//  WoLaiYe_IOS
//
//  Created by 鲁征东 on 16/6/14.
//  Copyright © 2016年 kzk. All rights reserved.
//

#import "DynamicCell.h"
#import "Header.h"
#import "Masonry.h"

@interface DynamicCell ()
{
    SCREEN_WIDTH_AND_HEIGHT
}


@property (nonatomic,weak) UIImageView *img_v;  //图片
@property (nonatomic,weak) UILabel *content; //显示文本的label
@property (nonatomic,weak) UIImageView *person_img;  //头像
@property(nonatomic,weak)UILabel * title_lab;//标题

//定义一个contentLabel文本高度的属性
@property (nonatomic,assign) CGFloat contentLabelH;

@end

@implementation DynamicCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self) {
        self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
        
        
        [self setSubviews];

    }
    
    return self;
}

-(void)setSubviews{
    _width = [UIScreen mainScreen].bounds.size.width;
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, _width, 5)];
    line.backgroundColor = [UIColor greenColor];
    [self.contentView addSubview:line];
    
    UIImageView *img_v = [[UIImageView alloc]initWithFrame:CGRectMake(0, 5, _width, _width*0.5)];
    img_v.backgroundColor = [UIColor redColor];
    self.img_v = img_v;
    [self.contentView addSubview:img_v];
    
    UIImageView *sort_img = [[UIImageView alloc]initWithFrame:CGRectMake(0, 8, 50, 20)];
    sort_img.backgroundColor = [UIColor purpleColor];
    [img_v addSubview:sort_img];
    
    UILabel *title_lab = [[UILabel alloc]initWithFrame:CGRectMake(5, CGRectGetMaxY(img_v.frame), _width*0.8, 30)];
    title_lab.textColor = [UIColor blackColor];
    title_lab.font = [UIFont boldSystemFontOfSize:17];
    self.title_lab = title_lab;
    [self.contentView addSubview:title_lab];
    
    //添加内容
    UILabel *content_lab = [UILabel new];
    content_lab.font = [UIFont systemFontOfSize:13];
    content_lab.numberOfLines=2;
    content_lab.textColor = [UIColor darkGrayColor];
    self.content = content_lab;
    [self.contentView addSubview:content_lab];
    
  
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
    
    
    UIButton *collect_btn = [UIButton new];
    collect_btn.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:collect_btn];
    _collect_btn = collect_btn;
    
    UILabel *collect_num = [UILabel new];
    collect_num.font = [UIFont boldSystemFontOfSize:13];
    collect_num.text = @"234";
    collect_num.textColor = [UIColor darkGrayColor];
    [self.contentView addSubview:collect_num];
    
    
    
    [content_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(title_lab.mas_bottom).offset(0);
        make.left.equalTo(self.img_v.mas_left).offset(5);
        make.right.equalTo(self.img_v.mas_right).offset(-5);
        
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
    
    [collect_num mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(person_img.mas_top);
        make.bottom.mas_equalTo(person_img.mas_bottom);
        make.right.mas_equalTo(self.img_v.mas_right).offset(-5);
//        make.height.mas_equalTo(25);
        make.width.mas_equalTo(40);
    }];
    
    [collect_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(person_state.mas_bottom).offset(0);
        make.right.mas_equalTo(collect_num.mas_left).offset(-3);
        make.height.mas_equalTo(25);
        make.width.mas_equalTo(20);
    }];
    
    
    [share_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(person_state.mas_bottom).offset(0);
        make.right.mas_equalTo(collect_btn.mas_left).offset(-10);
        make.height.mas_equalTo(25);
        make.width.mas_equalTo(25);
        
        
    }];

    

}



-(void)setDynamicModel:(DynamicModel *)dynamicModel{
    
    _dynamicModel = dynamicModel;
    
    self.img_v.image=[UIImage imageNamed:dynamicModel.topic_img];
    self.content.text=dynamicModel.content_str;
    self.title_lab.text = dynamicModel.title_str;

}
-(CGFloat)rowHeightWithCellModel:(DynamicModel *)dynamicModel;
{
 
    _dynamicModel = dynamicModel;
    __weak __typeof(&*self) weakSelf= self;
    [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(weakSelf.contentLabelH);

    }];
    
    //跟新约束
    [self layoutIfNeeded];
    
    
    CGFloat h = CGRectGetMaxY(self.person_img.frame)+10;
    NSLog(@"-----%f",h);

    return h;
}

-(CGFloat)contentLabelH{
        if (!_contentLabelH) {
            CGFloat h=[self.dynamicModel.content_str boundingRectWithSize:CGSizeMake(_width-10, 40) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil].size.height;
            
            _contentLabelH=h;
        }
        return _contentLabelH;
}

@end
