//
//  MenuLevel.m
//  MenuLevel
//
//  Created by Danilo Priore on 10/06/12.
//  Copyright 2012 Prioregroup.com. All rights reserved.
//

//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//
//

#import "MenuLevel.h"

@implementation MenuLevel

@synthesize lockFileName, backgroundFileName;
@synthesize starFileName, starLowFileName;
@synthesize fontName, fontSize, fontColor;
@synthesize maxLifes, delegate;

- (id)init
{
    if (self = [super initWithItems:nil vaList:nil])
    {
        // default values
        maxLifes = 5;                       // number of lifes (showed in stars)
        lockFileName = @"lock.png";         // image for level locked
        backgroundFileName = @"button.png"; // image for button level
        starFileName = @"star.png";         // image for lifes
        starLowFileName = @"star_low.png";  // image for lose lifes
        fontName = @"Marker Felt";          // font for level number
        fontSize = 40.0f;                   // font size for level number
        fontColor = ccWHITE;                // font color for level number
        self.position = CGPointZero;
    }
    
    return self;
}

- (CCMenuItem*)createMenuItemLevel:(NSInteger)level 
                          position:(CGPoint)position 
                              life:(NSInteger)life 
                            locked:(BOOL)locked
{
    return [self createMenuItemLevel:level 
                            position:position 
                                life:life 
                              locked:locked 
                              target:self 
                            selector:@selector(buttonSelected:)];
}
    
- (CCMenuItem*)createMenuItemLevel:(NSInteger)level 
                          position:(CGPoint)position 
                              life:(NSInteger)life 
                            locked:(BOOL)locked
                            target:(id)target
                          selector:(SEL)selector
{
    // retrieve menu level scene
    CCScene *scene = (CCScene*)delegate;
    if (scene == nil)
        NSAssert(YES, @"Invalid delegate for MenuLevel!");
    
    // create button with background
    CCMenuItemSprite *item = [CCMenuItemSprite itemFromNormalSprite:[CCSprite spriteWithFile:backgroundFileName] 
                                                      selectedSprite:nil target:target selector:selector];
    item.anchorPoint = ccp(0, 1);
    item.position = position;
    [self addChild:item];
    
    // set button tag same level
    item.tag = level;
    
    // level text
    CGPoint pos = ccp(item.position.x + item.boundingBox.size.width / 2 , 
                      item.position.y - item.boundingBox.size.height / 2);
    CCLabelTTF *levelText = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d", level]
                                           fontName:fontName fontSize:fontSize];
    levelText.position = pos;
    levelText.color = fontColor;
    levelText.visible = !locked;
    [scene addChild:levelText];  
    
    // lock image
    CCSprite *lock = [CCSprite spriteWithFile:lockFileName];
    lock.position = pos;
    lock.visible = locked;
    [scene addChild:lock];
    
    // life's
    for (int c = 0; c < maxLifes; c++) {
        
        // star
        CCSprite *star = [CCSprite spriteWithFile:c < life ? starFileName : starLowFileName];
        star.anchorPoint = ccp(0, 1);
        star.position = ccp(item.position.x - 10 + (star.boundingBox.size.width * c) + (1 * c), 
                            item.position.y - item.boundingBox.size.height - 2);
        [scene addChild:star];
    }
    
    return item;    
}

- (void)buttonSelected:(id)sender
{
    // call delegate when button is selected
    if (delegate != nil && [delegate respondsToSelector:@selector(menuLevel:buttonSelected:)])
        [delegate menuLevel:self buttonSelected:sender];
}

@end
