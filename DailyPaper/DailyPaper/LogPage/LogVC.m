//
//  LogVC.m
//  DailyPaper
//
//  Created by cheeseTunaFish on 2022/2/22.
//

#import "LogVC.h"
#import "MainVC.h"
#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height
@interface LogVC ()<LogVCDeletage>

@property (nonatomic, strong) UIButton *rturn;
@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) UILabel *log;
@property (nonatomic, strong) UILabel *chooseWay;
@property (nonatomic, strong) UIButton *zhihu;
@property (nonatomic, strong) UIButton *weibo;
@property (nonatomic, strong) UIButton *apple;
@property (nonatomic, strong) UIButton *circle;
@property (nonatomic, strong) UILabel *agree;
@property (nonatomic, strong) UIButton *zhidele;
@property (nonatomic, strong) UIButton *inform;
@property (nonatomic, strong) UIButton *night;
@property (nonatomic, strong) UIButton *setting;

@property (nonatomic, strong) UIButton *back;

@end

@implementation LogVC

- (void)viewDidLoad {
    [super viewDidLoad];
}



- (instancetype)initWithPage{
    self = [super init];
    if (self) {
        [self.view addSubview:self.log];
        [self.view addSubview:self.window];
        [self.window makeKeyAndVisible];
        [self.view addSubview:self.chooseWay];
        [self.view addSubview:self.zhihu];
        [self.view addSubview:self.weibo];
        [self.view addSubview:self.apple];
        [self.view addSubview:self.circle];
        [self.view addSubview:self.agree];
        [self.view addSubview:self.zhidele];
        [self.view addSubview:self.inform];
        [self.view addSubview:self.night];
        [self.view addSubview:self.setting];
        
        [self.view addSubview:self.back];
        
    }
    return self;
}
#pragma mark-懒加载
- (UIButton *)back{
    if (!_back) {
        _back = [[UIButton alloc] init];
        [_back setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        _back.frame = CGRectMake(20, 50, 20, 20);
        [_back addTarget:self.delegate action:@selector(backMainPage) forControlEvents:UIControlEventTouchUpInside];
    }
    return _back;
}

- (UILabel *)log{
    if (!_log) {
        _log = [[UILabel alloc] initWithFrame:CGRectMake(130, 200, 150, 70)];
        _log.text = @"登陆知乎日报";
        _log.textColor = [UIColor colorNamed:@"28_28_28&&153_153_153"];
        _log.font = [UIFont boldSystemFontOfSize:23];
    }
    return _log;
}

- (UILabel *)chooseWay{
    if (!_chooseWay) {
        _chooseWay = [[UILabel alloc] initWithFrame:CGRectMake(150, 240, 150, 50)];
        _chooseWay.textColor = [UIColor colorNamed:@"154_154_154&&100_100_100"];
        _chooseWay.text = @"选择登陆方式";
        _chooseWay.font = [UIFont systemFontOfSize:16];
    }
    return _chooseWay;
}

- (UIButton *)zhihu{
    if (!_zhihu) {
        _zhihu = [[UIButton alloc] init];
        _zhihu.frame = CGRectMake(100, 300, 50, 50);
        
        [_zhihu setImage:[UIImage imageNamed:@"zhi"] forState:UIControlStateNormal];
    }
    return _zhihu;
}

- (UIButton *)weibo{
    if (!_weibo) {
        _weibo = [[UIButton alloc] init];
        [_weibo setImage:[UIImage imageNamed:@"wei"] forState:UIControlStateNormal];
        _weibo.frame = CGRectMake(175, 300, 50, 50);
    }
    return _weibo;
}

- (UIButton *)apple{
    if (!_apple) {
        _apple = [[UIButton alloc] init];
        
        [_apple setImage:[UIImage imageNamed:@"ping"] forState:UIControlStateNormal];
        _apple.frame = CGRectMake(250, 300, 50, 50);
    }
    return _apple;
}

- (UIButton *)circle{
    if (!_circle) {
        _circle = [[UIButton alloc] init];
        _circle = [[UIButton alloc]init];
        [_circle setImage:[UIImage imageNamed:@"loginAgree"] forState:UIControlStateNormal];
        [_circle setImage:[UIImage imageNamed:@"loginbtnForSure"] forState:UIControlStateSelected];
        _circle.layer.masksToBounds=YES;
        _circle.layer.cornerRadius=10;
        _circle.frame = CGRectMake(80, 360, 18, 18);
        
        [_circle addTarget:self action:@selector(checkClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _circle;
}
- (void)checkClick:(UIButton*)button{
    self.circle.selected = !self.circle.selected;
}

- (UILabel *)agree{
    if (!_agree) {
        _agree = [[UILabel alloc] init];
        _agree.text = @"我同意                    和";
        _agree.frame = CGRectMake(100, 360, 300, 20);
        _agree.textColor = [UIColor colorNamed:@"154_154_154&&100_100_100"];
        _agree.font = [UIFont systemFontOfSize:12];
    }
    return _agree;
}

- (UIButton *)zhidele{
    if (!_zhidele) {
        _zhidele = [[UIButton alloc] init];
//        _zhihu.frame = CGRectMake(100, 450, 200, 50);
        [_zhidele setTitle:@"《知乎协议》" forState:UIControlStateNormal];
        [_zhidele setTitle:@"《知乎协议》" forState:UIControlStateHighlighted];
        [_zhidele setTitleColor:[UIColor colorWithRed:0.16 green:0.3 blue:0.5 alpha:1] forState:UIControlStateNormal];
//        NSMutableAttributedString *title2 = [[NSMutableAttributedString alloc] initWithString:@"《知乎协议》"];
//        [_zhidele setAttributedTitle:title2 forState:UIControlStateHighlighted];
        _zhidele.titleLabel.font = [UIFont systemFontOfSize:12];
        _zhidele.frame = CGRectMake(95, 360, 150, 20);
    }
    return _zhidele;
}

- (UIButton *)inform{
    if (!_inform) {
        _inform = [[UIButton alloc] init];
        [_inform setTitle:@"《个人信息保护指引》" forState:UIControlStateNormal];
        [_inform setTitle:@"《个人信息保护指引》" forState:UIControlStateHighlighted];
        [_inform setTitleColor:[UIColor colorWithRed:0.16 green:0.3 blue:0.5 alpha:1] forState:UIControlStateNormal];
//        NSMutableAttributedString *title2 = [[NSMutableAttributedString alloc] initWithString:@"《个人信息保护指引》"];
//        [_inform setAttributedTitle:title2 forState:UIControlStateHighlighted];
        _inform.titleLabel.font = [UIFont systemFontOfSize:12];
        _inform.frame = CGRectMake(210, 360, 130, 20);
    }
    return _inform;
}

- (UIButton *)night{
    if (!_night) {
        _night = [[UIButton alloc] init];
        _night.frame = CGRectMake(SCREENWIDTH - 300, SCREENHEIGHT - 150, 60, 60);
        [_night setImage:[UIImage imageNamed:@"nightMod"] forState:UIControlStateNormal];
        [_night setTitle:@"夜间模式" forState:UIControlStateNormal];
        [_night setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _night.titleLabel.font = [UIFont systemFontOfSize:20];
        
    }
    return _night;
}

- (UIButton *)setting{
    if (!_setting) {
        _setting = [[UIButton alloc] init];
        [_setting setImage:[UIImage imageNamed:@"settingMod"] forState:UIControlStateNormal];
        _setting.frame = CGRectMake(SCREENWIDTH - 150, SCREENHEIGHT - 150, 60, 60);
    }
    return _setting;
}


#pragma mark-back主页
- (void)backMainPage{
    UIViewController *target = nil;
    for (UIViewController *temp in self.navigationController.viewControllers){//遍历
                if ([temp isKindOfClass:[MainVC class]]) {//判断是否是要跳转的页面
                    target = temp;
                }
            }
    if (target) {
        [self.navigationController popToViewController:target animated:YES];//跳转
    }
    
}

@end
