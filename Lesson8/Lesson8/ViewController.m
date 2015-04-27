//
//  ViewController.m
//  Lesson8
//
//  Created by Timur Bernikowich on 26.04.15.
//  Copyright (c) 2015 Timur Bernikowich. All rights reserved.
//

#import "ViewController.h"

#define SCROLL_IS_FULLSCREEN YES
#define SCROLL_USE_COLORS_DATA NO
#define SCROLL_SHOWS_IMAGE YES

@interface ViewController () <UIScrollViewDelegate>

@property UIScrollView *scrollView;
@property UIScrollView *nestedScrollView;
@property UIPageControl *pageControl;

@property NSArray *pageText;
@property NSArray *horizontalColors;
@property NSArray *verticalColors;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Scroll view.
    CGRect frame;
    if (SCROLL_IS_FULLSCREEN) {
        frame = self.view.bounds;
    } else {
        frame = CGRectMake(50.0f, 50.0f, 160.0f, 160.0f);
    }
    self.scrollView = [[UIScrollView alloc] initWithFrame:frame];
    self.scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3];
    [self.view addSubview:self.scrollView];
    
    // Page control.
    CGFloat pageControlHeght = 40.0f;
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0.0f, self.view.bounds.size.height - pageControlHeght, self.view.bounds.size.width, pageControlHeght)];
    self.pageControl.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    self.pageControl.pageIndicatorTintColor = [UIColor grayColor];
    self.pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    self.pageControl.alpha = 0.5;
    [self.view addSubview:self.pageControl];
    
    // Load data.
    if (SCROLL_USE_COLORS_DATA) {
        [self loadColorsData];
        [self createColorsPages];
    } else if (SCROLL_SHOWS_IMAGE) {
        [self showImage];
    } else {
        [self loadLabelsData];
        [self createPages];
        [self updatePageControl];
    }
}

#pragma mark - Image Data

- (void)showImage
{
    UIImage *image = [UIImage imageNamed:@"test"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    self.scrollView.contentSize = image.size;
    [self.scrollView addSubview:imageView];
    self.scrollView.minimumZoomScale = 1.0;
    self.scrollView.maximumZoomScale = 4.0;
    self.scrollView.zoomScale = 0.5;
}

#pragma mark - Colors Data

- (void)loadColorsData
{
    // The second colors is clear color because we will not even see it.
    self.horizontalColors = @[[UIColor blueColor], [UIColor clearColor]];
    self.verticalColors = @[[UIColor redColor], [UIColor greenColor]];
    self.scrollView.contentSize = CGSizeMake(self.scrollView.bounds.size.width * self.horizontalColors.count, self.scrollView.bounds.size.height);
    [self createNestedScroll];
    self.nestedScrollView.contentSize = CGSizeMake(self.scrollView.bounds.size.width, self.scrollView.bounds.size.height * self.verticalColors.count);
}

- (void)createNestedScroll
{
    CGRect frame = self.scrollView.bounds;
    NSInteger lastPage = self.horizontalColors.count - 1;
    frame.origin.x = self.scrollView.bounds.size.width * lastPage;
    self.nestedScrollView = [[UIScrollView alloc] initWithFrame:frame];
    self.nestedScrollView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.nestedScrollView.pagingEnabled = YES;
    self.nestedScrollView.showsVerticalScrollIndicator = NO;
    [self.scrollView addSubview:self.nestedScrollView];
}

- (void)createColorsPages
{
    for (UIColor *color in self.horizontalColors) {
        NSInteger page = [self.horizontalColors indexOfObject:color];
        UIView *pageView = [[UILabel alloc] initWithFrame:CGRectMake(0.0f + self.scrollView.bounds.size.width * page, 0.0f, self.scrollView.bounds.size.width, self.scrollView.bounds.size.height)];
        pageView.backgroundColor = color;
        [self.scrollView addSubview:pageView];
    }
    
    for (UIColor *color in self.verticalColors) {
        NSInteger page = [self.verticalColors indexOfObject:color];
        UIView *pageView = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f + self.nestedScrollView.bounds.size.height * page, self.nestedScrollView.bounds.size.width, self.nestedScrollView.bounds.size.height)];
        pageView.backgroundColor = color;
        [self.nestedScrollView addSubview:pageView];
    }
}

#pragma mark - Labels Data
     
- (void)loadLabelsData
{
    self.pageText = @[@"Hello", @"Page 2", @"Last Page"];
    self.scrollView.contentSize = CGSizeMake(self.scrollView.bounds.size.width * self.pageText.count, self.scrollView.bounds.size.height);
    self.pageControl.numberOfPages = self.pageText.count;
}

- (void)createPages
{
    for (NSString *textForPage in self.pageText) {
        NSInteger page = [self.pageText indexOfObject:textForPage];
        UILabel *pageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f + self.scrollView.bounds.size.width * page, 0.0f, self.scrollView.bounds.size.width, self.scrollView.bounds.size.height)];
        pageLabel.text = textForPage;
        pageLabel.textAlignment = NSTextAlignmentCenter;
        pageLabel.textColor = [UIColor blackColor];
        [self.scrollView addSubview:pageLabel];
    }
}

#pragma mark - Scroll View

- (void)updatePageControl
{
    CGFloat offset = self.scrollView.contentOffset.x;
    CGFloat pageWidth = self.scrollView.bounds.size.width;
    NSInteger currentPage = round(offset / pageWidth);
    NSInteger numberOfPages = self.scrollView.contentSize.width / pageWidth;
    currentPage = MAX(MIN(currentPage, numberOfPages - 1), 0);
    self.pageControl.currentPage = currentPage;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == self.scrollView) {
        [self updatePageControl];
    }
}

- (UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    // Return the view that you want to zoom
    return self.scrollView.subviews.firstObject;
}

@end
