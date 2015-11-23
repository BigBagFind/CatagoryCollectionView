//
//  ViewController.m
//  CatagoryCollectionView
//
//  Created by 吴玉铁 on 15/11/23.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import "ViewController.h"
#import "TggCatalogScrollView.h"
#import "TggCollectionCategoryView.h"
#import "contentView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    NSArray *titles = @[@"1",@"2",@"3",@"4",@"5"];
    NSMutableArray *views = [NSMutableArray array];
    for (NSInteger i = 0; i < titles.count; i ++) {
       // contentView *view = [[contentView alloc]initWithFrame:CGRectMake(0, 50, kScreenWidth, kScreenHeight - 80)];
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 80)];
        view.layer.cornerRadius = 100;
        view.backgroundColor = [UIColor purpleColor];
        [views addObject:view];
        
    }
//
   // TggCollectionCategoryView *categoryView = [[TggCollectionCategoryView alloc]initWithFrame:CGRectMake(0, 50, kScreenWidth, kScreenHeight - 50) Titles:titles ContentViews:views];
    TggCatalogScrollView *categoryView = [[TggCatalogScrollView alloc]initWithFrame:CGRectMake(0, 50, kScreenWidth, kScreenHeight - 50) Titles:titles ContentViews:views];
    [self.view addSubview:categoryView];
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
