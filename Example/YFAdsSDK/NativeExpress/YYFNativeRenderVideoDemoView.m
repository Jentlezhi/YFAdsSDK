//
//  YYFNativeRenderVideoDemoView.m
//  YFAdsSDKDemo
//
//  Created by Jentle-Zhi on 2024/3/28.
//

#import "YYFNativeRenderVideoDemoView.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"

@interface YYFNativeRenderVideoDemoView()

@property(nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, strong) UIImageView *logo;
@property(nonatomic, strong) UILabel *logoDescLabel;

@end

@implementation YYFNativeRenderVideoDemoView

- (instancetype)init {
    if (self = [super init]) {
    }
    return self;
}

#pragma mark - Lazyload
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:14.f];
        _titleLabel.textColor = UIColor.whiteColor;
        _titleLabel.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4f];
    }
    return _titleLabel;
}
- (UIImageView *)logo {
    if (!_logo) {
        _logo = [UIImageView new];
        _logo.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _logo;
}
- (UILabel *)logoDescLabel {
    if (!_logoDescLabel) {
        _logoDescLabel = [UILabel new];
        _logoDescLabel.font = [UIFont systemFontOfSize:12.f];
        _logoDescLabel.textColor = [UIColor.blackColor colorWithAlphaComponent:0.8];
        _logoDescLabel.text = @"广告";
    }
    return _logoDescLabel;
}
- (UILabel *)clickedView {
    if (!_clickedView) {
        _clickedView = [UILabel new];
        _clickedView.text = @"查看详情";
        _clickedView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        _clickedView.textColor = UIColor.whiteColor;
        _clickedView.textAlignment = NSTextAlignmentCenter;
    }
    return _clickedView;
}

- (void)setObject:(YFNativeRenderObject *)object {
    _object = object;
    NSString *source;
    if (object.supplierType == YFSupplierTypeBQT) {
        source = @"百青藤";
    } else if (object.supplierType == YFSupplierTypeKS) {
        source = @"快手";
    } else if (object.supplierType == YFSupplierTypeYLH) {
        source = @"优量汇";
    }
    NSString *temp = object.title ? object.title : @"暂无标题";
    NSString *title = [NSString stringWithFormat:@"广告来源：%@ 广告标题：%@",source,temp];
    self.titleLabel.text = title;
    if (object.actionTitle) {
        self.clickedView.text = object.actionTitle;
    }
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.inset(10.f);
    }];
    
    [self addSubview:self.logoDescLabel];
    [self.logoDescLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.videoView.mas_bottom);
        make.right.bottom.inset(10.f);
    }];
    [self addSubview:self.logo];
    [self.logo sd_setImageWithURL:[NSURL URLWithString:object.logoUrl]];
    [self.logo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.logoDescLabel);
        make.right.equalTo(self.logoDescLabel.mas_left).offset(-5.f);
        make.width.height.mas_equalTo(20.f);
    }];
    [self addSubview:self.clickedView];
    [self.clickedView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.height.mas_equalTo(50.f);
    }];
}
- (NSArray <UIView*> *)clickedViews {
    return @[self.clickedView];
}
@end
