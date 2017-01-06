//
//  MuSortByCharacterView.h
//  MuVRProject
//
//  Created by Mac mini -1 on 16/8/31.
//  Copyright © 2016年 muvr. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SortViewWidth 32
#define SortViewHeight 420
#define CharacterHeight 16
#define CharacterSize 13

@protocol LBSortByCharacterViewDelegate <NSObject>

///点击了某个字母
-(void)clickedTheSortCharacter:(NSString*)character;

@end

@interface LBSortByCharacterView : UIScrollView

@property(nonatomic,weak)id<LBSortByCharacterViewDelegate> SortDelegate;

/********* 自定义属性 *********/
///字母大小
@property(nonatomic,assign)CGFloat characterSize;
///字母行高
@property(nonatomic,assign)CGFloat characterHeight;
///字母宽度
@property(nonatomic,assign)CGFloat characterWidth;
///未选中的字母颜色
@property(nonatomic,strong)UIColor *normalColor;
///选中的字母颜色
@property(nonatomic,strong)UIColor *selectedColor;

///初始化字母索引视图
+(instancetype)sortByCharacterView;

@end
