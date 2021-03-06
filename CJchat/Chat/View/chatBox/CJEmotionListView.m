//
//  CJEmotionListView.m
//  CJchat
//
//  Created by CoderChenJun on 16/4/6.
//  Copyright © 2016年 zwu All rights reserved.
//

#import "CJEmotionListView.h"
#import "CJEmotionPageView.h"

#define topLineH  0.5

@interface CJEmotionListView ()<UIScrollViewDelegate>

@property (nonatomic, weak)UIView *topLine;
@property (nonatomic, weak)UIScrollView *scrollView;
@property (nonatomic, weak)UIPageControl *pageControl;

@end

@implementation CJEmotionListView

- (id) initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = CJColor(237, 237, 246);
        [self topLine];
        [self scrollView];
        [self pageControl];
    }
    return self;
}


#pragma mark - Priate

- (void)pageControlClicked:(UIPageControl *)pageControl
{
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.pageControl.width          = self.width;
    self.pageControl.height         = 10;
    self.pageControl.x              = 0;
    self.pageControl.y              = self.height - self.pageControl.height;
    self.scrollView.width           = self.width;
    self.scrollView.height          = self.pageControl.y;
    self.scrollView.x               =self.scrollView.y
                                    = 0;
    NSUInteger count                = self.scrollView.subviews.count;
    for (int i = 0; i < count; i ++) {
        CJEmotionPageView *pageView = self.scrollView.subviews[i];
        pageView.width              = self.scrollView.width;
        pageView.height             = self.scrollView.height;
        pageView.y                  = 0;
        pageView.x                  = i * pageView.width;
    }
    self.scrollView.contentSize     = CGSizeMake(count*self.scrollView.width, 0);
}

- (void)setEmotions:(NSArray *)emotions
{
    _emotions = emotions;
    
    [self.scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    NSUInteger count = (emotions.count + CJEmotionPageSize - 1)/ CJEmotionPageSize;
    self.pageControl.numberOfPages  = count;
    for (int i = 0; i < count; i ++) {
        CJEmotionPageView *pageView = [[CJEmotionPageView alloc] init];
        NSRange range;
        range.location              = i * CJEmotionPageSize;
        NSUInteger left             = emotions.count - range.location;//剩余
        if (left >= CJEmotionPageSize) {
            range.length            = CJEmotionPageSize;
        } else {
            range.length            = left;
        }
        pageView.emotions           = [emotions subarrayWithRange:range];
        [self.scrollView addSubview:pageView];
    }
    [self setNeedsLayout]; 
    
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    double pageNum                = scrollView.contentOffset.x/scrollView.width;
    self.pageControl.currentPage  = (int)(pageNum+0.5);
}

#pragma mark - Getter and Setter

- (UIScrollView *)scrollView
{
    if (nil == _scrollView) {
        UIScrollView *scrollView = [[UIScrollView alloc] init];
        [scrollView setShowsHorizontalScrollIndicator:NO];
        [scrollView setShowsVerticalScrollIndicator:NO];
        [scrollView setPagingEnabled:YES];
        scrollView.delegate = self;
        [self addSubview:scrollView];
        _scrollView = scrollView;
    }
    return _scrollView;
}

- (UIPageControl *)pageControl
{
    if (nil == _pageControl) {
        UIPageControl *pageControl = [[UIPageControl alloc] init];
        [self addSubview:pageControl];
        _pageControl = pageControl;
        _pageControl.currentPageIndicatorTintColor = [UIColor grayColor];
        _pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
        _pageControl.userInteractionEnabled = NO;
    }
    return _pageControl;
}

- (UIView *)topLine
{
    if (nil == _topLine) {
        UIView * topLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, UISCREEN_WIDTH,topLineH)];
        [self addSubview:topLine];
        topLine.backgroundColor = CJColor(188.0, 188.0, 188.0);
        _topLine = topLine;
    }
    return _topLine;
}

@end
