//
//  Card.h
//  YaCardGame
//
//  Created by Chen, Ya on 7/13/15.
//  Copyright (c) 2015 Chen, Ya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic,getter=isMatched) BOOL matched;

-(int) match:(NSArray *)otherCards;
@end
