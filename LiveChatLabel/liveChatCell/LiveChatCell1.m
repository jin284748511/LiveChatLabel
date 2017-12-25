//
//  LiveChatCell1.h
//  LiveChatLabel
//
//  Created by fusion on 16/11/8.
//  Copyright © 2016年 com.qianrong.peppertv. All rights reserved.
//

#import "LiveChatCell1.h"

@implementation LiveChatCell1

-(UILabel *)chatLabel{
    if (!_chatLabel) {
        _chatLabel = [[UILabel alloc]init];
    }
    return _chatLabel;
}

-(UIImageView *)levelTagImage{
    if (!_levelTagImage) {
        _levelTagImage = [[UIImageView alloc]init];
    }
    return _levelTagImage;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.chatLabel.frame = self.contentView.bounds;
        self.chatLabel.textColor = [UIColor blueColor];
        self.chatLabel.numberOfLines = 0 ;
        
        // 等级图标
        self.levelTagImage = [[UIImageView alloc] init];
        self.levelTagImage.frame = CGRectMake(0, 10, 50, 16);
        self.levelTagImage.layer.cornerRadius = 2;
        self.levelTagImage.layer.masksToBounds = YES;
        self.levelTagImage.backgroundColor = [UIColor redColor];
        [self.chatLabel addSubview:self.levelTagImage];
        [self.chatLabel sendSubviewToBack:self.levelTagImage];

        
        //富文本
        NSMutableAttributedString * attributedStr = [[NSMutableAttributedString alloc]initWithString:@"[image]等级 名字：内容上刊登了符合无客户反馈无法不可说的部分可USB热备份库尔少入库vbdbvdksfbvedfveukrvkudfv的尽快答复和不快点的开"];
        NSTextAttachment * attachment = [[NSTextAttachment alloc]init];
        UIImage * image = [UIImage imageNamed:@"rank_06"];
        attachment.image = image;
        NSAttributedString * text = [NSAttributedString attributedStringWithAttachment:attachment];
        NSRange range = [[attributedStr string]rangeOfString:@"[image]"];
        [attributedStr replaceCharactersInRange:range withAttributedString:text];
        
        self.chatLabel.attributedText = attributedStr;
        self.chatLabel.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.frame.size.height+50);
        [self.contentView addSubview:self.chatLabel];
    }
    return self;
}

@end
