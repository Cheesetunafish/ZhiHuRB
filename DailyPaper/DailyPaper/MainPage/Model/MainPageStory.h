//
//  MainPageStory.h
//  DailyPaper
//
//  Created by 艾诗杰 on 2022/2/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainPageStory : NSObject

@property (nonatomic, copy) NSString *image_hue;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSURL *url;
@property (nonatomic, copy) NSString *hint;
@property (nonatomic, copy) NSString *ga_prefix;
@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *theId;

@property (nonatomic, copy) NSString *date;
@property (nonatomic, copy) NSArray *beforeStories;

- (instancetype)initWithDictionary:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
