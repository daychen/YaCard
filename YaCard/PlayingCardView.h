//
//  PlayingCardView.h
//  YaCard
//
//  Created by Chen, Ya on 7/21/15.
//  Copyright (c) 2015 Chen, Ya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayingCardView : UIView


@property (nonatomic) NSInteger rank;
@property(strong, nonatomic) NSString *suit;

@property(nonatomic)BOOL faceup;

-(void)pinch:(UIPinchGestureRecognizer *)gesture;
@end
