//
//  MainPageRequesDatatModel.h
//  知乎日报
//
//  Created by 艾诗杰 on 2022/2/10.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface MainPageRequesDatatModel : NSObject

//latest：stories
- (void)requesStoriesSuccess:(void(^)(NSDictionary *storyDataDic))success Failure:(void(^)(NSError *error))failure;
//latest:top_stories
- (void)requestTopStoriesSuccess:(void(^)(NSArray *topDataAry))topSuccess Failure:(void(^)(NSError *error))failure;
//before
- (void)before:(NSString *)date beforeSuccess:(void(^)(NSDictionary *beforeDataDic))beforesuccess;

//新闻详情
- (void)detailNews:(NSString *)theId detailNewsSuccess:(void(^)(NSDictionary *detailNewsDic))detailSuccess;

@end

NS_ASSUME_NONNULL_END
