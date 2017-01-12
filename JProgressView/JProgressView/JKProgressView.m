//
//  JKProgressView.m
//  kuaixian
//
//  Created by Jack on 15/11/25.
//  Copyright © 2015年 Jack_wang. All rights reserved.
//
#define PADDING 10
#define PROGROSSMINUTES 1
#import "JKProgressView.h"
#import "UIView+Layout.h"

@interface JKProgressView(){
    CGFloat _times;
    UIView *trackView;
    UIView *currentView;
    UILabel *currentWarnLabel;
    NSTimer *_progressTimer;
}
@property (nonatomic, assign) float thetime;
@end

@implementation JKProgressView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    return self;
}
-(instancetype)initProgressWithFrame:(CGRect)frame times:(CGFloat)times{
    self = [self initWithFrame:frame];
    [self layoutUIWithTimes:times];
    NSLog(@"self.times----%f",self.times);
    [self resetTimer];
    return self;
}
- (void)layoutUIWithTimes:(CGFloat)times{
    if (self.times) {
        
        
    }
    if (self.name) {
        
        
    }
    if (self.datas) {
        
        
    }
    if (self.dic) {
        
        
    }
    if (self.new) {
        
        
    }


    
    UILabel *startLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    
    startLabel.textColor = [UIColor colorWithRed:0.000f green:0.647f blue:0.929f alpha:1.00f];

    startLabel.text = [NSString stringWithFormat:@"%lds",(long)times ];
    
    [self addSubview:startLabel];
    
    UILabel *endLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.frame)-30, startLabel.y, 30, 30)];
    endLabel.textColor = [UIColor colorWithRed:0.000f green:0.647f blue:0.929f alpha:1.00f];
    endLabel.text = @"0s";
    [self addSubview:endLabel];
    
    trackView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(startLabel.frame) + 8, 15 + startLabel.y, self.width - CGRectGetMaxX(startLabel.frame) - (self.width - CGRectGetMinX(endLabel.frame))-20, 2)];
    trackView.backgroundColor = [UIColor colorWithRed:0.871f green:0.871f blue:0.871f alpha:1.00f];
    [self addSubview:trackView];
    
    currentView = [[UIView alloc] initWithFrame:trackView.bounds];
    currentView.width = trackView.width * 0;
    currentView.backgroundColor = [UIColor colorWithRed:0.000f green:0.647f blue:0.929f alpha:1.00f];
    currentView.x = trackView.x;
    currentView.y = trackView.y;
    [self addSubview:currentView];
    
    currentWarnLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    currentWarnLabel.font = [UIFont systemFontOfSize:10.0f];
    currentWarnLabel.layer.cornerRadius = currentWarnLabel.width * 0.5;
    currentWarnLabel.clipsToBounds = YES;
    currentWarnLabel.backgroundColor = [UIColor colorWithRed:0.000f green:0.647f blue:0.929f alpha:1.00f];
    currentWarnLabel.textColor = [UIColor whiteColor];
    currentWarnLabel.textAlignment = NSTextAlignmentCenter;
    currentWarnLabel.userInteractionEnabled = YES;
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleProgress:)];
    [currentWarnLabel addGestureRecognizer:panGestureRecognizer];
    currentWarnLabel.text = @"60";
    currentWarnLabel.x = CGRectGetMaxX(currentView.frame) - currentWarnLabel.width * 0.5;
    currentWarnLabel.y = CGRectGetMaxY(currentView.frame) - currentWarnLabel.height * 0.6;
    [self addSubview:currentWarnLabel];
    

}

- (void)handleProgress:(UIPanGestureRecognizer *)sender{
    
    CGPoint point = [sender translationInView:self];
    if (sender.state == UIGestureRecognizerStateBegan) {
        [_progressTimer setFireDate:[NSDate distantFuture]];
    }else if (sender.state == UIGestureRecognizerStateChanged){
        
        sender.view.center = CGPointMake(sender.view.center.x + point.x, sender.view.center.y);
        sender.view.centerX = sender.view.centerX > trackView.x ?sender.view.centerX : trackView.x;
        sender.view.centerX = sender.view.centerX < CGRectGetMaxX(trackView.frame) ?sender.view.centerX : CGRectGetMaxX(trackView.frame) ;
        currentView.width = sender.view.center.x - currentView.x;
        [sender setTranslation:CGPointMake(0, 0) inView:self];
        float add = (60 * (point.x/trackView.width));
        self.thetime -= add;
        self.thetime = self.thetime < 60 ? self.thetime : 60;
        self.thetime = self.thetime > 0 ? self.thetime : 0;
        currentWarnLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)self.thetime];
        
    }else if (sender.state == UIGestureRecognizerStateEnded){
        [_progressTimer setFireDate:[NSDate distantPast]];
    }
    
}
- (void)updateProgress{
    if (self.thetime < 0 || self.thetime > 60) {
        self.thetime = 60;
    }
    self.thetime -= 1;
    if (0 == self.thetime) {
//        [self refreshQRCode];
    }
    currentWarnLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)self.thetime];
    
    currentView.width = trackView.width * (1 - (self.thetime/60));
    currentWarnLabel.x = CGRectGetMaxX(currentView.frame) - currentWarnLabel.width * 0.5;
    
}
- (void)resetTimer{
    
    if (_progressTimer) {
        [_progressTimer invalidate];
        _progressTimer = nil;
    }
    
    _progressTimer = [NSTimer scheduledTimerWithTimeInterval:PROGROSSMINUTES target:self selector:@selector(updateProgress) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_progressTimer forMode:NSRunLoopCommonModes];
    
}
- (float)thetime{
    if (!_thetime) {
        [self addObserver:self forKeyPath:@"thetime" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
        _thetime = 60;
    }
    return _thetime;
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if (0 == [[change objectForKey:@"new"] integerValue]) {
    }
}
//- (void)dealloc{
//    [super dealloc];
//    [self removeObserver:self forKeyPath:@"thetime"];
//}
-(void)setTimes:(CGFloat)times{
    _times = times;
}
-(CGFloat)times{
    
    return _times;
}

@end
