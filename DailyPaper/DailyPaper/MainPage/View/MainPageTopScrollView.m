//
//  MainPageTopScrollView.m
//  DailyPaper
//
//  Created by cheeseTunaFish on 2022/2/19.
//
#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height
#import "MainPageTopScrollView.h"
#import "Masonry.h"
@implementation MainPageTopScrollView


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 400)];
        [self addSubview:self.image];
        
        self.hint = [[UILabel alloc] initWithFrame:CGRectMake(20, 350, SCREENWIDTH, 30)];
        self.hint.textColor = [[UIColor whiteColor] colorWithAlphaComponent:0.8];
        [self addSubview:self.hint];
        
        self.title = [[UILabel alloc] initWithFrame:CGRectMake(20, 270, SCREENWIDTH - 50, 100)];
        self.title.numberOfLines = 0;
        self.title.font = [UIFont boldSystemFontOfSize:23];
        self.title.textColor = [UIColor whiteColor];
        [self addSubview:self.title];
        
        self.theId = [NSString string];
        
    }
    return self;
}




@end
