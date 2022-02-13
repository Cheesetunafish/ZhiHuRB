//
//  MainPageTopStory.m
//  DailyPaper
//
//  Created by 艾诗杰 on 2022/2/13.
//

#import "MainPageTopStory.h"

@implementation MainPageTopStory

- (instancetype)initWithDictionary:(NSDictionary *)dic{
    self = [super self];
    if (self) {
        self.image_hue = dic[@"image_hue"];
        self.hint = dic[@"hint"];
        self.url = dic[@"url"];
//        self.image = dic[@"image"];
        NSArray *imageAry = dic[@"image"];
        self.image = imageAry[0];
        self.title = dic[@"title"];
        self.ga_prefix = dic[@"ga_prefix"];
    }
    return self;
}


@end
