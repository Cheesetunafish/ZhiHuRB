//
//  TopView.m
//  DailyPaper
//
//  Created by cheeseTunaFish on 2022/2/17.
//
#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height
#import "TopView.h"
#import "Masonry.h"

@implementation TopView

//初始化
- (instancetype)initWithTopView{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorNamed:@"255_255_255&&26_26_26"];//黑夜模式
        self.frame = CGRectMake(0, 0, SCREENWIDTH, 100);
        [self addSubview:self.dayNumber];
        [self addSubview:self.monthNumber];
        [self addSubview:self.Line];
        [self addSubview:self.title];
        [self addSubview:self.personalBtn];
        [self timeData];
    }
    return self;
}


- (UILabel *)title{
    if (!_title) {
        _title = [[UILabel alloc] initWithFrame:CGRectMake(80, 45, 100, 40)];
//        [_title mas_makeConstraints:^(MASConstraintMaker *make) {
//                  make.left.equalTo(self).mas_offset(80);
//                  make.left.equalTo(self).offset(0)
//                  make.bottom.equalTo(self).mas_offset(15);
//                    make.center.mas_equalTo((self));
//                    make.size.mas_equalTo(CGSizeMake(100, 40));
//        }];
        _title.font = [UIFont boldSystemFontOfSize:23];
    }
    return _title;
}


//日期
- (UILabel *)dayNumber{
    if (!_dayNumber) {
        _dayNumber = [[UILabel alloc] initWithFrame:CGRectMake(10, 45, 50, 20)];
        _dayNumber.textColor = [UIColor colorNamed:@"68_68_68&&128_128_128"];//黑夜
        _dayNumber.textAlignment = NSTextAlignmentCenter;//居中
        _dayNumber.font = [UIFont boldSystemFontOfSize:20];
    
    }
    return _dayNumber;
}

//月份
- (UILabel *)monthNumber{
    if (!_monthNumber) {
        _monthNumber = [[UILabel alloc] initWithFrame:CGRectMake(10, 65, 50, 20)];
        _monthNumber.textColor = [UIColor colorNamed:@"68_68_68&&128_128_128"];
        _monthNumber.textAlignment = NSTextAlignmentCenter;//居中
        _monthNumber.font = [UIFont systemFontOfSize:15];
    }
    return _monthNumber;
}

- (UILabel *)Line{
    if (!_Line) {
        _Line = [[UILabel alloc] initWithFrame:CGRectMake(65, 45, 5, 40)];
        _Line.textColor = [UIColor colorNamed:@"211_211_211&&68_68_68"];
        _Line.text = @"|";
        _Line.font = [UIFont systemFontOfSize:60];
    }
    return _Line;
}


- (UIButton *)personalBtn{
    if (!_personalBtn) {
        _personalBtn = [[UIButton alloc] initWithFrame:CGRectMake(320, 45, 50, 50)];
//        _personalBtn.backgroundColor = [UIColor yellowColor];
//        _personalBtn.layer.masksToBounds = YES;
        _personalBtn.layer.cornerRadius = 25;
        [_personalBtn setBackgroundImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];//test
        [_personalBtn addTarget:self.delegate action:@selector(jumpPage) forControlEvents:UIControlEventTouchUpInside];
    }
    return _personalBtn;
}

//- (void)jumgPage:(UIButton *)button{
//}

//获取时间
- (void)timeData{
    NSDate *date = [[NSDate alloc] init];//当前时间
    NSCalendar *canlendar = [NSCalendar currentCalendar];//当前用户的calendar
    self.components = [canlendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour fromDate:date];
    NSInteger month = [self.components month];
    NSInteger day = [self.components day];
    NSInteger hour = [self.components hour];
//    NSInteger year = [self.components year];
//    NSLog(@"%lu%02lu%02lu",year, month, day);
    switch (month) {
        case 1:
            self.monthNumber.text = @"一月";
            break;
        case 2:
            self.monthNumber.text = @"二月";
            break;
        case 3:
            self.monthNumber.text = @"三月";
            break;
        case 4:
            self.monthNumber.text = @"四月";
            break;
        case 5:
            self.monthNumber.text = @"五月";
            break;
        case 6:
            self.monthNumber.text = @"六月";
            break;
        case 7:
            self.monthNumber.text = @"七月";
            break;
        case 8:
            self.monthNumber.text = @"八月";
            break;
        case 9:
            self.monthNumber.text = @"九月";
            break;
        case 10:
            self.monthNumber.text = @"十月";
            break;
        case 11:
            self.monthNumber.text = @"十一月";
            break;
        default:
            self.monthNumber.text = @"十二月";
            break;
    }
    self.dayNumber.text = [NSString stringWithFormat:@"%2ld",(long)day];
    if (hour >= 12 && hour <= 18) {
        self.title.text = @"下午好！";
    }
    else if (hour > 18 && hour < 24) {
        self.title.text = @"晚上好！";
    }
    else self.title.text = @"知乎日报";
    NSLog(@"hour:%ld",hour);

}
    
    
@end
