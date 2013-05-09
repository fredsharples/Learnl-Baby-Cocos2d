//
//  LayerB.m
//  Concentration
//
//  Created by Fred Sharples on 4/29/13.
//  Copyright 2013 Fred Sharples. All rights reserved.
//

#import "LayerA.h"
#import "LayerB.h"
#import "AppDelegate.h"
#import "GameLogic.h"


@implementation LayerB
// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	LayerB *layer = [LayerB node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

//
-(id) init
{
	if( (self=[super init])) {
        
        
        GameLogic  * gameLogic_;
        gameLogic_ = [[GameLogic alloc] init];

      [self setTouchEnabled:YES];
        
		// ask director for the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
        
		CCSprite *background;
		
		if( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ) {
             background = [gameLogic_ spriteName_];
            
			//background = [CCSprite spriteWithFile:@"Default.png"];
			background.rotation = 90;
		} else {
			background = [CCSprite spriteWithFile:@"Default-Landscape~ipad.png"];
		}
		background.position = ccp(size.width/2, size.height/2);
        
		// add the background as a child to this Layer
		[self addChild: background];
        
        // create and initialize a Label
		//CCLabelTTF *label = [CCLabelTTF labelWithString:@"Layer B" fontName:@"Marker Felt" fontSize:64];
        
        
		// position the label on the center of the screen
		//label.position =  ccp( size.width /2 , size.height/2 );
		
		// add the label as a child to this Layer
		//[self addChild: label];
        
	}
	
	return self;
}

-(void) onEnter
{
	[super onEnter];
	//[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[LayerA scene] ]];
}
-(void) goNextScene
{
    NSLog(@"goNextScene called in Layer A");
   [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[LayerA scene] ]];
}

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    // Choose one of the touches to work with
    //UITouch *touch = [touches anyObject];
    
    [self goNextScene];
    
    
}
// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

@end
