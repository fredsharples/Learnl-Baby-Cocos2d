//
//  GameLayer.m
//  Learnl Baby Cocos2d
//
//  Created by Fred Sharples on 3/26/13.
//  Copyright 2013 Fred Sharples. All rights reserved.
//

#import "GameLayer.h"
#import "LayerTransitions.h"



@implementation GameLayer
// Helper class method that creates a Scene with the GameLayer as the only child.

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	GameLayer *layer = [GameLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
		
        CCSprite *background;
        
		// ask director for the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
		
		if( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ) {
			background = [CCSprite spriteWithFile:@"paper_00.png"];
			background.rotation = 90;
		} else {
			background = [CCSprite spriteWithFile:@"Default-Landscape~ipad.png"];
		}
		background.position = ccp(size.width/2, size.height/2);
        
		// add the label as a child to this Layer
		[self addChild: background];
        
       // [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"MUSIC_intro.caf"];
        [self setTouchEnabled:YES];
        
	}
	return self;
}
- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    // Choose one of the touches to work with
    //UITouch *touch = [touches anyObject];
    
    //FS go to next image in the sequence...
    
}

-(void) onEnter
{
	[super onEnter];
    CGSize size = [[CCDirector sharedDirector] winSize];
    
    GameLayer *LayerTransitions = [LayerTransitions node];
    LayerTransitions.position = ccp(size.width/2, size.height/2);
    [self addChild:LayerTransitions];
}
-(void) nextScene
{
   // [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[TitleLayer scene] ]];
    
    
}
@end