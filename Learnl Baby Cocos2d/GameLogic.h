//
//  GameLogic.h
//  Learnl Baby Cocos2d
//
//  Created by Fred Sharples on 4/29/13.
//  Copyright 2013 Fred Sharples. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface GameLogic : NSObject {
    NSNumber	*imageIndex;
	CCArray		*images;
	//CCSprite	*oldImage;
    

}
//+(void) setNewImage;
//- (void) changeSlideShowImage;
@property(nonatomic, retain) CCSprite *spriteName_;

@end
