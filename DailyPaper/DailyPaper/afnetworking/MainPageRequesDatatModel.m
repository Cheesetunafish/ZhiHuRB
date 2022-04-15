//
//  MainPageRequesDatatModel.m
//  知乎日报
//
//  Created by 艾诗杰 on 2022/2/10.
//

#import "MainPageRequesDatatModel.h"
#import "AFNetworking.h"

@implementation MainPageRequesDatatModel

///最新新闻
/////https://news-at.zhihu.com/api/3/news/latest
- (void)requesStoriesSuccess:(void(^)(NSDictionary *storyDataDic))success  Failure:(void(^)(NSError *error))failure{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"https://news-at.zhihu.com/api/3/news/latest" parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //responseObject：请求成功返回的响应结果（AFN内部已经把响应体转换为OC对象，通常是字典或数组）
        success(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);
        }];
}

- (void)requestTopStoriesSuccess:(void(^)(NSArray *topDataAry))topSuccess Failure:(void(^)(NSError *error))failure{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"https://news-at.zhihu.com/api/3/news/latest" parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *topStoryAry = responseObject[@"top_stories"];
        topSuccess(topStoryAry);
        NSLog(@"%@",topSuccess);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);//错误error
        }];
}

//before
- (void)before:(NSString *)date beforeSuccess:(void(^)(NSDictionary *beforeDataDic))beforesuccess{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    NSLog(@"运到before里的date：%@",date);
    //get请求
    [manager GET:[NSString stringWithFormat:@"http://news.at.zhihu.com/api/4/news/before/%@",date] parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        beforesuccess(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"nooooooooooooooooooo");
        }];
}


//新闻详情
- (void)detailNews:(NSString *)theId detailNewsSuccess:(void (^)(NSDictionary * _Nonnull))detailSuccess{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:[NSString stringWithFormat:@"https://news-at.zhihu.com/api/4/news/%@",theId] parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            detailSuccess(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"GET-FAILED");
        }];
}


@end
