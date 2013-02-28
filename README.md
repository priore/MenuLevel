**MENULEVEL**

A fine Cocos2d example to create a menu level in Angry Birds style.
Requires only the inclusion of two files class and the images that you
choose for your layers (already included in the example).

Is really very simple to add to your game, with few lines of code, and one 
objective-c class, you create a wonderful menu to choose the level of play.
In this version there is a detailed example of how to use, but just use these 
simple commands, listed below, to get full functionality :

example:

    #import "MenuLevel.h"
    
    @interface YourLayer : CCLayer <MenuLevelDelegate>
	{
	}

	// on init
	CGSize size = [[CCDirector sharedDirector] winSize];	
	
	MenuLevel *menu = [[MenuLevel alloc] init];
    menu.delegate = self;
    [self addChild:menu];

    // 4 level buttons
    CGFloat x = 100;
    [menu createMenuItemLevel:1 position:ccp(x, size.height / 2) life:5 locked:NO];
    [menu createMenuItemLevel:2 position:ccp(x + 70, size.height / 2) life:2 locked:NO];
    [menu createMenuItemLevel:3 position:ccp(x + 140, size.height / 2) life:0 locked:YES];
    [menu createMenuItemLevel:4 position:ccp(x + 210, size.height / 2) life:0 locked:YES];

	// MenuLevel Delegate
	- (void)menuLevel:(MenuLevel *)menuLevel buttonSelected:(id)source
	{
    	CCMenuItem *item = (CCMenuItem*)source;
    	NSInteger buttonLevel = item.tag;
    	...
    	...
	}	


sample screen-shot :

![Screenshot](https://github.com/priore/MenuLevel/raw/master/menulevel2.jpg)

[Prioregroup.com Home Page](http://www.prioregroup.com)