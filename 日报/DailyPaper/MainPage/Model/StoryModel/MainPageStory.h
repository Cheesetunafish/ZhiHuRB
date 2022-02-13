//
//  MainPageStory.h
//  DailyPaper
//
//  Created by 艾诗杰 on 2022/2/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainPageStory : NSObject
//
@property (nonatomic, copy) NSString *image_hue;
//新闻标题
@property (nonatomic, copy) NSString *title;
//新闻地址
@property (nonatomic, copy) NSURL *url;
//小标题
@property (nonatomic, copy) NSString *hint;
//ga_prefix:供 Google Analytics 使用
@property (nonatomic, copy) NSString *ga_prefix;
//图像地址
@property (nonatomic, copy) NSString *images;
//tyoe
@property (nonatomic, copy) NSString *type;
//id
@property (nonatomic, copy) NSString *theId;

- (instancetype)initWithDictionary:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
