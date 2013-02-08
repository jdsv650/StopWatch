//
//  MMViewController.m
//  StopWatch2
//
//  Created by James Donner on 2/8/13.
//  Copyright (c) 2013 jdsv650. All rights reserved.
//

#import "MMViewController.h"

@interface MMViewController ()
{
    IBOutlet UILabel *elapsedTimeLabel;
    NSTimer *elapsedTimeTimer;
    double elapsedTime;
}

-(IBAction)startTimer:(id)sender;
-(IBAction)stopTimer:(id)sender;
-(void)updateTime:(NSTimer *)tmr;

@end


@implementation MMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)startTimer:(id)sender
{
    elapsedTime = 0;  //Reset Time
    
    NSRunLoop* myRunLoop = [NSRunLoop currentRunLoop];
    
   // Clock *clk = [[Clock alloc] init];
   SEL sel = @selector(updateTime:);
    
    elapsedTimeTimer = [[NSTimer alloc] init];
    elapsedTimeTimer = [NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:sel userInfo:nil repeats:YES];
    
    [myRunLoop addTimer:elapsedTimeTimer forMode:NSDefaultRunLoopMode];
    
   // while ([[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
                                //beforeDate:[NSDate distantFuture]])
}

-(void)updateTime:(NSTimer *)tmr
{
    elapsedTime = elapsedTime + 0.001;
   // elapsedTimeLabel.text = [[elapsedTimeLabel text] stringByAppendingString:@"A"];
    elapsedTimeLabel.text = [NSString stringWithFormat:@"%0.3f",elapsedTime];
}


-(IBAction)stopTimer:(id)sender {
    
    [elapsedTimeTimer invalidate];
    elapsedTimeLabel.text = [NSString stringWithFormat:@"%0.3f",elapsedTime];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
