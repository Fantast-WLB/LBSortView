//
//  ViewController.m
//  LBSortView
//
//  Created by BO'S MINI on 17/1/6.
//  Copyright © 2017年 whatTheGhost. All rights reserved.
//

#import "ViewController.h"

#import "LBSortByCharacterView.h"

@interface ViewController ()<LBSortByCharacterViewDelegate>

@property(nonatomic,strong)LBSortByCharacterView *sortView;


@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.sortView = [LBSortByCharacterView sortByCharacterView];
    self.sortView.SortDelegate = self;
    
    self.sortView.frame = CGRectMake(100, 100, 40, 500);
    
//    自定义滚动区间
//    self.sortView.contentSize = CGSizeMake(SortViewWidth, SortViewHeight + 100);
    
    [self.view addSubview:self.sortView];
    
    LBSortByCharacterView *sort = [LBSortByCharacterView sortByCharacterView];
    sort.frame = CGRectMake(150, 100, 40, 100);
    [self.view addSubview:sort];
}

///点击了某个字母
-(void)clickedTheSortCharacter:(NSString*)character
{
    NSLog(@"选中了：%@",character);
    self.resultLabel.text = [NSString stringWithFormat:@"选中了：%@",character];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
