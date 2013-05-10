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

-(void) loadGameData {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Data" ofType:@"plist"];
    NSDictionary *_gameData = [NSDictionary dictionaryWithContentsOfFile:filePath];
    
}
- (void) createSaveData {

    // Read saved data
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Data" ofType:@"plist"];
    NSDictionary *_gameData = [NSDictionary dictionaryWithContentsOfFile:filePath];

        // load the stored preference of the user's last location from a previous launch
        _saveData = [[[NSUserDefaults standardUserDefaults] objectForKey:kGameDataKey] mutableCopy];
        if (_saveData == nil) {
            _saveData = [NSMutableDictionary dictionaryWithCapacity:[_gameData count]];
            [_saveData setDictionary:[_gameData valueForKey:@"GameData"]];
        }
        
        [[NSUserDefaults standardUserDefaults] setObject:_saveData forKey:kGameDataKey];
        _saveData = [[[NSUserDefaults standardUserDefaults] objectForKey:kGameDataKey] mutableCopy];
        
        NSDictionary *savedLocationDict = [NSDictionary dictionaryWithObject:_saveData forKey:kGameDataKey];
        [[NSUserDefaults standardUserDefaults] registerDefaults:savedLocationDict];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        //[_gameViewController setLevelData:[NSArray arrayWithArray:[_gameData valueForKey:@"Levels"]]];
        //[_gameViewController setLevelNum:[[_saveData valueForKey:@"LevelNum"] integerValue]];
        _levels = [[NSArray alloc] initWithArray:[_gameData valueForKey:@"Levels"]];
        _levelNum = [[_saveData valueForKey:@"LevelNum"] unsignedIntValue];
        _titleData = [[NSArray alloc] initWithArray:[_gameData valueForKey:@"Title"]];
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
