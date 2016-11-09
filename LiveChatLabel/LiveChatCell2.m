//
//  LiveChatCell2.m
//  LiveChatLabel
//
//  Created by fusion on 16/11/8.
//  Copyright © 2016年 com.qianrong.peppertv. All rights reserved.
//

#import "LiveChatCell2.h"
// hex 取色值
#define UIColorFromHex(hex) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0 green:((float)((hex & 0xFF00) >> 8))/255.0 blue:((float)(hex & 0xFF))/255.0 alpha:1.0]
@interface LiveChatCell2 (){
    UIImageView *levelTagImage;  // back view
    UILabel *chatLabel;          // chat label
}

@end

@implementation LiveChatCell2

+ (LiveChatCell2 *)cellWithtableView:(UITableView *)tableView {
    LiveChatCell2 *cell =
    [tableView dequeueReusableCellWithIdentifier:@"LiveChatCell2"];
    if (!cell) {
        cell = [[LiveChatCell2 alloc] initWithStyle:UITableViewCellStyleDefault
                                            reuseIdentifier:@"LiveChatCell2"];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return self;
    }
    self.accessoryType = UITableViewCellAccessoryNone;
    self.textLabel.hidden = YES;
    self.frame = CGRectMake(0, 0, 300, 50);
    
    // 聊天内容
    chatLabel = [[UILabel alloc] init];
    chatLabel.numberOfLines = 0;
    chatLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    chatLabel.textAlignment = NSTextAlignmentLeft;
    chatLabel.font = [UIFont systemFontOfSize:14];
    chatLabel.textColor = [UIColor whiteColor];
    [chatLabel sizeToFit];
    [self addSubview:chatLabel];
    
    // 等级图标
    levelTagImage = [[UIImageView alloc] init];
    levelTagImage.frame = CGRectMake(0, 0, 17, 18);
    [chatLabel addSubview:levelTagImage];
    
    // 内容
    NSString *contentStr = @"小金:送了什么什么  点亮了某某直播间上的看法和入库后付款人赴地方哭三部分如都市快报vkjdfbvdfhvdjfvjkdfvkdsdkjvbdfkjh的看法库房和短裤法规和vkrdghdjkhgvkdr";
    NSString *showMessage =
    [NSString stringWithFormat:@"%@ %@", @1, contentStr];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes =
    @{NSFontAttributeName : [UIFont systemFontOfSize:14], NSParagraphStyleAttributeName : paragraphStyle.copy};
    
    /*-------------------------------------富文本--------------------------------------- */
    //添加首部图片
    NSMutableAttributedString* attributedStr = [[NSMutableAttributedString alloc]initWithString:showMessage attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}];
    NSTextAttachment* attachment = [[NSTextAttachment alloc]initWithData:nil ofType:nil];
    attachment.image = [UIImage imageNamed:@"rank_06"];
    attachment.image = [attachment imageForBounds:CGRectMake(0, 0, 20, 10) textContainer:nil characterIndex:1];
    NSAttributedString*text = [NSAttributedString attributedStringWithAttachment:attachment];
    [attributedStr insertAttributedString:text atIndex:0];
    
    // 想要添加任何图片可在字符串的任意位置插入NSTextAttachment  string
    NSTextAttachment* attachment1 = [[NSTextAttachment alloc]initWithData:nil ofType:nil];
    attachment1.image = [UIImage imageNamed:@"rank_06"];
    attachment1.image = [attachment1 imageForBounds:CGRectMake(0, 0, 20, 10) textContainer:nil characterIndex:1];
    NSAttributedString*text1 = [NSAttributedString attributedStringWithAttachment:attachment1];
    NSRange rangeContentStr1 = [contentStr rangeOfString:contentStr options:NSNumericSearch];
    [attributedStr insertAttributedString:text1 atIndex:rangeContentStr1.length];
    
    //添加尾部图片
    NSTextAttachment* attachment2 = [[NSTextAttachment alloc]initWithData:nil ofType:nil];
    attachment2.image = [UIImage imageNamed:@"rank_06"];
    attachment2.image = [attachment2 imageForBounds:CGRectMake(0, 0, 20, 10) textContainer:nil characterIndex:1];
    NSAttributedString*text2 = [NSAttributedString attributedStringWithAttachment:attachment2];
    NSRange rangeContentStr2 = [contentStr rangeOfString:contentStr options:NSBackwardsSearch];
    [attributedStr insertAttributedString:text2 atIndex:rangeContentStr2.length+2];
    
    
    // 判断是否送礼 点亮
    if ([[attributedStr string] rangeOfString:@"送了"].location !=NSNotFound||[[attributedStr string] rangeOfString:@"点亮"].location !=NSNotFound) {
        NSRange contentRang = [showMessage rangeOfString:[NSString stringWithFormat:@"%@",contentStr]];
        contentRang.location = contentRang.location+1;
        [attributedStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1.0]range:contentRang];
    }
    // 计算level 位置
    NSRange leverRang = [contentStr rangeOfString:[NSString stringWithFormat:@"%@:",@"小金"]];
    leverRang.location = leverRang.location+2;
    [attributedStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1.0]range:leverRang];
    
    /*-------------------------------------富文本--------------------------------------- */
    
    chatLabel.attributedText = attributedStr;
    chatLabel.frame = [showMessage boundingRectWithSize:CGSizeMake(320, 500)
                                                options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                             attributes:attributes
                                                context:nil];

    
    // 背景颜色
    levelTagImage.frame = CGRectMake(0, 0, 20, 16);
    levelTagImage.layer.cornerRadius = 2;
    levelTagImage.layer.masksToBounds = YES;
    [chatLabel sendSubviewToBack:levelTagImage];
    levelTagImage.backgroundColor = UIColorFromHex(0x7F9DFF);
    
    return self;
}

@end
