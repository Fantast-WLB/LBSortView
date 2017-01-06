//
//  MuSortByCharacterView.m
//  MuVRProject
//
//  Created by Mac mini -1 on 16/8/31.
//  Copyright © 2016年 muvr. All rights reserved.
//

#import "LBSortByCharacterView.h"
#import "UIView+LBEtr.h"

@interface LBSortByCharacterView ()

///label数组
@property(nonatomic,strong)NSMutableArray* labelArr;

///选中的字母
@property(nonatomic,strong)UILabel* selectedLabel;



@end

@implementation LBSortByCharacterView

#pragma mark - init
///初始化字母索引视图
+(instancetype)sortByCharacterView
{
    LBSortByCharacterView* view = [LBSortByCharacterView new];
    
    [view setUpTheCharacter];
    
    return view;
}



#pragma mark - PrivateMethods
-(void)setUpTheCharacter
{
    CGFloat y = 0;
    
    for (int i = 65; i < 91; i++)
    {
        UILabel* label = [[UILabel alloc]init];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:self.characterSize == 0 ? CharacterSize : self.characterSize];
        label.textColor = self.normalColor ? self.normalColor : [UIColor lightGrayColor];
        label.text = [NSString stringWithFormat:@"%C",(unichar)i];
        label.frame = CGRectMake(0, y, self.characterWidth == 0 ? SortViewWidth : self.characterWidth, self.characterHeight == 0 ? CharacterHeight : self.characterHeight);
        [self addSubview:label];
        y += label.height;
        [self.labelArr addObject:label];
    }
    
    self.contentSize = CGSizeMake(SortViewWidth, y);
}

///选中一个字母
-(void)selectTheLabel:(UILabel*)label
{
    if (label == self.selectedLabel)
    {
        return;
    }
    
    self.selectedLabel.textColor = self.normalColor ? self.normalColor : [UIColor lightGrayColor];
    label.textColor = self.selectedColor ? self.selectedColor : [UIColor redColor];
    self.selectedLabel = label;
    
    NSLog(@"选中了%@",label.text);
    
    if ([self.SortDelegate respondsToSelector:@selector(clickedTheSortCharacter:)])
    {
        [self.SortDelegate clickedTheSortCharacter:label.text];
    }
    
}



#pragma mark - Touch
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch* touch = [touches anyObject];
    CGPoint currentP = [touch locationInView:touch.view];
    [self.labelArr enumerateObjectsUsingBlock:^(UILabel*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop){
        if (CGRectContainsPoint(obj.frame, currentP))
        {
            [self selectTheLabel:obj];
        }
    }];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch* touch = [touches anyObject];
    CGPoint currentP = [touch locationInView:touch.view];
    [self.labelArr enumerateObjectsUsingBlock:^(UILabel*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop){
        if (CGRectContainsPoint(obj.frame, currentP))
        {
            [self selectTheLabel:obj];
        }
    }];
}



#pragma mark - LazyLoad
-(NSMutableArray *)labelArr
{
    if (_labelArr == nil)
    {
        _labelArr = [NSMutableArray arrayWithCapacity:26];
    }
    return _labelArr;
}

@end
