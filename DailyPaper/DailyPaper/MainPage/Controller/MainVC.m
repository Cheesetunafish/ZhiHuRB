//
//  MainVC.m
//  知乎日报
//
//  Created by 艾诗杰 on 2022/2/11.
//
#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height
//第三方
#import "AFNetworking.h"//网络请求
#import "Masonry.h"//屏幕适配
#import "SDWebImage.h"//图片
#import "UIImageView+WebCache.h"
#import "SDWebImageManager.h"
#import "SDWebImageDownloader.h"
#import "MJRefresh.h"//刷新
//Controller
#import "MainVC.h"
#import "DetailNewsVC.h"
#import "LogVC.h"
//View
#import "MainPageTableViewCell.h"//latest新闻(cell
#import "MainPageTopScrollView.h"//Banner
#import "TopView.h"//顶部条

//Model
#import "MainPageRequesDatatModel.h"//网络请求
#import "MainPageStory.h"//latest新闻
#import "MainPageTopStory.h"//banner


@interface MainVC ()<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate, TopViewDeletage>

@property (nonatomic, strong) UITableView *table;//主界面
@property (nonatomic, strong) UIScrollView *topScroll;//滚动视图
@property (nonatomic, copy) NSMutableArray *StorySourceAry;//最新数据stories
@property (nonatomic, copy) NSArray *TopStorySourceAry;//最新数据top_stories
@property (nonatomic, copy) NSMutableArray *beforeNewsAry;//before新闻数组
@property (nonatomic, strong) TopView *topView;//顶部条
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, copy) NSString *datedate;//date
@property (nonatomic, strong) LogVC *logVC;//未登录页面
@property (nonatomic, retain) NSMutableArray *items;//数据源
@property (nonatomic, strong) NSString *thisID;//故事id

@end

@implementation MainVC
@synthesize items;


- (void)viewDidLoad {
    [super viewDidLoad];
    [self getLatestNews];                           //请求最新数据
    [self getTopStory];                             //请求最新数据top_stories
    [self.table addSubview:self.topScroll];         //Banner加到视图上
    [self.view addSubview:self.topView];            //加载顶部条
    self.table.tableHeaderView = self.topScroll;    //加在前面
    
    self.navigationController.navigationBar.hidden = YES;
    /*
     MJRefresh
     */
    __weak typeof(self) weakSelf = self;
    self.table.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        //刷新时候，需要执行的代码。一般是请求最新数据，请求成功之后，刷新列表
        [weakSelf loadNewData];
    }];
    self.table.mj_footer = [MJRefreshBackFooter footerWithRefreshingBlock:^{
        //刷新时候，需要执行的代码。一般是请求更多数据，请求成功之后，刷新列表
        [weakSelf loadMoreData];
    }];
}

#pragma mark-数据刷新
/*
 刷新刷新刷新
 */
- (void)loadNewData{
    NSLog(@"请求最新数据");
    //这里假设2秒之后获取到了最新的数据，刷新tableview，并且结束刷新控件的刷新状态
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //刷新列表
        [weakSelf.table reloadData];
        //拿到当前的刷新控件，结束刷新状态
        [weakSelf.table.mj_header endRefreshing];
    });
}

//加载加载加载
- (void)loadMoreData{
    NSLog(@"请求更多的数据");
    [self getBeforeNews];
    //加载cell：加载更多数据
    //这里假设2秒之后获取到了更多的数据，刷新tableview，并且结束刷新控件的刷新状态
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //刷新列表
        [weakSelf.table reloadData];//重新加载
        //拿到当前的刷新控件，结束刷新状态
        [weakSelf.table.mj_footer endRefreshing];
    });
}

#pragma mark-网络请求
//Latest新闻请求
- (void)getLatestNews{
    //最新新闻：
    //初始化请求
    MainPageRequesDatatModel *requestModel = [[MainPageRequesDatatModel alloc] init];
    [requestModel requesStoriesSuccess:^(NSDictionary * _Nonnull storyDataDic) {
        //stories成功
        NSArray *storyDataAry = storyDataDic[@"stories"];
        NSMutableArray *storyMuteAry = [NSMutableArray array];
        for (int i = 0; i < storyDataAry.count; i++) {
            //1.取出网络数据数组中的单个元素：字典
            NSDictionary *dic = storyDataAry[i];
            //2.字典转模型
            MainPageStory *storyDataModel = [[MainPageStory alloc] initWithDictionary:dic];
            //3.将模型保存入临时数组
            [storyMuteAry addObject:storyDataModel];
        }
        self.StorySourceAry = storyMuteAry;
        self.items = self.StorySourceAry;//数据源
//        NSLog(@"%lu",self.items.count);
        self.datedate = storyDataDic[@"date"];
        [self.view addSubview:self.table];
        } Failure:^(NSError * _Nonnull error) {
            NSLog(@"topFailed===============");
        }];
}
//获取banner数据
- (void)getTopStory{
    MainPageRequesDatatModel *requestModel = [[MainPageRequesDatatModel alloc] init];
    [requestModel requestTopStoriesSuccess:^(NSArray * _Nonnull topDataAry) {
        //top_stories成功
        NSMutableArray *topStoryMuteAry = [NSMutableArray array];
        for (int i = 0; i < topDataAry.count; i++) {
            //1.取出网络数据数组中的单个元素：字典
            NSDictionary *topDic = topDataAry[i];
            //2.字典转模型
            MainPageTopStory *storyTopDataModel = [[MainPageTopStory alloc] initWithDictionary:topDic];
            //3.将模型保存入临时数组
            [topStoryMuteAry addObject:storyTopDataModel];
        }
        self.TopStorySourceAry = topStoryMuteAry;
        [self getBannerData];
    } Failure:^(NSError * _Nonnull error) {
        NSLog(@"topFailed===============");
    }];
}

