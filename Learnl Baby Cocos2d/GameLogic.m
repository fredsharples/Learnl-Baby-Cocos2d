//
//  GameLogic.m
//  Learnl Baby Cocos2d
//
//  Created by Fred Sharples on 4/29/13.
//  Copyright 2013 Fred Sharples. All rights reserved.
//

#import "GameLogic.h"


@implementation GameLogic

-(id) init {
if( (self=[super init]) ){

    //temporarily set up an image array. Will read from plist later
    images = [CCArray new];
    [images addObject:[CCSprite spriteWithFile:@"screen_bear_image.png"]];
    [images addObject:[CCSprite spriteWithFile:@"screen_bear_drawing_01.png"]];
    [images addObject:[CCSprite spriteWithFile:@"screen_bear_word.png"]];
    
    [images addObject:[CCSprite spriteWithFile:@"screen_bee_image.png"]];
    [images addObject:[CCSprite spriteWithFile:@"screen_bee_drawing_01.png"]];
    [images addObject:[CCSprite spriteWithFile:@"screen_bee_word.png"]];
    
    [images addObject:[CCSprite spriteWithFile:@"screen_cow_image.png"]];
    [images addObject:[CCSprite spriteWithFile:@"screen_cow_drawing_01.png"]];
    [images addObject:[CCSprite spriteWithFile:@"screen_cow_word.png"]];
    
    //FS need to make sequencial
    imageIndex = [NSNumber numberWithInt:(arc4random() % ( [images count] - 1 ))];
    //spriteName_ = @"screen_cow_word.png";
    
}
    return self;
}

- (CCSprite*) spriteName_ {
	return [images objectAtIndex:[imageIndex intValue]];;
}

/*------------------------------------------------------------------------------------------------*\
 |* DISPOSE METHODS -------------------------------------------------------------------------------*|
 \*------------------------------------------------------------------------------------------------*/


//View Did Unload Handler
- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void)dealloc {
	[super dealloc];
    
}

@end
