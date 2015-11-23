//
//  contentView.m
//  CatagoryCollectionView
//
//  Created by 吴玉铁 on 15/11/23.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import "contentView.h"


@implementation contentView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CHTCollectionViewWaterfallLayout *layout = [[CHTCollectionViewWaterfallLayout alloc]init];
        // 设置布局
        // layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        //layout.headerHeight = 100;           // headerView高度
        //layout.footerHeight = 100;           // footerView高度
        layout.columnCount  = 2;             // 几列显示
        layout.minimumColumnSpacing    = 5;  // cell之间的水平间距
        layout.minimumInteritemSpacing = 5;  // cell之间的垂直间距
        self.collectionViewLayout = layout;
        [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        //    [_collectionView registerClass:[UIView class]
        //        forSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader
        //               withReuseIdentifier:key1];
        //    [_collectionView registerClass:[UIView class]
        //        forSupplementaryViewOfKind:CHTCollectionElementKindSectionFooter
        //               withReuseIdentifier:key2];
        self.dataSource = self;
        self.delegate = self;
        self.backgroundColor = [UIColor greenColor];
    }
    return self;
}
//
//- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
//    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
//        CHTCollectionViewWaterfallLayout *layout = [[CHTCollectionViewWaterfallLayout alloc]init];
//        // 设置布局
//        // layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
//        //layout.headerHeight = 100;           // headerView高度
//        //layout.footerHeight = 100;           // footerView高度
//        layout.columnCount  = 2;             // 几列显示
//        layout.minimumColumnSpacing    = 5;  // cell之间的水平间距
//        layout.minimumInteritemSpacing = 5;  // cell之间的垂直间距
//        self.collectionViewLayout = layout;
//        [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
//        //    [_collectionView registerClass:[UIView class]
//        //        forSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader
//        //               withReuseIdentifier:key1];
//        //    [_collectionView registerClass:[UIView class]
//        //        forSupplementaryViewOfKind:CHTCollectionElementKindSectionFooter
//        //               withReuseIdentifier:key2];
//        _collectionView.dataSource = self;
//        _collectionView.delegate = self;
//        _collectionView.backgroundColor = [UIColor greenColor];
//    }
//    return self;
//}


- (void)creatCollectionView{
    
    
}

#pragma mark - UICollectionViewDelegate
//- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSLog(@"您点击了 %@", _dataSource[indexPath.row]);
//}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    // 数据源
    return 30;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    // 1个区
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 注册collectionViewCell
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    //    UIImage *image           = _dataSource[indexPath.row];
    //    cell.showImageView.image = image;
    cell.backgroundColor = [UIColor yellowColor];
    return cell;
}



#pragma mark - CHTCollectionViewDelegateWaterfallLayout
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 用以返回尺寸
    //    UIImage *image = _dataSource[indexPath.row];
    if (indexPath.item == 0) {
        return CGSizeMake(150, 100);
        
    }else{
        return CGSizeMake(150, 150);
    }
    
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}


@end
