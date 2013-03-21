//
//  MenuLevelLayer.m
//  MenuLevel
//
//  Created by Danilo Priore on 10/06/12.
//  Copyright Prioregroup.com 2012. All rights reserved.
//

#import "MenuLevelLayer.h"

@implementation MenuLevelLayer

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	MenuLevelLayer *layer = [MenuLevelLayer node];
	[scene addChild: layer];
	return scene;
}

-(id) init
{
	if( (self=[super init])) {
        
		CGSize size = [[CCDirector sharedDirector] winSize];

        // background
        CCSprite *bg = [CCSprite spriteWithFile:@"bg.png"];
        bg.position = ccp(size.width / 2, size.height / 2);
        [self addChild:bg];

		// title
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Menu Level Sample" fontName:@"Marker Felt" fontSize:40];
		label.position = ccp(size.width / 2, size.height / 2 + 120 );
		[self addChild: label];
        
        // MenuLevel
        MenuLevel *menu = [[MenuLevel alloc] init];
        menu.delegate = self;
        [self addChild:menu];

        CGFloat x = 100; // position start

        // level buttons with delegate
        [menu createMenuItemLevel:1 position:ccp(x, size.height / 2) life:5 locked:NO];
        [menu createMenuItemLevel:2 position:ccp(x + 70, size.height / 2) life:2 locked:NO];
        [menu createMenuItemLevel:3 position:ccp(x + 140, size.height / 2) life:0 locked:YES];
        
        // level button with block programming
        [menu createMenuItemLevel:4 position:ccp(x + 210, size.height / 2) life:0 locked:YES didSelected:^(MenuLevelItem *menuItem) {

            NSString *msg = [NSString stringWithFormat:@"You have pressed the button # %d", menuItem.tag];
            ALERT(@"MenuLevel Sample", msg);
        
        }];
	}
	return self;
}

#pragma mark - MenuLevel Delegate

// MenuLevel Delegate
- (void)menuLevel:(MenuLevel *)menuLevel buttonSelected:(MenuLevelItem *)menuItem
{
    NSString *msg = [NSString stringWithFormat:@"You have pressed the button # %d", menuItem.tag];
    ALERT(@"MenuLevel Sample", msg);
}

@end
