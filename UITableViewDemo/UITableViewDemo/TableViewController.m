//
//  TableViewController.m
//  UITableViewDemo
//
//  Created by Jack on 15/8/26.
//  Copyright © 2015年 Jack. All rights reserved.
//

#import "TableViewController.h"
#import "UIImageView+WebCache.h"
#import "TableCell.h"
#import <Foundation/NSObject.h>
@interface TableViewController()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;
//@property (nonatomic, copy) NSString *str;

@end

@implementation TableViewController
__weak id reference = nil;
- (void)viewDidLoad{
    [super viewDidLoad];
    
    
    for (NSInteger i = 0; i < 500000; i++) {
    
        @autoreleasepool {
         id __autoreleasing str = [NSString stringWithFormat:@"hello world"];
            NSLog(@"里面-%@",str);
            reference = str;
        }
//        NSLog(@"外面-%@",str);
    }
    
    NSPort *port = [[NSPort alloc] init];
    NSLog(@"port is -- %@",port);
    self.view.backgroundColor = [UIColor orangeColor];
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[TableCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];

    [self.view addSubview:_tableView];

}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"%@",reference);
    
    
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"%@",reference);
}
#pragma mark - dataSource for tableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 9;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    // 情景二：采用网络图片实现
    NSArray *imagesURLStrings = @[
                                  @"http://img.taihuwang.com/nvxing/uploads/20160222/vrg3le5vv5v.jpg",
                                  @"http://img2.mtime.cn/up/1360/739360/C62037AC-30B1-4B27-A0F9-CD139A52F47F_o.jpg",
                                  @"http://img.pingxiaow.com.cn/hot/uploadfile/2016/0221/20160221101620827.jpg",
                                  @"http://www.gaotang.cc/tp/2016/0115/0940352466.png",
                                  @"http://n1.itc.cn/img8/wb/recom/2016/02/05/145463227003987439.JPEG",
                                  @"http://www.fyjs.cn/data/attachment/forum/201510/26/134854fd4kzvojytdptfdy.jpg",
                                  @"http://wap.66wz.com/uploads/2014/01/9NP01TPM00AJ0003.jpg",
                                  @"http://image.tianjimedia.com/uploadImages/2015/043/30/271OP3143U4I_1000x500.jpg",
                                    @""
                                  ];
    NSArray *imageTitles = @[@"张馨予",@"张柏芝",@"张雨绮",@"大S",@"刘亦菲",@"林志玲",@"柳岩",@"王丽坤",@"无名氏"];
//    [cell.imgView sd_setImageWithURL:[NSURL URLWithString:imagesURLStrings[indexPath.row]] placeholderImage:nil options:nil];
    cell.imgView.image = [UIImage imageWithContentsOfFile:imagesURLStrings[indexPath.row]];

    cell.discLabel.text = imageTitles[indexPath.row];
    return cell;
}



#pragma mark - delegate for tableView
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 150;
}


@end
