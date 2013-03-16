//
//  TouchTextField.m
//  HelioRoom
//
//  Created by LTG on 3/7/13.
//  Copyright (c) 2013 Learning Technologies Group. All rights reserved.
//

#import "TouchTextField.h"

@implementation TouchTextField

@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
    }
    return self;
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // change textfield image when touched down
    [self setBackground:[UIImage imageNamed:@"tag_gray1.png"]];
 }

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    //NSLog(@"TouchTextField touchesMoved");
    
    // Allows dragging the textfield around the screen
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:[self superview]];
    self.center = location;
    
    [delegate touchTextFieldTouchesMoved:self];
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    //NSLog(@"TouchTextField touchesEnded");
    
    // change textfield image when touched is released
    [self setBackground:[UIImage imageNamed:@"tag_gray.png"]];
    
    [delegate touchTextFieldTouchesEnded:self];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
