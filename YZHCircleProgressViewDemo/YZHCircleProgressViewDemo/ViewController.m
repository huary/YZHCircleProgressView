//
//  ViewController.m
//  YZHCircleProgressViewDemo
//
//  Created by captain on 16/12/30.
//  Copyright © 2016年 yzh. All rights reserved.
//

#import "ViewController.h"
#import "YZHCircleProgressView.h"

@interface ViewController ()

@property (nonatomic, strong) YZHCircleProgressView *progressView;

@property (nonatomic, strong) YZHCircleProgressView *progressView2;

@property (nonatomic, strong) YZHCircleProgressView *progressView3;

@property (nonatomic, strong) YZHCircleProgressView *progressView4;

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setUpChild];
}

-(void)setUpChild
{
//    self.view.backgroundColor = [UIColor redColor];
    
    CGRect bounds = self.view.bounds;
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 50, bounds.size.width, bounds.size.height - 200)];
    imageView.image = [UIImage imageNamed:@"2.jpg"];
    [self.view addSubview:imageView];
    
    CGFloat strokeWidth = 50;
    YZHCircleProgressView *progressView = [[YZHCircleProgressView alloc] initWithFrame:CGRectMake(20, 80, strokeWidth, strokeWidth)];
    
    CGFloat titleLableWH = strokeWidth - 15;
//    progressView.alpha = 0.3;
    
//    progressView.titleLabel.text = @"点击重试";
    progressView.titleLabel.font = [UIFont systemFontOfSize:8];
//    progressView.titleLabel.frame = CGRectMake((progressView.bounds.size.width-titleLableWH)/2, (progressView.bounds.size.height-titleLableWH)/2, titleLableWH, titleLableWH);
//    progressView.titleLabel.numberOfLines = 0;
    progressView.titleLabel.textColor = [UIColor redColor];
    
    progressView.progressBorderWidth = 1.5;
    progressView.progressBorderColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
    
    //样式1
    progressView.progressTrackLineWidth = strokeWidth/2 - progressView.progressBorderWidth;
    progressView.progressTrackInsideRadius = 0;
    progressView.progressTrackColor = [UIColor blackColor];
    
    progressView.progressLineWidth = strokeWidth/2 -  3.5;
    progressView.progressInsideRadius = 0;
    progressView.progressColor = [UIColor whiteColor];
    
    [self.view addSubview:progressView];
    self.progressView = progressView;
    
    YZHCircleProgressView *progressView2 = [[YZHCircleProgressView alloc] initWithFrame:CGRectMake(80, 80, strokeWidth, strokeWidth)];
    progressView2.alpha = 0.3;

    //样式2
    progressView2.progressBorderWidth = 0;
    progressView2.progressBorderColor = [UIColor purpleColor];//[[UIColor whiteColor] colorWithAlphaComponent:0.5];
    
    progressView2.progressTrackLineWidth = 3;
    progressView2.progressTrackInsideRadius = strokeWidth/2 - progressView2.progressBorderWidth - progressView2.progressTrackLineWidth;
    progressView2.progressTrackColor = [UIColor redColor];//[UIColor blackColor];
    
    progressView2.progressLineWidth = progressView2.progressTrackLineWidth;
    progressView2.progressInsideRadius = progressView2.progressTrackInsideRadius;
    progressView2.progressColor = [UIColor whiteColor];
    [self.view addSubview:progressView2];
    self.progressView2 = progressView2;
    
    YZHCircleProgressView *progressView3 = [[YZHCircleProgressView alloc] initWithFrame:CGRectMake(140, 80, strokeWidth, strokeWidth)];
    progressView3.alpha = 0.3;
    //样式3
    progressView3.progressBorderWidth = 0;

    progressView3.progressTrackLineWidth = 8;
    progressView3.progressTrackInsideRadius = strokeWidth/2 - progressView3.progressBorderWidth - progressView3.progressTrackLineWidth;
    progressView3.progressTrackColor = [UIColor blackColor];

    progressView3.progressLineWidth = progressView3.progressTrackLineWidth;
    progressView3.progressInsideRadius = progressView3.progressTrackInsideRadius;
    progressView3.progressColor = [UIColor whiteColor];
    [self.view addSubview:progressView3];
    self.progressView3 = progressView3;
    
    YZHCircleProgressView *progressView4 = [[YZHCircleProgressView alloc] initWithFrame:CGRectMake(200, 80, strokeWidth, strokeWidth)];
    progressView4.alpha = 0.3;
    //样式4
    progressView4.progressBorderWidth = 0;

    progressView4.progressTrackLineWidth = 5;
    progressView4.progressTrackInsideRadius = strokeWidth/2 - progressView4.progressBorderWidth - progressView4.progressTrackLineWidth;
    progressView4.progressTrackColor = [UIColor blackColor];

    progressView4.progressLineWidth = progressView4.progressTrackLineWidth;
    progressView4.progressInsideRadius = progressView4.progressTrackInsideRadius;
    progressView4.progressColor = [UIColor whiteColor];
    
    [self.view addSubview:progressView4];
    self.progressView4 = progressView4;

}

-(void)test
{
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(update:) userInfo:nil repeats:YES];
    self.timer = timer;
}

-(void)update:(id)sender
{
    static CGFloat progress = 0.0;
    progress += 0.01;
    if (progress > 1.0) {
//        progress = 0;
        [self.timer invalidate];
        self.timer = nil;
    }
    NSInteger iProgress = progress * 100;
    NSString *text = [NSString stringWithFormat:@"%ld%@",iProgress,@"%"];
//    NSLog(@"text=%@",text);
    self.progressView.titleLabel.text = text;
    [self.progressView setProgress:progress animated:NO];
    if (progress >= 1.0) {
        progress = 0;
    }
}

static int cnt = 0;

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self test];
    
    [self.progressView2 setProgress:1.0 animated:YES];
    
    CGFloat progress = (M_PI/2.5)/(2*M_PI);
    self.progressView3.circleType = CircleProgressViewTypeInfinitePartRadian;
    [self.progressView3 setProgress:progress animated:NO];
    
    if (cnt == 0) {
        self.progressView4.circleType = CircleProgressViewTypeInfiniteAllRadian;
        [self.progressView4 setProgress:1.0 animated:NO];
        cnt = 1;
    }
    else
    {
        [self.progressView4 stopAnimate];
        cnt = 0;
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
