//
//  MMViewController.m
//  StopWatch2
//
//  Created by James Donner on 2/8/13.
//  Copyright (c) 2013 jdsv650. All rights reserved.
//

#import "MMViewController.h"
#import <math.h>

@interface MMViewController ()
{
    IBOutlet UILabel *elapsedTimeLabel;  //label to display time
    IBOutlet UIButton *startButton;      //start/stop button
    NSTimer *elapsedTimeTimer;           //Timer to track elapsed time
    double elapsedTime;                  //elapsed time as double
    BOOL isButtonPressed;                //flag start/stop button
}


-(IBAction)startStopTimer:(id)sender;   //start/stop the timer
-(IBAction)resetTimer:(id)sender;
-(void)updateTime:(NSTimer *) tmr;      //called at timer interval

@end


@implementation MMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    isButtonPressed = NO;
    elapsedTime = 0;       //set elapsed time to 0
    // custom font use fontbook name
    [elapsedTimeLabel setFont: [UIFont fontWithName:@"FFF Tusj" size: 46.0]];
}


// handle start/stop button
-(IBAction)startStopTimer:(id)sender
{
    
   //method to call at preset interval
   SEL sel = @selector(updateTime:);
    
    /******  code to tag and identifiy two separate buttons  --------
    UIButton *button = (UIButton*)sender;
    if (button.tag == 1) {
        if([elapsedTimeTimer isValid]) {
            //do nothing
        }
        else { //start timer
        elapsedTimeTimer = [NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:sel userInfo:nil repeats:YES];
        }
    
    }
    
    if(button.tag == 2) {   //stop button -- end timer
        [elapsedTimeTimer invalidate];
        elapsedTimeTimer = nil;
        
        NSLog(@"Called invalidate");
        elapsedTimeLabel.text = [NSString stringWithFormat:@"%0.3f",elapsedTime];
        
    }
        
   // elapsedTimeTimer = [NSTimer timerWithTimeInterval:0.001 target:self selector:sel userInfo:nil repeats:YES];
     ************************************/
    
    //need start/stop button to update title
    UIButton *sButton = (UIButton*)sender;
    
    if(!isButtonPressed)  {
        
        [sButton  setTitle:@"Stop" forState:UIControlStateNormal];
        [sButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        
        if([elapsedTimeTimer isValid]) {
            //do nothing if timer is already running
        }
        else { //start timer
            elapsedTimeTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:sel userInfo:nil repeats:YES];
        }
        isButtonPressed = YES; //toggle button on
    }
    else   // stop button
    {
        [sButton  setTitle:@"Start" forState:UIControlStateNormal];
        [sButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        
        [elapsedTimeTimer invalidate];
        elapsedTimeTimer = nil;
    
        isButtonPressed = NO;  //toggle button off
    }
    
}

// increment elapsed time and format output label
-(void)updateTime:(NSTimer *) tmr
{
    elapsedTime = elapsedTime + 0.01;
    
    int hours = 0;
    int minutes = 0;
    int seconds = 0;
    float fractionPart = 0;
    int tenthsDisplay = 0;
    double temp = elapsedTime;
    
    //get decimal portion by subtracting from the integer value (floor)
    fractionPart = elapsedTime - (floor(elapsedTime));
    
    //get tenths to display
    tenthsDisplay = fractionPart /0.1;   
    
    if(temp >=3600) {
        hours = floor(temp / 3600);   //get hours
        temp = temp - (hours * 3600); //decrement seconds in that many hours
    }
    else
        hours = 0;  //no hours display 0
    
    if(temp >= 60) {
        minutes = floor(temp / 60);   //get minutes
        temp = temp - (minutes * 60); //derement seconds in that many minutes
    }
    else
        minutes = 0;  //no mins display 0
    
    seconds = temp;  //seconds remain
    
   
    elapsedTimeLabel.text = [NSString stringWithFormat:@"%2d:%2d:%2d:%2d",hours, minutes, seconds, tenthsDisplay];

   // elapsedTimeLabel.text = [NSString stringWithFormat:@"%0.2f",elapsedTime];
}


-(IBAction)resetTimer:(id)sender {
    
    [startButton setTitle:@"Start" forState:UIControlStateNormal];
    [startButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];

    isButtonPressed = NO;
    elapsedTime = 0;
    [elapsedTimeTimer invalidate];
    elapsedTimeTimer = nil;
    elapsedTimeLabel.text = [NSString stringWithFormat:@"%2d:%2d:%2d:%2d",0, 0, 0, 0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
