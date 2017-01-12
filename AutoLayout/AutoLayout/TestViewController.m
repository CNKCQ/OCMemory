//
//  TestViewController.m
//  AutoLayout
//
//  Created by Jack on 15/11/1.
//  Copyright © 2015年 Jack. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong)UITableView *tableview;

@end

@implementation TestViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    _tableview = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    [_tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    UIView *footerView = [[UIView alloc] init];
    _tableview.tableFooterView = footerView;
    [self.view addSubview:_tableview];
    
}

#pragma mark - dataSource for tableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"cell test --  %ld",(long)indexPath.row];
    
    return cell;
}

@end
