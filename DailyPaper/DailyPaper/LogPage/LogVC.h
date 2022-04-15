//
//  LogVC.h
//  DailyPaper
//
//  Created by cheeseTunaFish on 2022/2/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol LogVCDeletage <NSObject>

- (void)backMainPage;

@end

@interface LogVC : UIViewController
@property (nonatomic, weak) id<LogVCDeletage> delegate;
- (instancetype)initWithPage;

@end

NS_ASSUME_NONNULL_END
