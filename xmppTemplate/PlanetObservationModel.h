//
//  PlanetObservationModel.h
//  ios-xmppBase
//
//  Created by Rachel Harsley on 9/27/12.
//  Copyright (c) 2012 Learning Technologies Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

@protocol OthersOrderDelegate
- (void)addOthersOrder:(NSString *) color:(NSString *) anchor:(NSString *)reason;
@end

@protocol OthersTheoryDelegate
- (void)addOthersTheory:(NSString *) color:(NSString *) anchor:(NSString *)reason;
@end

@interface PlanetObservationModel : NSObject<XMPPBaseNewMessageDelegate>{
    
}

@property (nonatomic, strong) UIManagedDocument *reasonDatabase;  // Model is a Core Data database of reasons
@property (nonatomic, retain) id <OthersOrderDelegate> othersOrderDelegate;
@property (nonatomic, retain) id <OthersTheoryDelegate> othersTheoryDelegate;

-(int)isInFrontOf:(NSString *)planet1:(NSString *)planet2:(NSString *)reason;
-(void)identify:(NSString *)planetColor :(NSString *)planetName:(NSString *) reason;

//XMPP
-(void)sendMessage:(NSString *)msg:(NSString *)to;
-(void)sendGroupMessage:(NSString *)msg;
-(int)inFrontGroupMessage:(NSString *)planet1:(NSString *)planet2:(NSString *) reason;
-(int)orderReasonGroupMessage:(NSString *)reason;
-(int)theoryReasonGroupMessage:(NSString *)reason;

//XMPP Delegate
- (void)newMessageReceived:(NSDictionary *)messageContent;

@end
