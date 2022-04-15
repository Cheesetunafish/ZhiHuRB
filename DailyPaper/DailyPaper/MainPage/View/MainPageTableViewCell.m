//
//  MainPage-TableViewCell.m
//  知乎日报
//
//  Created by 艾诗杰 on 2022/2/10.
//

#import "MainPageTableViewCell.h"

@implementation MainPageTableViewCell

//cell方法
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.title];
        [self.contentView addSubview:self.hint];
        [self.contentView addSubview:self.images];
    }
    return self;
}
//cell
//主标题
- (UILabel *)title{
    if (!_title) {
        _title = [[UILabel alloc] initWithFrame:CGRectMake(10, 13, 260, 50)];
        _title.numberOfLines = 0;
        _title.textColor = [UIColor colorNamed:@"28_28_28&&153_153_153"];
        _title.font = [UIFont boldSystemFontOfSize:17];
    }
    return _title;
}
//描述文字
- (UILabel *)hint{
    if (!_hint) {
        _hint = [[UILabel alloc] initWithFrame:CGRectMake(10, 55, 150, 30)];
        _hint.font = [UIFont systemFontOfSize:13];
        _hint.textColor = [UIColor grayColor];
    }
    return _hint;
}
//图片
- (UIImageView *)images{
    if (!_images) {
        _images = [[UIImageView alloc] initWithFrame:CGRectMake(300, 5, 70, 70)];
    }
    return _images;
}




@end
