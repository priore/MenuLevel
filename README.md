**MENULEVEL**

A fine Cocos2d example to create a level in Angry Birds style.
Requires only the inclusion of two files class and the images that you
choose for your layers (already included in the example).

example:

    #import "MenuLevel.h"
    
    @interface YourLayer : CCLayer <MenuLevelDelegate>
	{
	}

	// on init
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

![Screenshot](http://www.prioregroup.com/images/github/menulevel/menulevel.png)

[Prioregroup.com Home Page](http://www.prioregroup.com)