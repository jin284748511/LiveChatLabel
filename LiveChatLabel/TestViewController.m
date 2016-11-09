//
//  TestViewController.m
//  LiveChatLabel
//
//  Created by fusion on 16/11/9.
//  Copyright © 2016年 com.qianrong.peppertv. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()<UITextFieldDelegate>
{
    UIView * cellView;
    UIImageView * imageView;
    UILabel *chatLabel;
    UITextField * atextField;
}
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    
    cellView = [[UIView alloc]initWithFrame:CGRectMake(10,80,300,0)];
    cellView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:cellView];
    
    chatLabel = [[UILabel alloc]init];
    chatLabel.numberOfLines = 0;
    chatLabel.lineBreakMode = NSLineBreakByCharWrapping;
    chatLabel.font = [UIFont systemFontOfSize:16];
    chatLabel.backgroundColor = [UIColor greenColor];
    [cellView addSubview:chatLabel];
    
    imageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 60, 20)];
    imageView.backgroundColor = [UIColor blueColor];
    [cellView addSubview:imageView];
    
    atextField = [[UITextField alloc]initWithFrame:CGRectMake(20, self.view.frame.size.height-300, self.view.frame.size.width-40, 30)];
    atextField.borderStyle = UITextBorderStyleRoundedRect;
    atextField.returnKeyType = UIReturnKeySend;
    atextField.delegate = self;
    atextField.placeholder = @"请输入文字";
    [self.view addSubview:atextField];
    // Do any additional setup after loading the view.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    // 4.计算位置显示
    NSMutableString * string = [self getOutputString:textField.text imageWidth:imageView.frame.size.width];
    CGSize size = [string boundingRectWithSize:CGSizeMake(300-10, MAXFLOAT)
                                       options:NSStringDrawingUsesLineFragmentOrigin
                                    attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]}
                                       context:nil].size;
    CGRect frame = cellView.frame;
    chatLabel.frame =CGRectMake(5, 5, 300-10, size.height);
    frame.size.height = CGRectGetMaxY(chatLabel.frame)+5;
    cellView.frame = frame;
    
    chatLabel.text = string;
    NSLog(@"string--%@",chatLabel.text);
    return YES;
}

// 1.计算单个空格的长度
-(CGFloat)widthOfOneSpace{
    NSString * str = @" ";
    CGFloat w = [str boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT)
                                  options:NSStringDrawingUsesLineFragmentOrigin
                               attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]}
                                  context:nil].size.width;
    return w;
}

// 2.根据单个空格的长度算出需要空格的个数
// 3.往现有字符串中插入指定个数的空格，从而空出图片的位置
-(NSMutableString*)getOutputString:(NSString*)string imageWidth:(CGFloat)imageWidth{
    NSInteger c = imageWidth / [self widthOfOneSpace] + 1;
    NSMutableString * mString = [NSMutableString stringWithString:string];
    for (int i = 0 ; i<c; i++) {
        [mString insertString:@" " atIndex:0];
    }
    return mString;
}


@end
