//
//  YFViewController.m
//  YFAdsSDK
//
//  Created by Jentle on 03/12/2024.
//  Copyright (c) 2024 Jentle. All rights reserved.
//

#import "YFViewController.h"

@interface YFViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray<NSDictionary<NSString *, NSString *> *> *dataArr;
@end

@implementation YFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configs];
    [self setupTable];
}

- (void)configs {
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"元坊SDK Demo";
}
- (void)setupTable {
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellid"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellid"];
    }
    cell.textLabel.text = self.dataArr[indexPath.row][@"title"];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.f;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *vc = [[NSClassFromString(self.dataArr[indexPath.row][@"targetVCName"]) alloc] init];
    vc.title = self.dataArr[indexPath.row][@"title"];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark - Lazyload
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        if (@available(iOS 15.0, *)) {
            _tableView.sectionHeaderTopPadding = 0;
        }
    }
    return _tableView;
}
- (NSArray<NSDictionary<NSString *,NSString *> *> *)dataArr {
    if (!_dataArr) {
        _dataArr = @[
            @{@"title":@"开屏", @"targetVCName": @"YFSplashViewController"},
            @{@"title":@"信息流", @"targetVCName": @"YFFeedExpressListViewController"},
        ];
    }
    return _dataArr;
}

@end
