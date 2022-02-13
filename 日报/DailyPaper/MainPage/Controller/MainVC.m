//
//  MainVC.m
//  知乎日报
//
//  Created by 艾诗杰 on 2022/2/11.
//

//网络请求
#import "AFNetworking.h"
//屏幕适配
#import "Masonry.h"
//
#import "SDWebImage.h"
#import "UIImageView+WebCache.h"
#import "SDWebImageManager.h"
#import "SDWebImageDownloader.h"

#import "MainVC.h"
//View
#import "MainPageTableViewCell.h"
//Modelxxxxxx
//#import "MainPageTableViewCellModel.h"
#import "MainPageRequesDatatModel.h"
//Model
#import "MainPageStory.h"
#import "MainPageTopStory.h"
#import "MainPageTopScroll.h"

@interface MainVC ()<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

@property (nonatomic, strong) UITableView *table;
@property (nonatomic, strong) UIScrollView *topScroll;

@property (nonatomic, copy) NSArray *StorySourceAry;
@property (nonatomic, copy) NSArray *TopStorySourceAry;

@property (nonatomic, copy) NSArray *beforeNewsAry;
//@property (nonatomic, strong) UIView *topView;
@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //最新新闻：
    //初始化请求
    MainPageRequesDatatModel *requestModel = [[MainPageRequesDatatModel alloc] init];
    [requestModel requestMainPageDataSuccess:^(NSArray * _Nonnull dataAry) {
       //成功：
        //非top临时数组
        NSMutableArray *storyMuteAry = [NSMutableArray array];
        //top临时数组
        NSMutableArray *topStoryMuteAry = [NSMutableArray array];
        
        for (int i = 0; i < dataAry.count; i++) {
            //1.取出网络数据数组中的单个元素：字典
            NSDictionary *dic = dataAry[i];
            //2.字典转模型
            MainPageStory *storyDataModel = [[MainPageStory alloc] initWithDictionary:dic];
            //3.将字典保存入临时数组
            [storyMuteAry addObject:storyDataModel];
        }
        //top字典
        NSDictionary *top_dic = dataAry[dataAry.count];
        MainPageTopStory *topStoryDataModel = [[MainPageTopStory alloc] initWithDictionary:top_dic];
        [topStoryMuteAry addObject:topStoryDataModel];
        
        self.TopStorySourceAry = topStoryMuteAry;
        self.StorySourceAry = storyMuteAry;
        
        [self.view addSubview:self.table];
    } Failure:^(NSError * _Nonnull error) {
        //失败：
        NSLog(@"%@",error);
    }];
    
//    //before新闻
//    //初始化请求
//    MainPageRequesDatatModel*requestModel2 = [[MainPageRequesDatatModel alloc] init];
//    [requestModel2 requestMainPageDataSuccess:^(NSArray * _Nonnull dataAry2) {
//       //成功：
//        //临时数组
//        NSMutableArray *muteAry2 = [NSMutableArray array];
//
//        for (int i = 1; i < dataAry2.count; i++) {
//            //1.取出网络数据数组中的单个元素：字典
//            NSDictionary *dic2 = dataAry2[i];
//            //2.字典转模型
//            MainPageTableViewCellModel *cellDataModel2 = [[MainPageTableViewCellModel alloc] initWithDictionary:dic2];
//            //3.将字典保存入临时数组
//            [muteAry2 addObject:cellDataModel2];
//        }
//
//        self.beforeNewsAry = muteAry2;
//
//        [self.view addSubview:self.table];
//    } Failure:^(NSError * _Nonnull error) {
//        //失败：
//        NSLog(@"%@",error);
//    }];
    

}

    

#pragma mark-UITableViewDelegate
//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}

//自定义cell
#pragma mark-UITableViewDataSource
//cell组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


//cell行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.StorySourceAry.count;
}




//cell内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    //去除分割线
    [tableView  setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    NSString *identify = @"cell";
    MainPageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[MainPageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];//defaul样式
    }
    MainPageStory *storiesModel = self.StorySourceAry[indexPath.row];
    cell.title.text = storiesModel.title;
    cell.hint.text = storiesModel.hint;
    NSURL *imageURL = [NSURL URLWithString:storiesModel.images];
    [cell.images sd_setImageWithURL:imageURL placeholderImage:nil];
    
    cell.selectionStyle = UITableViewCellSelectionStyleGray;//选中效果
        return cell;
//    }
    /*
    else
       
        NSString *bannerIdentify = @"cell";
        MainPageTableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:bannerIdentify];//defaul样式
        if (cell2 == nil) {
            cell2 = [[MainPageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:bannerIdentify];
        }
        MainPageTableViewCellModel *cellModel = self.bannerSourceAry[indexPath.row];
        cell2.titleLbl.text = cellModel.titleStr;
        cell2.describeLbl.text = cellModel.describeStr;
        NSURL *imageURL = [NSURL URLWithString:cellModel.imageStr];
        [cell2.contentImageView sd_setImageWithURL:imageURL placeholderImage:nil];
        
            return cell2;
        
   */

}


#pragma mark-懒加载
- (UITableView *)table{
    if (!_table) {
        _table = [[UITableView alloc] initWithFrame:self.view.frame];//屏幕大小
        _table.delegate = self;
        _table.dataSource = self;
    }
    return _table;
}





@end





