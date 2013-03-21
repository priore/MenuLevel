//
//  MenuLevelLayer.h
//  MenuLevel
//
//  Created by Danilo Priore on 10/06/12.
//  Copyright Prioregroup.com 2012. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "MenuLevel.h"



// MenuLevelLayer
@interface MenuLevelLayer : CCLayer <MenuLevelDelegate>
{
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
