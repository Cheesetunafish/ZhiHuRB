//
//  TopView.h
//  DailyPaper
//
//  Created by cheeseTunaFish on 2022/2/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol TopViewDeletage <NSObject>

- (void)jumpPage;

@end

@interface TopView : UIView

@property (nonatomic, strong) UILabel *dayNumber;//今日（号）eg：17
@property (nonatomic, strong) UILabel *monthNumber;//月份 eg：二月
@property (nonatomic, strong) UILabel *title;//“知乎日报”“早上好”“下午好”“晚上好”
@property (nonatomic, strong) UIButton *personalBtn;//右上角头像
@property (nonatomic, strong) UILabel *Line;
@property (nonatomic, strong) NSDateComponents *components;//时间容器

@property (nonatomic, weak) id<TopViewDeletage> delegate;

- (instancetype)initWithTopView;
- (void)timeData;

@end

NS_ASSUME_NONNULL_END
