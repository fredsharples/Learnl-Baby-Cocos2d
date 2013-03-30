//
//  SlideShow.h
//  Learnl Baby Cocos2d
//
//  Created by Fred Sharples on 3/26/13.
//  Copyright 2013 Fred Sharples. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface ImageSlideShow : CCLayer {
    
	NSNumber	*imageIndex;
	CCArray		*images;
	CCSprite	*currentImage;
	CCSprite	*oldImage;
    
}

@end