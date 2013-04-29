//
//  GameLayer.m
//  Learnl Baby Cocos2d
//
//  Created by Fred Sharples on 3/26/13.
//  Copyright 2013 Fred Sharples. All rights reserved.
//

#import "GameLayer.h"
//#import "TransitionLayers.h"

#define TRANSITION_DURATION (1.2f)

@interface TransitionPageBackward : CCTransitionPageTurn
+(id) transitionWithDuration:(ccTime) t scene:(CCScene*)s;
@end

@interface TransitionPageForward : CCTransitionPageTurn
+(id) transitionWithDuration:(ccTime) t scene:(CCScene*)s;
@end

@implementation TransitionPageForward
+(id) transitionWithDuration:(ccTime) t scene:(CCScene*)s {
	return [self transitionWithDuration:t scene:s backwards:NO];
}
@end

@implementation TransitionPageBackward
+(id) transitionWithDuration:(ccTime) t scene:(CCScene*)s {
	return [self transitionWithDuration:t scene:s backwards:YES];
}
@end


/////

Class nextTransition(void);
Class backTransition(void);
Class restartTransition(void);




Class nextTransition()
{
	// HACK: else NSClassFromString will fail FS can likely remove this..
	[CCTransitionProgressRadialCCW node];
    
    Class c = NSClassFromString(@"TransitionPageForward");
	return c;
}

Class backTransition()
{
	// HACK: else NSClassFromString will fail
	[CCTransitionFade node];
    
    Class c = NSClassFromString(@"TransitionPageBackward");
    return c;
}

Class restartTransition()
{
	// HACK: else NSClassFromString will fail
	[CCTransitionFade node];
    
	Class c = NSClassFromString(@"CCTransitionShrinkGrow");
	return c;
}

#pragma mark First Transtion Layer Object

@implementation TransitionLayer_A
-(id) init
{
	if( (self=[super init]) ) {
        
		//float x,y;
        
		//CGSize s = [[CCDirector sharedDirector] winSize];
		//x = s.width;
		//y = s.height;
        
        //GameLayer *gameObj;
        
        //imageIndex = [NSNumber numberWithInt:3];
        
        //CCSprite *newImage = [gameObj.spriteList objectAtIndex:[imageIndex intValue]];
        //NSLog(@"------> images is %lu",(unsigned long)images.count);
        //CCSprite *bg1 = newImage;
        
		//CCSprite *bg1 = [CCSprite spriteWithFile:@"screen_cat_drawing_01.png"];
        
        //imageIndex = [NSNumber numberWithInt:(arc4random() % ( [gameObj.spriteList count] - 1 ))];
        
        //NSLog(@"------> spriteList is %lu",(unsigned long)gameObj.spriteList.count);
        //CCArray *tempArray = gameObj.spriteList;
        
        imageIndex = [NSNumber numberWithInt:2];
       // CCSprite *bg1 = [gameObj.spriteList objectAtIndex:[imageIndex intValue]];

        
        //bg1.rotation = 90;
		//bg1.position = ccp(s.width/2, s.height/2);
		//[self addChild:bg1 z:-1];
        
        NSLog(@"------> Scene#1 init!");
        //Put extra screen items here
		
		[self setTouchEnabled:YES];
		[self schedule:@selector(step:) interval:1.0f];
	}
    
	return self;
}

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    // Choose one of the touches to work with
    //UITouch *touch = [touches anyObject];
    
    //FS go to next image in the sequence...
    [self restartCallback:self];
    
}

- (void) dealloc
{
	NSLog(@"------> Scene#1 dealloc!");
	[super dealloc];
}

-(void) step:(ccTime)dt
{
	//NSLog(@"Scene1#step called");
}
-(void) nextCallback:(id) sender
{
	Class transition = nextTransition();
	CCScene *s2 = [TransitionLayer_B node];
	[[CCDirector sharedDirector] replaceScene: [transition transitionWithDuration:TRANSITION_DURATION scene:s2]];
    
}

-(void) backCallback:(id) sender
{
	Class transition = backTransition();
	CCScene *s2 = [TransitionLayer_B node];
	[[CCDirector sharedDirector] replaceScene: [transition transitionWithDuration:TRANSITION_DURATION scene:s2]];
}

-(void) restartCallback:(id) sender
{
	Class transition = restartTransition();
	CCScene *s2 = [TransitionLayer_B node];
	[[CCDirector sharedDirector] replaceScene: [transition transitionWithDuration:TRANSITION_DURATION scene:s2]];
}
-(void) onEnter
{
	[super onEnter];
	NSLog(@"Scene 1 onEnter");
}

-(void) onEnterTransitionDidFinish
{
	[super onEnterTransitionDidFinish];
	NSLog(@"Scene 1: onEnterTransitionDidFinish");
}

-(void) onExitTransitionDidStart
{
	[super onExitTransitionDidStart];
	NSLog(@"Scene 1: onExitTransitionDidStart");
}

-(void) onExit
{
	[super onExit];
	NSLog(@"Scene 1 onExit");
}
@end

#pragma mark Second Transtion Layer

