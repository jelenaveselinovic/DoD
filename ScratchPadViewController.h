//
//  ScratchPadViewController.h
//  HelioRoom
//
//  Created by admin on 1/31/13.
//  Copyright (c) 2013 Learning Technologies Group. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TouchTextField.h"

@interface ScratchPadViewController : UIViewController

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *planetColorBtns;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *planetNameBtns;
@property (strong, nonatomic) NSMutableArray *userTextFields;
@property (weak, nonatomic) IBOutlet UIButton *createNewTextFieldBtn;
@property (weak, nonatomic) IBOutlet UIButton *resetBtn;
@property (weak, nonatomic) IBOutlet UIButton *trashBtn;

- (IBAction)buttonDragInside:(UIButton *)sender forEvent:(UIEvent *)event;
- (IBAction)newTextFieldTouchUpInside:(UIButton *)sender forEvent:(UIEvent *)event;
- (IBAction)resetTouchUpInside:(UIButton *)sender;

@end