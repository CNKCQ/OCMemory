//
//  ViewController.m
//  SearchMe
//
//  Created by Jack on 16/3/12.
//  Copyright © 2016年 Jack. All rights reserved.
//

static const int CELLHEIGHT = 54;

#import "ViewController.h"
#import "WordModel.h"
#import "DataTool.h"
#import "RSAEncrypt.h"
#import "MJRefresh.h"

@interface ViewController ()<UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UISearchBar *searchBar;

@property (nonatomic, strong)UITableView *tableVeiw;

@property (nonatomic, copy)NSArray *wordArrays;

@property (nonatomic, assign)NSUInteger page;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    _page = 1;
    [self setNavigationSearchBar];
    [self addContentView];


}
- (void)setNavigationSearchBar{
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:0.000 green:0.533 blue:1.000 alpha:1.00]];
    // 中间的搜索框
    UISearchBar *searchBar = [[UISearchBar alloc] init];
    searchBar.placeholder = @"请输入关键词";
    searchBar.delegate = self;
    _searchBar = searchBar;
    self.navigationItem.titleView = _searchBar;
}
- (void)addContentView{
    _tableVeiw = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableVeiw.backgroundColor = UIColor.redColor;
    
    UIView *footerView = [[UIView alloc] init];
    self.tableVeiw.tableFooterView = footerView;
    self.tableVeiw.dataSource = self;
    self.tableVeiw.delegate = self;
//    [self.tableVeiw :self action:@selector(pullRefresh)]
    ;
    
    self.tableVeiw.mj_header = ({
        MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(pullRefresh)];
        header.lastUpdatedTimeLabel.hidden = YES;
        header.stateLabel.hidden = YES;
        header;
    });
    [self.view addSubview:_tableVeiw];
    
}

#pragma mark - 搜索框代理

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    self.wordArrays = [[DataTool sharedDataTool] queryWordsFromKeyWord:searchBar.text page:nil];
    [self.tableVeiw reloadData];
}

- (void)pullRefresh{
    _page++ ;
    NSMutableArray *mutableArray = [[NSMutableArray alloc] init];
//    [mutableArray addObjectsFromArray:self.wordArrays];
    [mutableArray addObjectsFromArray:[[DataTool sharedDataTool] queryWordsFromKeyWord:nil page:[NSString stringWithFormat:@"%lu",(unsigned long)_page*10]]];
    self.wordArrays = mutableArray;
    [self.tableVeiw reloadData];
    [self.tableVeiw.mj_header endRefreshing];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.wordArrays.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
//    NSString *identifier = NSStringFromClass([UITableViewCell class]);
    static NSString *identifier = nil;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    WordModel *word = self.wordArrays[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = word.keyWord;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@\t\t\t\t\t\t%@",word.translation,word.weight];
    
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    RSAEncrypt *rsaEncrypt = [RSAEncrypt sharedRSAEncrypt];
    
    [rsaEncrypt loadPublicKeyWithPath:[[NSBundle mainBundle] pathForResource:@"public_key" ofType:@"der"]];
    NSString *encryptString = [rsaEncrypt rsaEncryptText:@"123456你是怎么搜到我的"];
    NSLog(@"RSA加密：123456你是怎么搜到我的:%@", encryptString);
    [rsaEncrypt loadPrivateKeyWithPath:[[NSBundle mainBundle] pathForResource:@"private_key" ofType:@"p12"] password:@"wcqvip"];
    NSLog(@"RSA解密结果为：%@", [rsaEncrypt rsaDecryptText:encryptString]);
    
    NSLog(@"%.4f",3.1415926);

    [_searchBar resignFirstResponder];
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [_searchBar resignFirstResponder];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CELLHEIGHT;
}

- (NSArray *)wordArrays{
    if (!_wordArrays) {

        self.wordArrays = [[DataTool sharedDataTool] queryWordsFromKeyWord:nil page:nil];
    }
    return _wordArrays;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
