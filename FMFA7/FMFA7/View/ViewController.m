//
//  ViewController.m
//  FMFA7
//
//  Created by Web Libre Consulting on 03/11/2016.
//  Copyright © 2016 Belzanti. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

@property (nonatomic, retain) AVPlayerViewController *playerViewController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *stringVideoPath = [[NSBundle mainBundle] pathForResource:@"intro" ofType:@"mov"];
    NSAssert(stringVideoPath, @"Expected not nil video file");
    
    NSURL *urlVideoFile = [NSURL fileURLWithPath:stringVideoPath];
    NSAssert(urlVideoFile, @"Expected not nil video url");
    
    _playerViewController = [[AVPlayerViewController alloc] init];
    _playerViewController.player = [AVPlayer playerWithURL:urlVideoFile];
    _playerViewController.view.frame = self.view.bounds;
    _playerViewController.showsPlaybackControls = NO;
    [_playerViewController.player play];
    [_playerViewController setDelegate:self];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didFinishPlaying) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    
    [self.view addSubview:_playerViewController.view];
    self.view.autoresizesSubviews = YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    _playerViewController = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Player delegate

- (void)didFinishPlaying{
    [self performSegueWithIdentifier:@"root" sender:self];
}


@end
