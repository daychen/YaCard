//
//  PlayingCardView.m
//  YaCard
//
//  Created by Chen, Ya on 7/21/15.
//  Copyright (c) 2015 Chen, Ya. All rights reserved.
//

#import "PlayingCardView.h"

@interface PlayingCardView()
@property(nonatomic)CGFloat cardImageScaleFactor;

@end
@implementation PlayingCardView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



@synthesize cardImageScaleFactor=_cardImageScaleFactor;


#pragma mark -properties

-(void)setCardImageScaleFactor:(CGFloat)cardImageScaleFactor{
    _cardImageScaleFactor=cardImageScaleFactor;
    [self setNeedsDisplay];

}

#define DEFAULT_CARD_SCALE_FACTOR 0.90

-(CGFloat)cardImageScaleFactor{
    if (!_cardImageScaleFactor) {
        _cardImageScaleFactor=DEFAULT_CARD_SCALE_FACTOR;
    }
    
    return _cardImageScaleFactor;

}
-(void)setSuit:(NSString *)suit{
    _suit=suit;
    [self setNeedsDisplay];

}

-(void)setRank:(NSInteger)rank{
    _rank=rank;
    [self setNeedsDisplay];
}

-(void)setFaceup:(BOOL)faceup{
    _faceup=faceup;
    [self setNeedsDisplay];
}


#pragma mark -drawCard
#define CORNER_FONT_STANDARD_HEIGHT 180.0
#define CORNER_RADIUS 12.0


-(CGFloat)cornerScaleFactor {
    return self.bounds.size.height/CORNER_FONT_STANDARD_HEIGHT;
}
-(CGFloat)cornerRadius{
    return CORNER_RADIUS*[self cornerScaleFactor];
}
-(CGFloat)cornerOffset{
    return [self cornerRadius]/3.0;
}


#
- (void)drawRect:(CGRect)rect {
    
    
    UIBezierPath *roundRect=[UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:[self cornerRadius]];
    [roundRect addClip];
    [[UIColor whiteColor]setFill];
    UIRectFill(self.bounds);
    
    
    if (self.faceup) {
        
    
        UIImage *cardImage=[UIImage imageNamed:[NSString stringWithFormat:@"%@%@",[self rankString],self.suit]];
        if (cardImage) {
            
            CGRect imageRect=CGRectInset(self.bounds, self.bounds.size.width*(1-self.cardImageScaleFactor), self.bounds.size.height*(1-self.cardImageScaleFactor));
            [cardImage drawInRect:imageRect];
        }else{
            
            [self drawpips];
            
        }
        
        [self drawCorner];
        
    }
    else{
    
        [[UIImage imageNamed:@"cardback"]drawInRect:self.bounds];
    }
}


-(void)drawpips{

    int pipsCount=self.rank;
    
    
    CGRect pipsRect=CGRectInset(self.bounds, self.bounds.size.width*(1-self.cardImageScaleFactor), self.bounds.size.height*(1-self.cardImageScaleFactor));
    
    NSMutableParagraphStyle *cardSuitStyle=[[NSMutableParagraphStyle alloc]init];
    cardSuitStyle.alignment=NSTextAlignmentCenter;
    
    
    NSAttributedString *cardSingleSuit=[[NSAttributedString alloc]initWithString:self.suit attributes:@{NSParagraphStyleAttributeName:cardSuitStyle}];
    
    switch (pipsCount) {
        case 1:
            [cardSingleSuit drawInRect:pipsRect];

            
            break;
        
        default:
            break;
    }
                                 

}


-(void)pinch:(UIPinchGestureRecognizer *)gesture{

    if ((gesture.state==UIGestureRecognizerStateEnded )|| (gesture.state==UIGestureRecognizerStateChanged)) {
        
        self.cardImageScaleFactor*=gesture.scale;
        gesture.scale=1.0;
    }
}

-(NSString *)rankString{
    
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"][self.rank];

}
-(void)drawCorner{
    
    
    NSMutableParagraphStyle *cornerStyle=[[NSMutableParagraphStyle alloc]init];
    cornerStyle.alignment=NSTextAlignmentCenter;
    
    UIFont *cornerFont=[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    cornerFont=[cornerFont fontWithSize:cornerFont.pointSize*[self cornerScaleFactor]];
    
    NSAttributedString *cornerText=[[NSAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@\n%@",[self rankString],self.suit] attributes:@{NSFontAttributeName:cornerFont,NSParagraphStyleAttributeName:cornerStyle}];

    
    CGRect textbounds;
    textbounds.origin=CGPointMake([self cornerOffset], [self cornerOffset]);
    
    textbounds.size=cornerText.size;
    
    [cornerText drawInRect:textbounds];
    
    
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, self.bounds.size.width, self.bounds.size.height);
    CGContextRotateCTM(context, M_PI);
    
      [cornerText drawInRect:textbounds];
    
    
}

#pragma mark -Initializer

-(void) setup{

    self.backgroundColor=nil;
    self.opaque=NO;
    self.contentMode=UIViewContentModeRedraw;
}
-(void)awakeFromNib{
    [self setup];
}
@end
