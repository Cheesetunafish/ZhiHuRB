//
//  MainPageTopScrollView.h
//  DailyPaper
//
//  Created by cheeseTunaFish on 2022/2/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol MainPageTopScrollViewDelegate <NSObject>

- (void)doTapAction;

@end



@interface MainPageTopScrollView : UIView
@property (nonatomic, strong) UILabel *title;//标题
@property (nonatomic, strong) UILabel *hint;//作者描述
@property (nonatomic, strong) UIImageView *image;//图片
@property (nonatomic, strong) NSString *theId;
@property (nonatomic, weak) id<MainPageTopScrollViewDelegate> delegate;



@end

NS_ASSUME_NONNULL_END
