//
//  ViewController.m
//  LiveChatLabel
//
//  Created by fusion on 16/11/8.
//  Copyright © 2016年 com.qianrong.peppertv. All rights reserved.
//

#import "ViewController.h"
#import "LiveChatCell1.h"
#import "LiveChatCell2.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView * tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource=self;
    [self.view addSubview:self.tableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    static NSString * strCell = @"LiveChatCell";
//    LiveChatCell1 * cell = [tableView dequeueReusableCellWithIdentifier:strCell];
//    if (!cell) {
//        cell = [[LiveChatCell1 alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strCell];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    }
//    
//    return cell;
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    LiveChatCell2 *cell = [LiveChatCell2 cellWithtableView:self.tableView];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
