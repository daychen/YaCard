//
//  PlayingCard.m
//  YaCardGame
//
//  Created by Chen, Ya on 7/13/15.
//  Copyright (c) 2015 Chen, Ya. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

-(int)match:(NSArray *)otherCards{

    int score=0;
    
    if ([otherCards count]) {
        
        id card=[otherCards firstObject];
        if ([card isKindOfClass:[PlayingCard class]]) {
           
            PlayingCard *otherCard=(PlayingCard*)card;
            if ([self.suit isEqualToString:otherCard.suit]) {
                score=1;
            }
            if (self.rank == otherCard.rank) {
                score=4;
            }
        }
        
       
    }
    
    if ([otherCards count]>1) {
        score+=[[otherCards firstObject] match:[otherCards subarrayWithRange:NSMakeRange(1, [otherCards count]-1)]];
    }
    
    return  score;
}

-(NSString*)contents{
    
    NSArray* rankString=[PlayingCard rankStrings];
  
    return [rankString[self.rank] stringByAppendingString:self.suit];
}


@synthesize suit=_suit;

+(NSArray *) validSuits{
    return @[@"♠",@"♣",@"♥",@"♦"];

}

+(NSArray *)rankStrings{
    
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

-(void)setSuit:(NSString *)suit{
    
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit=suit;
    }
}


-(NSString *)suit{
    return _suit? _suit:@"?";
}


+(NSUInteger)maxRank{
    return [[PlayingCard rankStrings] count]-1;
}

-(void)setRank:(NSUInteger)rank{
    if (rank <= [PlayingCard maxRank]) {
        _rank=rank;
    }

}
@end
