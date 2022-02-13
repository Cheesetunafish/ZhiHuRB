//
//  MainPageTopScroll.m
//  DailyPaper
//
//  Created by 艾诗杰 on 2022/2/13.
//

#import "MainPageTopScroll.h"

@implementation MainPageTopScroll

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (UILabel *)title{
    if (!_title) {
        _title = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 13, 20)];
    }
    return _title;
}



@end
