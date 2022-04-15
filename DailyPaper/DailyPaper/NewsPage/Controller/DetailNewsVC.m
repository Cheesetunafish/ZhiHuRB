//
//  DetailNewsVC.m
//  DailyPaper
//
//  Created by cheeseTunaFish on 2022/2/22.
//


//controller
#import "DetailNewsVC.h"
//view
#import "topIamgeView.h"
#import "buttonBar.h"
//model
#import "detailModel.h"
//tool
#import "AFNetworking.h"//网络请求
#import <WebKit/WebKit.h>
#import "MainPageRequesDatatModel.h"

#import "MainVC.h"
@interface DetailNewsVC ()<buttonBarDeletage>

@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) buttonBar *buttonBarr;
@end

@implementation DetailNewsVC

- (DetailNewsVC *)initWithTheID:(NSString *)theId{
    self = [super init];
    if (self) {
        //1.网络请求
        MainPageRequesDatatModel *requestDetail = [[MainPageRequesDatatModel alloc] init];
        [requestDetail detailNews:theId detailNewsSuccess:^(NSDictionary * _Nonnull detailNewsDic) {
            //2.转模型
            detailModel *model = [[detailModel alloc] init];
            [model getNewsID:theId AndModel:^(detailModel * _Nonnull model) {
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:model.url]]];
            }];
            
        }];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor  colorNamed:@"255_255_255&&26_26_26"];
    [self.view addSubview:self.buttonBarr];
    [self.view addSubview:self.webView];
    
}

- (WKWebView *)webView{
    if (!_webView) {
        _webView = [[WKWebView alloc] init];
        _webView.frame = CGRectMake(0, 30, SCREENWIDTH, SCREENHEIGHT - 130);
    }
    return _webView;
}

- (buttonBar *)buttonBarr{
    if (!_buttonBarr) {
        _buttonBarr = [[buttonBar alloc] initWithButtonBar];
    }
    return _buttonBarr;
}

//跳转回主页
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
