//
//  contentView.h
//  CatagoryCollectionView
//
//  Created by 吴玉铁 on 15/11/23.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHTCollectionViewWaterfallLayout.h"
@interface contentView : UICollectionView<UICollectionViewDataSource,CHTCollectionViewDelegateWaterfallLayout>

@end
