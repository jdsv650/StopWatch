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
    int buttonPressed;
}


-(IBAction)startStopTimer:(id)sender;
-(IBAction)resetTimer:(id)sender;
-(void)updateTime:(NSTimer *) tmr;

@end


@implementation MMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];    
    buttonPressed = 0;
    elapsedTime = 0;  //Reset Time
    
	// Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)startStopTimer:(id)sender
{
    
   SEL sel = @selector(updateTime:);
    
    /******
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
     
     ******/
    
    
      UIButton *sbutton = (UIButton*)sender;
    
    // if start button
    if(buttonPressed == 0)  {
       // elapsedTimeLabel.text = @"ON";
        
        [sbutton  setTitle:@"Stop" forState:UIControlStateNormal];
        
        if([elapsedTimeTimer isValid]) {
            //do nothing
        }
        else { //start timer
            elapsedTimeTimer = [NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:sel userInfo:nil repeats:YES];
        }
        buttonPressed = 1; //toggle button functionality
    }
    else   // stop button
    {
       // elapsedTimeLabel.text = @"OFF";
     
        
        [sbutton  setTitle:@"Start" forState:UIControlStateNormal];
        
        sbutton.backgroundColor = [UIColor redColor];
        
        [elapsedTimeTimer invalidate];
        elapsedTimeTimer = nil;
        
        elapsedTimeLabel.text = [NSString stringWithFormat:@"%0.3f",elapsedTime];
        
        buttonPressed =0;  //toggle button functionality
    }
    

}

-(void)updateTime:(NSTimer *) tmr
{
    elapsedTime = elapsedTime + 0.001;
   // elapsedTimeLabel.text = [[elapsedTimeLabel text] stringByAppendingString:@"A"];
    elapsedTimeLabel.text = [NSString stringWithFormat:@"%0.3f",elapsedTime];
}


-(IBAction)resetTimer:(id)sender {

    buttonPressed = 0;
    elapsedTime = 0;
   [elapsedTimeTimer invalidate];
    elapsedTimeTimer = nil;
        
    elapsedTimeLabel.text = [NSString stringWithFormat:@"%0.3f",elapsedTime];
    startStopTimer:sender;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
