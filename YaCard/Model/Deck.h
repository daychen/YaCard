//
//  Deck.h
//  YaCardGame
//
//  Created by Chen, Ya on 7/13/15.
//  Copyright (c) 2015 Chen, Ya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

-(void)addCard:(Card *)card atTop:(BOOL)atTop;
-(void)addCard:(Card *)card;
-(Card *)drawRandomCard;

@end