//Second layer
@implementation TransitionLayer_B
-(id) init
{
	if( (self=[super init]) ) {
        
		float x,y;
        
		CGSize size = [[CCDirector sharedDirector] winSize];
		x = size.width;
		y = size.height;
        
		CCSprite *bg2 = [CCSprite spriteWithFile:@"screen_bear_drawing_01.png"];
        bg2.rotation = 90;
		bg2.position = ccp(size.width/2, size.height/2);
		[self addChild:bg2 z:-1];
        
        [self setTouchEnabled:YES];
		
		[self schedule:@selector(step:) interval:1.0f];
        NSLog(@"------> Scene#2 init has been called");
	}
    
	return self;
}

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    // Choose one of the touches to work with
    //UITouch *touch = [touches anyObject];
    
    //FS go to next image in the sequence...
    [self nextCallback:self];
    
}


- (void) dealloc
{
	NSLog(@"------> Scene#2 dealloc!");
	[super dealloc];
    
}


-(void) nextCallback:(id) sender
{
	Class transition = nextTransition();
	CCScene *s2 = [CCScene node];
	[s2 addChild: [TransitionLayer_A node]];
	[[CCDirector sharedDirector] replaceScene: [transition transitionWithDuration:TRANSITION_DURATION scene:s2]];
}

-(void) backCallback:(id) sender
{
	Class transition = backTransition();
	CCScene *s2 = [CCScene node];
	[s2 addChild: [TransitionLayer_A node]];
	[[CCDirector sharedDirector] replaceScene: [transition transitionWithDuration:TRANSITION_DURATION scene:s2]];
}

-(void) restartCallback:(id) sender
{
	Class transition = restartTransition();
	CCScene *s2 = [CCScene node];
	[s2 addChild: [TransitionLayer_A node]];
	[[CCDirector sharedDirector] replaceScene: [transition transitionWithDuration:TRANSITION_DURATION scene:s2]];
}
-(void) step:(ccTime)dt
{
	//NSLog(@"Scene2#step called");
}


/// callbacks
-(void) onEnter
{
	[super onEnter];
	NSLog(@"Scene 2 onEnter");
}

-(void) onEnterTransitionDidFinish
{
	[super onEnterTransitionDidFinish];
	NSLog(@"Scene 2: onEnterTransitionDidFinish");
}

-(void) onExitTransitionDidStart
{
	[super onExitTransitionDidStart];
	NSLog(@"Scene 2: onExitTransitionDidStart");
}

-(void) onExit
{
	[super onExit];
	NSLog(@"Scene 2 onExit");
}
@end

#pragma mark Controller (GameLayer)
@implementation GameLayer

@synthesize spriteList=images_;

// Helper class method that creates a Scene with the GameLayer as the only child.
//FS we need a scene for the Title Layer to go to. Might want to init this object from the delegate?


+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	//GameLayer *layer = [TransitionLayer_A node];
	
	GameLayer *layer = [[GameLayer alloc] init];
     //[layer buildSpriteList];
    
    // add layer as a child to scene
	[scene addChild: layer];
	// return the scene
	return scene;
}

-(void)buildSpriteList{
    
    images_ = [CCArray new];
    [images_ addObject:[CCSprite spriteWithFile:@"screen_bear_image.png"]];
    [images_ addObject:[CCSprite spriteWithFile:@"screen_bear_drawing_01.png"]];
    [images_ addObject:[CCSprite spriteWithFile:@"screen_bear_word.png"]];
    
    [images_ addObject:[CCSprite spriteWithFile:@"screen_bee_image.png"]];
    [images_ addObject:[CCSprite spriteWithFile:@"screen_bee_drawing_01.png"]];
    [images_ addObject:[CCSprite spriteWithFile:@"screen_bee_word.png"]];
    
    [images_ addObject:[CCSprite spriteWithFile:@"screen_cow_image.png"]];
    [images_ addObject:[CCSprite spriteWithFile:@"screen_cow_drawing_01.png"]];
    [images_ addObject:[CCSprite spriteWithFile:@"screen_cow_word.png"]];
    NSLog(@"------> GameLayer SpriteList Built");
    
}



// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
		NSLog(@"------> GameLayer init");
       
        //Set up the asset filename list (temp) will get from a plist later.
       // [self buildSpriteList];
        
        CCSprite *background;
        
		// ask director for the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
		
		if( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ) {
			background = [CCSprite spriteWithFile:@"paper_00.png"];
            //imageIndex = [NSNumber numberWithInt:6];
            //background = [images objectAtIndex:[imageIndex intValue]];
			//background.rotation = 90;
            
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
//- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    // Choose one of the touches to work with
    //UITouch *touch = [touches anyObject];
    
    //FS go to next image in the sequence...
   // [self nextCallback:self];
    
//}

-(void) onEnter
{
	[super onEnter];
    
    //CGSize size = [[CCDirector sharedDirector] winSize];

    CCScene *sceneA = [CCScene node];
    [sceneA addChild: [TransitionLayer_A node]];
    [[CCDirector sharedDirector] runWithScene:sceneA];
    NSLog(@"------> GameLayer onEnter");
    //[director runWithScene:scene];
    
}


@end
