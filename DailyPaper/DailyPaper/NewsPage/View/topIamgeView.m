//
//  topIamgeView.m
//  DailyPaper
//
//  Created by cheeseTunaFish on 2022/2/24.
//

#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height
#import "topIamgeView.h"

@implementation topIamgeView

- (instancetype)initWithTopIMage{
    self = [super self];
    if (self) {
        self.frame = CGRectMake(0, 0,SCREENWIDTH , SCREENHEIGHT);
        [self addSubview:self.Pic];
    }
    return self;
}

- (UIImageView *)Pic{
    if (!_Pic) {
        _Pic = [[UIImageView alloc] init];
        
        _Pic.backgroundColor = [UIColor blueColor];
    }
    return _Pic;
}
@end
