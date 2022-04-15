//
//  detailModel.h
//  DailyPaper
//
//  Created by cheeseTunaFish on 2022/2/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface detailModel : NSObject
@property (nonatomic, copy) NSString *body;
@property (nonatomic, copy) NSString *image_hue;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSArray *share_url;
//js
@property (nonatomic, copy) NSString *ga_prefix;
@property (nonatomic, copy) NSString *images;//只有一个元素的数组
//type
//@property (nonatomic, copy) NSDictionary *section;
@property (nonatomic, copy) NSString *theId;
@property (nonatomic, copy) NSString *css;//只有一个元素的数组


//- (instancetype)initWithDictionary:(NSDictionary *)dic;

- (void)getNewsID:(NSString *)ID AndModel:(void(^)(detailModel *))Newsmodel;


@end
NS_ASSUME_NONNULL_END
