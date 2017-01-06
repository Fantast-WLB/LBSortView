# LBSortView
View to sort by character.

# Usage
Here is how you can use it:

        self.sortView = [LBSortByCharacterView sortByCharacterView];
        self.sortView.SortDelegate = self;
        self.sortView.frame = CGRectMake(100, 100, 40, 500);

# LBSortByCharacterViewDelegate
        
        ///点击了某个字母
        -(void)clickedTheSortCharacter:(NSString*)character
        {
            NSLog(@"选中了：%@",character);
            self.resultLabel.text = [NSString stringWithFormat:@"选中了：%@",character];
        }
        
# Custom the view

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
        
        
# Effect Picture
![image](https://github.com/Fantast-WLB/LBSortView/blob/master/LBSortView/ezgif.com-video-to-gif.gif)


