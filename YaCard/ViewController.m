//
//  ViewController.m
//  YaCard
//
//  Created by Chen, Ya on 7/21/15.
//  Copyright (c) 2015 Chen, Ya. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardView.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet PlayingCardView *playingCardView;

@property(strong,nonatomic)PlayingCardDeck *deck;

@end

@implementation ViewController



-(PlayingCardDeck *)deck{

    if (!_deck) {
        _deck=[[PlayingCardDeck alloc]init];
    }
    
    return _deck;
}

- (IBAction)swipeToFoldCard:(UISwipeGestureRecognizer *)sender {
    if (!self.playingCardView.faceup) {
        id card=[self.deck drawRandomCard];
        if ([card isKindOfClass:[PlayingCard class]]) {
            PlayingCard *singleCard=(PlayingCard *)card;
            self.playingCardView.rank=1;
            self.playingCardView.suit=@"♥";
        }
        
    }
    
    self.playingCardView.faceup=!self.playingCardView.faceup;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    
    
    [self.playingCardView addGestureRecognizer:[[UIPinchGestureRecognizer alloc]initWithTarget:self.playingCardView action:@selector(pinch:)]];
}

@end
