//
//  MenuLevel.h
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

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@protocol MenuLevelDelegate;

@interface MenuLevel : CCMenu {
    
}

@property (nonatomic, retain) NSString *lockFileName;
@property (nonatomic, retain) NSString *backgroundFileName;
@property (nonatomic, retain) NSString *starFileName;
@property (nonatomic, retain) NSString *starLowFileName;
@property (nonatomic, retain) NSString *fontName;
@property (nonatomic, assign) CGFloat fontSize;
@property (nonatomic, assign) ccColor3B fontColor;
@property (nonatomic, assign) NSInteger maxLifes;
@property (nonatomic, assign) id<MenuLevelDelegate>delegate;

- (CCMenuItem*)createMenuItemLevel:(NSInteger)level 
                          position:(CGPoint)position 
                              life:(NSInteger)life 
                            locked:(BOOL)locked;

- (CCMenuItem*)createMenuItemLevel:(NSInteger)level 
                          position:(CGPoint)position 
                              life:(NSInteger)life 
                            locked:(BOOL)locked
                            target:(id)target
                          selector:(SEL)selector;

@end

@protocol MenuLevelDelegate <NSObject>

@optional

- (void)menuLevel:(MenuLevel*)menuLevel buttonSelected:(id)source;

@end