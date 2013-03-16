//
//  TouchTextField.h
//  HelioRoom
//
//  Created by LTG on 3/7/13.
//  Copyright (c) 2013 Learning Technologies Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TouchTextField;

@protocol TouchTextFieldDelegate

-(void) touchTextFieldTouchesMoved:(TouchTextField *) touchTextField;
-(void) touchTextFieldTouchesEnded:(TouchTextField *) touchTextField;

@end

@interface TouchTextField : UITextField

@property (nonatomic, assign) id delegate;

@end
