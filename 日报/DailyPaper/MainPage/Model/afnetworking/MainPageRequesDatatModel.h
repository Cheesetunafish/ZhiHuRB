//
//  MainPageRequesDatatModel.h
//  知乎日报
//
//  Created by 艾诗杰 on 2022/2/10.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface MainPageRequesDatatModel : NSObject



- (void)requestMainPageDataSuccess:(void(^)(NSArray *dataAry))success Failure:(void(^)(NSError *error))failure;

- (void)requestMainPageTopDataSuccess:(void(^)(NSArray *dataAry))success BeforeFailure:(void(^)(NSError *error))failure;



@end

NS_ASSUME_NONNULL_END