//test---before
- (void)getBeforeNews {
    MainPageRequesDatatModel *beforeModel = [[MainPageRequesDatatModel alloc] init];
    [beforeModel before:self.datedate beforeSuccess:^(NSDictionary * _Nonnull beforeDataDic) {
        self.datedate = beforeDataDic[@"date"];
            NSArray *beforeDataAry = beforeDataDic[@"stories"];
                NSMutableArray *muteAry = [NSMutableArray array];
                for (int i = 0; i < beforeDataAry.count; i++) {
                    NSDictionary *beforeDic = beforeDataAry[i];
                    MainPageStory *beforeStory = [[MainPageStory alloc] initWithDictionary:beforeDic];
                    [muteAry addObject:beforeStory];
                }
        self.beforeNewsAry = muteAry;
        NSMutableArray *arrM = [[NSMutableArray alloc] init];
        [arrM addObjectsFromArray:self.items];
        [arrM addObjectsFromArray:self.beforeNewsAry];
        
        self.StorySourceAry = self.beforeNewsAry;
        self.items = arrM;//加入数据源
//        NSLog(@"%lu",self.items.count);
        NSLog(@"...........请求before数据");
    }];
    }

//加载banner数据
- (void)getBannerData{
    for (int i = 0; i < self.TopStorySourceAry.count; i++) {
        MainPageTopScrollView *bannerSubView = [[MainPageTopScrollView alloc] initWithFrame:CGRectMake((i + 1) *SCREENWIDTH, 0, SCREENWIDTH, 400)];
        MainPageTopStory *data = self.TopStorySourceAry[i];
        bannerSubView.title.text = data.title;//取出字典里的title
        bannerSubView.hint.text = data.hint;//取出字典里的hint
        NSURL *imageURL = [NSURL URLWithString:data.image];
        [bannerSubView.image sd_setImageWithURL:imageURL placeholderImage:nil];//取出图片
        [self.topScroll addSubview:bannerSubView];
        bannerSubView.userInteractionEnabled = YES;//可点击
        [bannerSubView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doTapAction:)]];
    }
    //最后一张排头
    MainPageTopScrollView *headView = [[MainPageTopScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 400)];
    MainPageTopStory *headImgData = self.TopStorySourceAry[4];
    headView.title.text = headImgData.title;
    headView.hint.text = headImgData.hint;
    NSURL *headImgURL = [NSURL URLWithString:headImgData.image];
    [headView.image sd_setImageWithURL:headImgURL placeholderImage:nil];//取出图片
    headView.userInteractionEnabled = YES;//可点击
    [headView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doTapAction:)]];//点击手势
    //第一张排尾：
    MainPageTopScrollView *footView = [[MainPageTopScrollView alloc] initWithFrame:CGRectMake(6 * SCREENWIDTH, 0, SCREENWIDTH, 400)];
    MainPageTopStory *footImgData = self.TopStorySourceAry[0];
    footView.title.text = footImgData.title;
    footView.hint.text = footImgData.hint;
    NSURL *footImgURL = [NSURL URLWithString:footImgData.image];
    [footView.image sd_setImageWithURL:footImgURL placeholderImage:nil];
    [self.topScroll addSubview:headView];
    [self.topScroll addSubview:footView];
    footView.userInteractionEnabled = YES;//可点击
    [footView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doTapAction:)]];//点击手势
}

//banner跳转
- (void)doTapAction:(NSString *)thisID{
//    MainPageTopStory *topModel = [[MainPageTopStory alloc] init];
//    topModel.theId = thisID;
    thisID = self.thisID;
    DetailNewsVC *detailView2 = [[DetailNewsVC alloc] initWithTheID:thisID];
    NSLog(@"。。。。。。%@。。。。。。。。",thisID);
    [self.navigationController pushViewController:detailView2 animated:YES];
}

