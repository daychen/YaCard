//
//  PlayingCard.h
//  YaCardGame
//
//  Created by Chen, Ya on 7/13/15.
//  Copyright (c) 2015 Chen, Ya. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card
@property(strong, nonatomic)NSString *suit;
@property(nonatomic)NSUInteger rank;

+(NSArray *)validSuits;
+(NSUInteger)maxRank;
@end
