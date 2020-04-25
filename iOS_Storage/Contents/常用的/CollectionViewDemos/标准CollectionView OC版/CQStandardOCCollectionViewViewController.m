//
//  CQStandardOCCollectionViewViewController.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/7/25.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "CQStandardOCCollectionViewViewController.h"
#import "CQStandardOCCollectionViewCell.h"
#import "CQStandardOCCollectionSectionHeaderView.h"
#import "CQStandardOCCollectionSectionFooterView.h"
#import "CQStandardOCCollectionHeaderView.h"
#import "CQStandardOCCollectionFooterView.h"

@interface CQStandardOCCollectionViewViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) CQStandardOCCollectionHeaderView *headerView;
@property (nonatomic, strong) CQStandardOCCollectionFooterView *footerView;

@end

static NSString * const kCellReuseID = @"kCellReuseID";
static NSString * const kHeaderReuseID = @"kHeaderReuseID";
static NSString * const kFooterReuseID = @"kFooterReuseID";

@implementation CQStandardOCCollectionViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    // 设置滚动方向，横向 or 竖向
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.collectionView.frame = CGRectMake(0, NAVIGATION_BAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - NAVIGATION_BAR_HEIGHT);
    [self.view addSubview:self.collectionView];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.backgroundColor = [UIColor blueColor];
    [self.collectionView registerClass:[CQStandardOCCollectionViewCell class] forCellWithReuseIdentifier:kCellReuseID];
    [self.collectionView registerClass:[CQStandardOCCollectionSectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kHeaderReuseID];
    [self.collectionView registerClass:[CQStandardOCCollectionSectionFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:kFooterReuseID];
    
    // 间接设置表头
    self.collectionView.contentInset = UIEdgeInsetsMake(200, 0, 150, 0);
    // 表头
    self.headerView = [[CQStandardOCCollectionHeaderView alloc] init];
    [self.collectionView addSubview:self.headerView];
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(0);
    }];
    __weak typeof(self) weakSelf = self;
    self.headerView.layoutBlock = ^{
        __strong typeof(self) strongSelf = weakSelf;
        CGFloat topEdge = strongSelf.headerView.height;
        strongSelf.collectionView.contentInset = UIEdgeInsetsMake(topEdge, 0, 0, 0);
        [strongSelf.headerView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(-topEdge);
        }];
        [strongSelf.collectionView scrollToTop];
    };
    
    // 表尾
    //    self.footerView = [[CQStandardOCCollectionFooterView alloc] init];
    //    [self.collectionView addSubview:self.footerView];
}

//- (void)viewWillLayoutSubviews {
//    [super viewWillLayoutSubviews];
//
//    [self.footerView mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 150));
//        make.left.right.bottom.mas_equalTo(self.collectionView);
//    }];
//}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"%@", NSStringFromCGPoint(scrollView.contentOffset));
}

// cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CQStandardOCCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellReuseID forIndexPath:indexPath];
    return cell;
}

// 每组的cell个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 9;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}

// 设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((self.view.frame.size.width - 66)/3, (self.view.frame.size.width - 61)/3);
}

// 设置每个组的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(20, 12, 8, 12); // top, left, bottom, right;
}

// 设置每个item最小水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

// 设置每个item最小垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 20;
}

// 组头size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(SCREEN_WIDTH, 60);
}

// 组尾size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeMake(SCREEN_WIDTH, 30);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (kind == UICollectionElementKindSectionHeader) {
        return [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:kHeaderReuseID forIndexPath:indexPath];
    } else {
        return [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:kFooterReuseID forIndexPath:indexPath];
    }
}

@end
