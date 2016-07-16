//
//  JHMeController.m
//  支付宝
//
//  Created by 赖锦浩 on 16/4/29.
//  Copyright © 2016年 赖锦浩. All rights reserved.
//

#import "JHMeController.h"
#import "JHUserCell.h"
@interface JHMeController ()<UITableViewDataSource,UITableViewDelegate>
/** tableView  */
@property (nonatomic,weak) UITableView *tableView;
@end

@implementation JHMeController
static NSString * const OneCellID = @"JHUserCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"我的";
    //创建一个tableView对象
    UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
     //设置代理和数据源
    tableView.delegate = self;
    tableView.dataSource = self;
    self.tableView = tableView;
    [self.view addSubview:tableView];
    self.tableView.rowHeight = 100;
    //注册cell
    [self setupRegister];
}

//注册
- (void)setupRegister
{
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([JHUserCell class]) bundle:nil] forCellReuseIdentifier:OneCellID];
}

#pragma mark - dataSoure
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JHUserCell *cell = [tableView dequeueReusableCellWithIdentifier:OneCellID];

    return cell;
    
}

@end