//跳到未登录界面
- (void)jumpPage{
    LogVC *log = [[LogVC alloc] initWithPage];
    log.view.backgroundColor = [UIColor whiteColor];
    NSLog(@"dsaflkejopvdajkljeforigueajldk");
    [self.navigationController pushViewController:log animated:YES];
}

#pragma mark-UITableViewDelegate
//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 110;
}

#pragma mark-UITableViewDataSource
////cell组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return self.items.count / 6;
    return 1;
}

//cell行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.items.count;//数据源de 数量
}

//cell内容 自定义
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    [tableView  setSeparatorStyle:UITableViewCellSeparatorStyleNone];//去除分割线
    static NSString *identify = @"cell";
    MainPageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[MainPageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    //设置数据
    MainPageStory *storiesModel = self.items[indexPath.row];
    cell.title.text = storiesModel.title;
    cell.hint.text = storiesModel.hint;
    NSURL *imageURL = [NSURL URLWithString:storiesModel.image];
    [cell.images sd_setImageWithURL:imageURL placeholderImage:nil];
    cell.selectionStyle = UITableViewCellSelectionStyleGray;//选中效果
    
    return cell;
}

//点击cell跳到新闻详情页
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //索引
    MainPageStory *storyModel = self.StorySourceAry[indexPath.row];
    //2.导出每个故事id
    NSString *ID = storyModel.theId;
    DetailNewsVC *detailView = [[DetailNewsVC alloc] initWithTheID:ID];
    [self.navigationController pushViewController:detailView animated:YES];
    NSLog(@"???????????????????????????????");
}

#pragma mark-懒加载
- (UITableView *)table{
    if (!_table) {
        _table = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height - 100) style:UITableViewStylePlain];//屏幕大小
        _table.delegate = self;
        _table.dataSource = self;
    }
    return _table;
}

//topView
- (TopView *)topView{
    if (!_topView) {
        _topView = [[TopView alloc] initWithTopView];
        _topView.delegate = self;
    }
    return _topView;
}


//Banner
- (UIScrollView *)topScroll{
    if (!_topScroll) {
        _topScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 400)];
        _topScroll.contentSize = CGSizeMake(SCREENWIDTH * 7, 400);
        _topScroll.pagingEnabled = YES;
        _topScroll.contentOffset = CGPointMake(SCREENWIDTH, 0);//设置初始偏移量a
        _topScroll.showsHorizontalScrollIndicator = NO;//滚条
        _topScroll.delegate = self;
        _timer = [NSTimer scheduledTimerWithTimeInterval:4.0 target:self selector:@selector(loopTimer:) userInfo:nil repeats:YES];//1.初始化计时器
    }
    return _topScroll;
}

//计时器方法：
- (void)loopTimer:(NSTimer *)timer{
    int calculatePage = self.topScroll.contentOffset.x/SCREENWIDTH;
    if (calculatePage >= 1 && calculatePage < 5) {
        MainPageTopStory *MODEL = [[MainPageTopStory alloc] init];
        MODEL = self.TopStorySourceAry[calculatePage];
        self.thisID = MODEL.theId;
//        NSLog(@"??????????????????????eeeee%@eeeeeeeee%d", self.thisID, calculatePage);
    }
    else if(calculatePage == 5){
        MainPageTopStory *MODEL = [[MainPageTopStory alloc] init];
        MODEL = self.TopStorySourceAry[0];
        self.thisID = MODEL.theId;
    }
    else if(calculatePage == 0){
        MainPageTopStory *MODEL = [[MainPageTopStory alloc] init];
        MODEL = self.TopStorySourceAry[4];
        self.thisID = MODEL.theId;
    }
    if (calculatePage >= 0) {
        CGPoint newOffset = self.topScroll.contentOffset;
        newOffset.x = newOffset.x + SCREENWIDTH;
        if (newOffset.x > 6 * SCREENWIDTH) {
            [_timer setFireDate:[NSDate distantFuture]];//关闭计时器
            newOffset.x = SCREENWIDTH;//回第一张
            [self.topScroll setContentOffset:newOffset animated:NO];
            [_timer setFireDate:[NSDate date]];
        }
        [self.topScroll setContentOffset:newOffset animated:YES];
    }
}

//无限滚动：当scrollView停止滚动之后调用此方法
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if (!decelerate) {
    //计算偏移量对应的页数
    int page = scrollView.contentOffset.x/SCREENWIDTH;
    NSLog(@"=========现在的页数为：%d==========\n",page);
    if (page == 0) {
        scrollView.contentOffset = CGPointMake(5 * SCREENWIDTH, 0);
    }
    if (page == 6) {
        scrollView.contentOffset = CGPointMake(SCREENWIDTH, 0);
    }
    }
}






@end





