//
//  MenuBaseLayer.m
//  plop
//
//  Created by Alain Vagner on 22/01/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "JNPMenuBaseLayer.h"

JNPAudioManager * audioManager;

@implementation JNPMenuBaseLayer

- (id)init {
    self = [super init];
    if (self) {
		[[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"musique/Intro.aifc" loop:YES];
        
		// logo qui va s'animer
        CCSprite * logo = [CCSprite spriteWithFile: @"fond-menu.png"];
		CGSize winsize = [[CCDirector sharedDirector] winSize];
        logo.position = ccp(winsize.width/2 , winsize.height/2 );
		[self addChild:logo z:0];	
		
		
		
		// http://www.cocos2d-iphone.org/wiki/doku.php/prog_guide:lesson_3._menus_and_scenes
        // [self setUpMenus];
        
		CCMenuItemImage *menuItem1 = [CCMenuItemImage itemWithNormalImage:@"start-over.png"
            selectedImage: @"start.png"
            target:self
            selector:@selector(menu1)];
        CCMenuItemImage *menuItem2 = [CCMenuItemImage itemWithNormalImage:@"credits-over.png"
        selectedImage: @"credits.png"
        target:self
        selector:@selector(menu2)];
        
        CCMenuItemImage *menuItem3 = [CCMenuItemImage itemWithNormalImage:@"help.png"
            selectedImage: @"help-on.png"
            target:self
            selector:@selector(menu3)];
        
        
		CCMenu * myMenu = [CCMenu menuWithItems:menuItem1, menuItem2, nil];
        
        // Arrange the menu items vertically
        [myMenu alignItemsVertically];
		myMenu.position = ccp(winsize.width/2, 280);
        
        // add the menu to your scene
        [self addChild:myMenu];
        
        
        
		CCMenu * myMenu2 = [CCMenu menuWithItems:menuItem3, nil];
        myMenu2.position = ccp(70, 113);
        [self addChild:myMenu2];
        
        
		// increment level
		JNPScore * sc = [JNPScore jnpscore];
		[sc setLevel:1];
		[sc setScore:0];
		
        // Il ne sert à rien d'activer le "Touch" sur ce Layer car le menu, lui, est TouchEnabled.
        // self.isTouchEnabled = YES;		
    }
    return self;
}



-(void)menu1 {
	[self unscheduleAllSelectors];
	[self unscheduleUpdate];
	JNPAudioManager *audioManager = [JNPAudioManager sharedAM];
	[audioManager play:jnpSndMenu];	
	[[CCDirector sharedDirector] replaceScene: [CCTransitionFade transitionWithDuration:0.5f scene:[JNPGameLayer scene]]];
    
}

-(void)menu2 {
	[self unscheduleAllSelectors];
	[self unscheduleUpdate];
	JNPAudioManager *audioManager = [JNPAudioManager sharedAM];
	[audioManager play:jnpSndMenu];	
	[[CCDirector sharedDirector] replaceScene: [CCTransitionFade transitionWithDuration:0.5f scene: [JNPBasicLayer scene:jnpCredits]]];    
}

-(void)menu3 {
	[self unscheduleAllSelectors];
	[self unscheduleUpdate];
	JNPAudioManager *audioManager = [JNPAudioManager sharedAM];
	[audioManager play:jnpSndMenu];	
	[[CCDirector sharedDirector] replaceScene: [CCTransitionFade transitionWithDuration:0.5f scene: [JNPBasicLayer scene:jnpHelp]]];    
}

@end
