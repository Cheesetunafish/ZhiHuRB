//
//  MainPageTopScroll.h
//  DailyPaper
//
//  Created by 艾诗杰 on 2022/2/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainPageTopScroll : UIScrollView


//作者描述
@property (nonatomic, copy) UILabel *hint;
//图片
@property (nonatomic, copy) UIImageView *image;
//标题
@property (nonatomic, copy) UILabel *title;







@end

NS_ASSUME_NONNULL_END
