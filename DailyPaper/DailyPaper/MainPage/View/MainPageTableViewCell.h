//
//  MainPage-TableViewCell.h
//  知乎日报
//
//  Created by 艾诗杰 on 2022/2/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainPageTableViewCell : UITableViewCell

//新闻标题
@property (nonatomic, strong) UILabel *title;
//描述
@property (nonatomic, strong) UILabel *hint;
//图片
@property (nonatomic, strong) UIImageView *images;



@end

NS_ASSUME_NONNULL_END
