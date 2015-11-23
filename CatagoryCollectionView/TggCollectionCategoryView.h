//
//  TggCollectionCategoryView.h
//  白海带
//
//  Created by 吴玉铁 on 15/11/23.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^TransPortCatagory)(NSString *);
@interface TggCollectionCategoryView : UIView<UIScrollViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>{
    UIImageView *_selectedView;
    NSInteger _selectTag;
    UICollectionView *_collectionView;
}

@property (nonatomic,strong) NSArray *titles;
@property (nonatomic,strong) NSArray *contentViews;
@property (nonatomic,copy) TransPortCatagory transPortCatagory;//本次选择的目录值传递传来了，分别为1 2 3...

/*
 需要包下UIViewExt
 */
//初始化加入标题栏文字数组 和内容视图数组 即可
- (instancetype)initWithFrame:(CGRect)frame Titles:(NSArray *)titles ContentViews:(NSArray *)contentViews;



@end
