//
//  detailModel.m
//  DailyPaper
//
//  Created by cheeseTunaFish on 2022/2/22.
//
#import "MainPageRequesDatatModel.h"
#import "detailModel.h"
@implementation detailModel



- (void)getNewsID:(NSString *)ID AndModel:(void(^)(detailModel *))Newsmodel{
    MainPageRequesDatatModel *request = [[MainPageRequesDatatModel alloc] init];
    [request detailNews:ID detailNewsSuccess:^(NSDictionary * _Nonnull detailNewsDic) {
            //成功：
        detailModel *model = [[detailModel alloc] init];
        model.url = detailNewsDic[@"url"];
        Newsmodel(model);
    }];
}






@end
