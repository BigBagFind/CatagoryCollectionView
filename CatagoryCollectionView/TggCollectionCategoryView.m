//
//  TggCollectionCategoryView.m
//  白海带
//
//  Created by 吴玉铁 on 15/11/23.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import "TggCollectionCategoryView.h"
static NSString *identifier = @"contentCell";
@implementation TggCollectionCategoryView

- (instancetype)initWithFrame:(CGRect)frame Titles:(NSArray *)titles ContentViews:(NSArray *)contentViews{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentViews = contentViews;
        self.titles = titles;
        [self _createSubviews];
    }
    return self;
}

- (void)_createSubviews{
    //分类栏
    UIView *categoryView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 30)];
    categoryView.backgroundColor = [UIColor whiteColor];
    [self addSubview:categoryView];
    CGFloat itemWidth = kScreenWidth / self.titles.count;
    //分类栏按钮
    for (NSInteger i = 0; i < self.titles.count; i ++) {
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(i * itemWidth,0, itemWidth,categoryView.height)];
        [categoryView addSubview:button];
        [button setTitle:self.titles[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button addTarget:self action:@selector(selectedAction:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 300 + i;
        if (i == 0) {
            [button setTitleColor:[UIColor colorWithRed:16.0 / 255.0 green:120.0 / 255.0 blue:222.0 / 255.0 alpha:1] forState:UIControlStateNormal];
        }
    }
    //选择线条
    _selectedView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"list_bg_line"]];
    _selectedView.backgroundColor = kNavBarTintColor;
    _selectedView.frame = CGRectMake( 0, categoryView.height - 2, itemWidth, 2);
    [categoryView addSubview:_selectedView];
    _selectTag = 300;
    //底部视图创建
    CGFloat height = self.height - 30;
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(kScreenWidth,height);
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 30, kScreenWidth, height) collectionViewLayout:layout];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.backgroundColor = [UIColor yellowColor];
    _collectionView.pagingEnabled = YES;
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.showsHorizontalScrollIndicator = NO;
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:identifier];
    [self addSubview:_collectionView];
    //内容视图
//    for (NSInteger i = 0; i < self.titles.count; i ++) {
//        UIView *view = self.contentViews[i];
//        view.left = i * kScreenWidth;
//        [_collectionView addSubview:view];
//    }
    
    
}

#pragma mark－UICollectionView数据源和代理
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.titles.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.backgroundView = self.contentViews[indexPath.item];
    return cell;
}

- (void)selectedAction:(UIButton *)button{
    
    //先取消上一次的颜色
    UIButton *previousButton = (UIButton *)[self viewWithTag:_selectTag];
    [previousButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    //设置选中选项
    [button setTitleColor:[UIColor colorWithRed:40.0 / 255.0 green:142.0 / 255.0 blue:238.0 / 255.0 alpha:1] forState:UIControlStateNormal];
    CGFloat itemWidth = kScreenWidth / self.titles.count;
    //拿到对应内容列表
//    [UIView animateWithDuration:0.3 animations:^{
//        _selectedView.left = (button.tag - 300) * itemWidth;
//        
//    }];
    [UIView animateWithDuration:0.3 animations:^{
        _selectedView.left = (button.tag - 300) * itemWidth;
    } completion:^(BOOL finished) {
        [_collectionView setContentOffset:CGPointMake((button.tag - 300) * kScreenWidth, 0)];
    }];
    
    _selectTag = button.tag;
    //block传递目录值
    if (self.transPortCatagory) {
        NSString *catagory = [NSString stringWithFormat:@"%ld",button.tag - 300 + 1];
        self.transPortCatagory(catagory);
    }
    
}

#pragma mark-滑动视图代理
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    _selectedView.left = scrollView.contentOffset.x / self.titles.count;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger index = scrollView.contentOffset.x / kScreenWidth;
    UIButton *button = (UIButton *)[self viewWithTag:index + 300];
    [self selectedAction:button];
    
}

@end
