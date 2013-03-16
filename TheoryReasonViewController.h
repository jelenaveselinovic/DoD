//
//  TheoryReasonViewController.h
//  HelioRoom
//
//  Created by admin on 1/20/13.
//  Copyright (c) 2013 Learning Technologies Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TheoryReasonDelegate
-(void) cancel;
- (void)reasonSelected:(NSString *)reason:(NSString *) planetColor:(NSString *)planetName;

@end
@interface TheoryReasonViewController : UIViewController{

}
@property (weak, nonatomic) IBOutlet UITextView *reasonText;

@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;

@property (nonatomic,retain) id<TheoryReasonDelegate> delegate;

//Event Handlers
- (IBAction)cancelPressed:(id)sender;
- (IBAction)savePressed:(UIButton *)sender;


//Helper functions
-(void) setName:(NSString *)color:(NSString *)name;

@end
