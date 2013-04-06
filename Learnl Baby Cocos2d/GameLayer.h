//
//  GameLayer.h
//  Learnl Baby Cocos2d
//
//  Created by Fred Sharples on 3/26/13.
//  Copyright 2013 Fred Sharples. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCLayer.h"
#import "cocos2d.h"
#define TRANSITION_DURATION (1.2f)

CCArray		*images;
NSNumber	*imageIndex;

@interface GameLayer : CCLayer
// returns a CCScene that contains GameLayer
{
}

+(CCScene *) scene;
@end

//layer for going back and forth with transitions
@interface TransitionLayer_A : CCLayer
//
@end

//2nd layer for going back and forth with transitions
@interface TransitionLayer_B : CCLayer
//
@end

