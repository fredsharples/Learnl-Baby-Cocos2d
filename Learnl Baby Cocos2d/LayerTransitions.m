//
//  LayerTransitions.m
//  Learnl Baby Cocos2d
//
//  Created by Fred Sharples on 3/26/13.
//  Copyright 2013 Fred Sharples. All rights reserved.
//

//
//  A1_Presentation
//
//  Created by Fábio Lima on 10/11/10.
//  Copyright 2010 Label 1 / A1 Group. All rights reserved.
//


#import "LayerTransitions.h"

//#import "CCDictionary.h"

@implementation LayerTransitions

-(void)removeOldImage {
    
	[self removeChild:oldImage cleanup:NO];
    
}

-(void)setNewImage {
    
	if(currentImage){
        
		oldImage = currentImage;
		[self reorderChild:oldImage z:0];
        
	}
    
	currentImage			= [images objectAtIndex:[imageIndex intValue]];
	currentImage.opacity	= 0;
    currentImage.rotation = 90;
    
    
	[self addChild:currentImage z:1];
    
    
    
	id act1		= [CCTransitionFlipX actionWithAction:[CCFadeTo actionWithDuration:3 opacity:255]];
	//id act1		= [CCFadeTo actionWithDuration:.5f opacity:255];
	id callBack	= [CCCallFunc actionWithTarget:self selector:@selector(removeOldImage)];
    
	[currentImage runAction:[CCSequence actions:act1, callBack, nil]];
    
}

/*------------------------------------------------------------------------------------------------*\
 |* INITIALIZE THE APPLICATION --------------------------------------------------------------------*|
 \*------------------------------------------------------------------------------------------------*/
-(id) init {
    
	if( (self=[super init]) ){
        
		self.touchEnabled = YES;
        //FS need a way to populate this from a property list
       

        
        //NSString *filePath = [[NSBundle mainBundle] pathForResource:@"testdata" ofType:@"plist"];
        //NSDictionary *_gameData = [NSDictionary dictionaryWithContentsOfFile:filePath];
    
		images = [CCArray new];
		[images addObject:[CCSprite spriteWithFile:@"screen_bear_image.png"]];
		[images addObject:[CCSprite spriteWithFile:@"screen_bee_image.png"]];
		[images addObject:[CCSprite spriteWithFile:@"screen_cat_image.png"]];
		
        //FS need to make sequenctial
		imageIndex = [NSNumber numberWithInt:(arc4random() % ( [images count] - 1 ))];
        
		[self setNewImage];
        
        //Want to move this from a schedule over to a touch event
		//[self schedule:@selector(changeLayerTransitionsImage:) interval:(arc4random() % 4) + 1];
		[self schedule:@selector(changeLayerTransitionsImage:) interval:3];
        
	}
    
	return self;
    
}

-(void) changeLayerTransitionsImage:(ccTime)delta {
    
	if( [imageIndex intValue] < [images count] - 1 ){
        
		imageIndex = [NSNumber numberWithInt:[imageIndex intValue] + 1];
        
	} else {
        
		imageIndex = [NSNumber numberWithInt:0];
        
	}
    
	[self setNewImage];
    
}

/*------------------------------------------------------------------------------------------------*\
 |* DISPOSE METHODS -------------------------------------------------------------------------------*|
 \*------------------------------------------------------------------------------------------------*/


//View Did Unload Handler
- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

//Dealloc Method
// on "dealloc" you need to release all your retained objects
- (void)dealloc {
    
	[self removeAllChildrenWithCleanup:YES];
    
	//[self unloadSounds];
    
	// don't forget to call "super dealloc"
	[super dealloc];
    
}

@end