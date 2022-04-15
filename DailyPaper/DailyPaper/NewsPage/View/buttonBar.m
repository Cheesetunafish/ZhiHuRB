//
//  buttonBar.m
//  DailyPaper
//
//  Created by cheeseTunaFish on 2022/2/24.
//

#import "buttonBar.h"
#import "MainVC.h"

@implementation buttonBar
//246_246_246&&46_46_46

- (instancetype)initWithButtonBar{
    self = [super init];
    if (self) {
        
        self.backgroundColor = [UIColor colorNamed:@"246_246_246&&46_46_46"];
        self.frame = CGRectMake(0, SCREENHEIGHT - 100, SCREENWIDTH, 100);
        [self addSubview:self.backBtn];
        [self addSubview:self.divider];
        [self addSubview:self.commentBtn];
        [self addSubview:self.commentNumLab];
        [self addSubview:self.likeBtn];
        [self addSubview:self.likeNumLab];
        [self addSubview:self.starBtn];
        [self addSubview:self.shareBtn];
        [self addSubview:self.line];
    }
    return self;
}

- (UILabel *)line{
    if (!_line) {
        _line = [[UILabel alloc] init];
        _line.text = @"|";
        _line.frame = CGRectMake(40, 10, 5, 40);
        _line.font = [UIFont systemFontOfSize:60];
        _line.textColor = [UIColor colorNamed:@"211_211_211&&68_68_68"];
    }
    return _line;
}

- (UIButton *)backBtn{
    if (!_backBtn){
        _backBtn = [[UIButton alloc]init];
        [_backBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        _backBtn.imageView.tintColor = [UIColor colorNamed:@"0_0_0&&153_153_153"];
        _backBtn.frame = CGRectMake(10, 22, 15, 15);
        [_backBtn addTarget:self.delegate action:@selector(backMainPage) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _backBtn;
}

- (UIView *)divider{
    if (!_divider){
        _divider = [[UIView alloc]init];
//        _divider.backgroundColor = [UIColor colorWithRed:206/255.0 green:206/255.0 blue:206/255.0 alpha:1.0];
    }
    return _divider;
}

- (UIButton *)commentBtn{
    if (!_commentBtn){
        _commentBtn = [[UIButton alloc]init];
        [_commentBtn setImage:[UIImage imageNamed:@"comment"] forState:UIControlStateNormal];
        _commentBtn.imageView.tintColor = [UIColor colorNamed:@"0_0_0&&153_153_153"];
        _commentBtn.frame = CGRectMake(70, 21, 20, 20);
        
    }
    return _commentBtn;
}

- (UILabel *)commentNumLab{
    if (!_commentNumLab){
        _commentNumLab = [[UILabel alloc]init];
        _commentNumLab.textColor = [UIColor colorNamed:@"0_0_0&&153_153_153"];
        _commentNumLab.font = [UIFont systemFontOfSize:10];
    }
    return _commentNumLab;
}

- (UIButton *)likeBtn{
    if (!_likeBtn){
        _likeBtn = [[UIButton alloc]init];
        [_likeBtn setImage: [UIImage imageNamed:@"like"] forState:UIControlStateNormal];
        [_likeBtn setImage: [UIImage imageNamed:@"like2"] forState:UIControlStateSelected];
        
        _likeBtn.tintColor = [UIColor colorNamed:@"0_0_0&&153_153_153"];
        _likeBtn.frame = CGRectMake(150, 14, 32, 32);
//        [_likeBtn addTarget:self action:@selector(likeClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _likeBtn;
}

- (UILabel *)likeNumLab{
    if (!_likeNumLab){
        _likeNumLab = [[UILabel alloc]init];
        _likeNumLab.textColor = [UIColor colorNamed:@"0_0_0&&153_153_153"];
        _likeNumLab.font = [UIFont systemFontOfSize:10];
    }
    return _likeNumLab;
}

- (UIButton *)starBtn{
    if (!_starBtn){
        _starBtn = [[UIButton alloc]init];
        [_starBtn setImage:[UIImage imageNamed:@"star"] forState:UIControlStateNormal];
        [_starBtn setImage:[UIImage imageNamed:@"star2"] forState:UIControlStateSelected];
        _starBtn.tintColor = [UIColor colorNamed:@"0_0_0&&153_153_153"];
        _starBtn.frame = CGRectMake(250, 19, 22, 22);
//        [_starBtn addTarget:self action:@selector(starClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _starBtn;
}

- (UIButton *)shareBtn{
    if (!_shareBtn){
        _shareBtn = [[UIButton alloc]init];
        [_shareBtn setImage:[UIImage imageNamed:@"share"] forState:UIControlStateNormal];
        _shareBtn.tintColor = [UIColor colorNamed:@"0_0_0&&153_153_153"];
        _shareBtn.frame = CGRectMake(350, 20, 20, 20);
    }
    return _shareBtn;
}

- (WKWebView *)webView{
    if (!_webView){
        _webView = [[WKWebView alloc]init];
    }
    return _webView;
}


#pragma mark-方法




@end
