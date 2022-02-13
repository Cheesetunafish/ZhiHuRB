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
- (void)requestMainPageDataSuccess:(void (^)(NSArray * _Nonnull))success Failure:(void (^)(NSError * _Nonnull))failure{
    //1.创建一个会话管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //2.Get网络请求
    [manager GET:@"https://news-at.zhihu.com/api/3/news/latest" parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //responseObject：请求成功返回的响应结果（AFN内部已经把响应体转换为OC对象，通常是字典或数组）
        NSArray *storyAry = responseObject[@"stories"];
        NSArray *topStoryAry =responseObject[@"top_stories"];
        
        success(storyAry);
        success(topStoryAry);
        
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);//错误error
        }];
}


//
- (void)requestMainPageTopDataSuccess:(void(^)(NSArray *dataAry))success BeforeFailure:(void(^)(NSError *error))failure{
    //1.创建一个会话管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //2.Get网络请求
    [manager GET:@"https://news-at.zhihu.com/api/3/news/latest" parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //responseObject：请求成功返回的响应结果（AFN内部已经把响应体转换为OC对象，通常是字典或数组）
//        NSArray *storyAry = responseObject[@"stories"];
        NSArray *topStoryAry =responseObject[@"top_stories"];
        
//        success(storyAry);
        success(topStoryAry);
        
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);//错误error
        }];
}



@end
