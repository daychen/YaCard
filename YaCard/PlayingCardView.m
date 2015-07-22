//
//  PlayingCardView.m
//  YaCard
//
//  Created by Chen, Ya on 7/21/15.
//  Copyright (c) 2015 Chen, Ya. All rights reserved.
//

#import "PlayingCardView.h"

@implementation PlayingCardView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

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


#define CORNER_FONT_STANDARD_HEIGHT 180.0
#define CORNER_RADIUS 12.0
#pragma mark properties

-(CGFloat)cornerScaleFactor {
    return self.bounds.size.height/CORNER_FONT_STANDARD_HEIGHT;
}
-(CGFloat)cornerRadius{
    return CORNER_RADIUS*[self cornerScaleFactor];
}
-(CGFloat)cornerOffset{
    return [self cornerRadius]/3.0;
}


- (void)drawRect:(CGRect)rect {
    
    
    UIBezierPath *roundRect=[UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:[self cornerRadius]];
    [roundRect addClip];
    [[UIColor whiteColor]setFill];
    UIRectFill(self.bounds);
    
    
    [self drawCorner];
}

-(NSString *)rankString{
    
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"][self.rank];

}
-(void)drawCorner{
    
    
    NSMutableParagraphStyle *cornerStyle=[[NSMutableParagraphStyle alloc]init];
    cornerStyle.alignment=NSTextAlignmentCenter;
    
    UIFont *cornerFont=[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    cornerFont=[cornerFont fontWithSize:cornerFont.pointSize*[self cornerRadius]];
    
    NSAttributedString *cornerText=[[NSAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@\n%@",[self rankString],self.suit] attributes:@{NSFontAttributeName:cornerFont,NSParagraphStyleAttributeName:cornerStyle}];

    
    CGRect textbounds;
    textbounds.origin=CGPointMake([self cornerOffset], [self cornerOffset]);
    
    textbounds.size=cornerText.size;
    
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
