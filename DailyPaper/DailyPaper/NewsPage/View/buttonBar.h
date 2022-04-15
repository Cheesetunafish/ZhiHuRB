//
//  buttonBar.h
//  DailyPaper
//
//  Created by cheeseTunaFish on 2022/2/24.
//
#define SCREENWIDTH [[UIScreen mainScreen]bounds].size.width
#define SCREENHEIGHT [[UIScreen mainScreen]bounds].size.height
#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol buttonBarDeletage <NSObject>

- (void)backMainPage;

@end

@interface buttonBar : UIView


@property (nonatomic, strong) UIButton *backBtn;
@property (nonatomic, strong) UIButton *commentBtn;
@property (nonatomic, strong) UIButton *likeBtn;
@property (nonatomic, strong) UIButton *starBtn;
@property (nonatomic, strong) UIButton *shareBtn;
@property (nonatomic, strong) UILabel *commentNumLab;
@property (nonatomic, strong) UILabel *likeNumLab;
@property (nonatomic, strong) UIView *divider;
@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) UILabel *line;

@property (nonatomic, weak) id<buttonBarDeletage> delegate;

- (instancetype)initWithButtonBar;


@end

NS_ASSUME_NONNULL_END
