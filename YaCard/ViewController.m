//
//  ViewController.m
//  YaCard
//
//  Created by Chen, Ya on 7/21/15.
//  Copyright (c) 2015 Chen, Ya. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet PlayingCardView *playingCardView;

@end

@implementation ViewController
- (IBAction)swipeToFoldCard:(UISwipeGestureRecognizer *)sender {
    
    
    self.playingCardView.faceup=!self.playingCardView.faceup;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.playingCardView.rank=3;
    self.playingCardView.suit=@"♥︎";
   
    
    [self.playingCardView addGestureRecognizer:[[UIPinchGestureRecognizer alloc]initWithTarget:self.playingCardView action:@selector(pinch:)]];
}

@end
