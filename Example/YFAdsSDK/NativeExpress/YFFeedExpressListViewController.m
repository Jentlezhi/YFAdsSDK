//
//  YFFeedExpressListViewController.m
//  YFAdsSDK_Example
//
//  Created by Jentle-Zhi on 2024/3/13.
//  Copyright © 2024 Jentle. All rights reserved.
//

#import "YFFeedExpressListViewController.h"
#import "Masonry.h"
#import "YYFNativeRenderVideoDemoView.h"
#import "YYFNativeRenderNormalDemoView.h"
#import "YFMulNativeExpressConentViewController.h"

@interface YFFeedExpressListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray<NSDictionary<NSString *, NSString *> *> *dataArr;
@end

@implementation YFFeedExpressListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTable];
}



- (void)setupTable {
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
    }];
}

#pragma mark - YFGDTNativeExpressDelegate



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
    NSInteger index = indexPath.row;
    YFMulNativeExpressConentViewController *contentVC = [YFMulNativeExpressConentViewController new];
    contentVC.actionIndex = index;
    [self.navigationController pushViewController:contentVC animated:YES];
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
            @{@"title":@"自渲染演示", @"index": @(0)},
        ];
    }
    return _dataArr;
}

@end
