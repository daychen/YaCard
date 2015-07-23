//
//  Card.m
//  YaCardGame
//
//  Created by Chen, Ya on 7/13/15.
//  Copyright (c) 2015 Chen, Ya. All rights reserved.
//

#import "Card.h"

@interface Card()

@end

@implementation Card


-(int) match:(NSArray *)otherCards{

    int score=0;
    
    for (Card *card in otherCards ) {
        
    
        if ([self.contents isEqualToString:card.contents]) {
            score=1 ;
        }
        
    }
    
    return score;
}

@end
