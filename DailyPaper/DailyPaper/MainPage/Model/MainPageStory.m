//
//  MainPageStory.m
//  DailyPaper
//
//  Created by 艾诗杰 on 2022/2/13.
//

#import "MainPageStory.h"

@implementation MainPageStory


- (instancetype)initWithDictionary:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        self.image_hue = dic[@"image_hue"];
        self.title = dic[@"title"];
        self.hint = dic[@"hint"];
        NSArray *imageUrlAry = dic[@"images"];
        self.image = imageUrlAry[0];
        self.type = dic[@"type"];
        self.theId = dic[@"id"];
//        self.date = dic[@"date"];
    }
    return self;
}


@end
