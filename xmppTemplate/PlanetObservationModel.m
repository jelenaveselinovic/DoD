//
//  PlanetObservationModel.m
//  ios-xmppBase
//
//  Created by Rachel Harsley on 9/27/12.
//  Copyright (c) 2012 Learning Technologies Group. All rights reserved.
//

 //TODO check for conflicting results?

#import "PlanetObservationModel.h"
#import "Reason.h"
#import "SBJson.h"

@implementation PlanetObservationModel


@synthesize reasonDatabase = _reasonDatabase;
@synthesize othersOrderDelegate = _othersOrderDelegate;
@synthesize othersTheoryDelegate = _othersTheoryDelegate;

-(id)init{
    self=[super init];
    self.appDelegate.xmppBaseNewMessageDelegate=self;
    return self;
}

- (UIManagedDocument *)reasonDatabase
{
    if(!_reasonDatabase){
        NSURL *url = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
        url = [url URLByAppendingPathComponent:@"Default Reason Database"];
        // url is now "<Documents Directory>/Default Photo Database"
        _reasonDatabase = [[UIManagedDocument alloc] initWithFileURL:url]; // setter will create this for us on disk
    }
    return _reasonDatabase;
}
- (AppDelegate *)appDelegate
{
	return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark Database Functions from Stanford Course
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// 4. Stub this out (we didn't implement it at first)
// 13. Create an NSFetchRequest to get all Photographers and hook it up to our table via an NSFetchedResultsController
// (we inherited the code to integrate with NSFRC from CoreDataTableViewController)

//- (void)setupFetchedResultsController // attaches an NSFetchRequest to this UITableViewController
//{
//    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Photographer"];
//    request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)]];
//    // no predicate because we want ALL the Photographers
//    
//    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
//                                                                        managedObjectContext:self.photoDatabase.managedObjectContext
//                                                                          sectionNameKeyPath:nil
//                                                                                   cacheName:nil];
//}

// 5. Create a Q to fetch Flickr photo information to seed the database
// 6. Take a timeout from this and go create the database model (Photomania.xcdatamodeld)
// 7. Create custom subclasses for Photo and Photographer
// 8. Create a category on Photo (Photo+Flickr) to add a "factory" method to create a Photo
// (go to Photo+Flickr for next step)
// 12. Use the Photo+Flickr category method to add Photos to the database (table will auto update due to NSFRC)

- (void)fetchReasonDataIntoDocument:(UIManagedDocument *)document
{
//    dispatch_queue_t fetchQ = dispatch_queue_create("Reason fetcher", NULL);
//    dispatch_async(fetchQ, ^{
//        NSArray *reasons = [self executeReasonFetch];
//        [document.managedObjectContext performBlock:^{ // perform in the NSMOC's safe thread (main thread)
//            for (NSDictionary *reason in reasons) {
//                [Photo photoWithFlickrInfo:flickrInfo inManagedObjectContext:document.managedObjectContext];
//                // table will automatically update due to NSFetchedResultsController's observing of the NSMOC
//            }
//            // should probably saveToURL:forSaveOperation:(UIDocumentSaveForOverwriting)completionHandler: here!
//            // we could decide to rely on UIManagedDocument's autosaving, but explicit saving would be better
//            // because if we quit the app before autosave happens, then it'll come up blank next time we run
//            // this is what it would look like (ADDED AFTER LECTURE) ...
//            [document saveToURL:document.fileURL forSaveOperation:UIDocumentSaveForOverwriting completionHandler:NULL];
//            // note that we don't do anything in the completion handler this time
//        }];
//    });
//    dispatch_release(fetchQ);
}

// 3. Open or create the document here and call setupFetchedResultsController

- (void)useDocument
{
    if (![[NSFileManager defaultManager] fileExistsAtPath:[self.reasonDatabase.fileURL path]]) {
        // does not exist on disk, so create it
        [self.reasonDatabase saveToURL:self.reasonDatabase.fileURL forSaveOperation:UIDocumentSaveForCreating completionHandler:^(BOOL success) {
//            [self setupFetchedResultsController];
            //[self fetchReasonDataIntoDocument:self.reasonDatabase];
            NSLog(@"Save complete with new Document created on disk.");
            
        }];
    } else if (self.reasonDatabase.documentState == UIDocumentStateClosed) {
        // exists on disk, but we need to open it
        [self.reasonDatabase openWithCompletionHandler:^(BOOL success) {
//            [self setupFetchedResultsController];
              NSLog(@"Opened document already on disk.");
        }];
    } else if (self.reasonDatabase.documentState == UIDocumentStateNormal) {
        // already open and ready to use
//        [self setupFetchedResultsController];
         NSLog(@"Document already created, open, and ready to use.");
    }
}

// 2. Make the photoDatabase's setter start using it

- (void)setReasonDatabase:(UIManagedDocument *)reasonDatabase
{
    if (_reasonDatabase != reasonDatabase) {
        _reasonDatabase = reasonDatabase;
        [self useDocument];
    }
}

- (UIManagedDocument *)getReasonDatabase
{
    if (_reasonDatabase) {
        return _reasonDatabase;
    }
}

-(int)isInFrontOf:(NSString *)planet1:(NSString *)planet2 :(NSString *) reason{
    [self inFrontGroupMessage:planet1 :planet2 :reason];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Submit Successful"
                                                        message:@"Your observation was submitted."
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
    [alertView show];
    return 1;
    
}
- (NSDictionary *)executeReasonFetch
{
    //    query = [NSString stringWithFormat:@"%@&format=json&nojsoncallback=1&api_key=%@", query, FlickrAPIKey];
    //    query = [query stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    // NSLog(@"[%@ %@] sent %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), query);
    
    //    NSString * initData= [[self appDelegate] getReasons];
    //
    //
    //    NSData *jsonData = [initData encoding:NSUTF8StringEncoding error:nil] dataUsingEncoding:NSUTF8StringEncoding];
    //    NSError *error = nil;
    //    NSDictionary *results = jsonData ? [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers|NSJSONReadingMutableLeaves error:&error] : nil;
    //    if (error) NSLog(@"[%@ %@] JSON error: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), error.localizedDescription);
    //    // NSLog(@"[%@ %@] received %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), results);
    //    
    //    return results;
}

- (void) insertReasoninDB{
    // anchor;
    // flag;
    // isReadOnly;
    // lastTimestamp;
    // origin;
    // reasonText;
    // type;
    
    NSManagedObjectContext *context = [self.reasonDatabase managedObjectContext ];//[sef managedObjectContext];
    Reason *reason = [NSEntityDescription
                                      insertNewObjectForEntityForName:@"Reason"
                                      inManagedObjectContext:context];
    reason.anchor = @"Test Anchor";
    reason.flag = @"Testland";
    reason.isReadOnly = [NSNumber numberWithBool:NO];
    reason.lastTimestamp =[NSDate date];
    reason.origin = [[self appDelegate] getLoggedInUser];
    reason.reasonText =@"Because I";
    reason.type=@"observation or theory";
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
    
    // Test listing all FailedBankInfos from the store
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Reason"
                                              inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    for (Reason *info in fetchedObjects) {
        NSString *anchor = [NSString stringWithFormat:@"Anchor: %@", info.anchor];
        NSString *reason = [NSString stringWithFormat:@"Reason: %@", info.reasonText];
        NSLog(anchor);
        NSLog(reason);
        
//        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"DB OBJECT"
//                                                            message:[NSString stringWithFormat:@"%@ \n %@", anchor,reason]
//                                                           delegate:nil
//                                                  cancelButtonTitle:@"Ok"
//                                                  otherButtonTitles:nil];
//        [alertView show];
    }
        
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark XMPP Functions
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-(void)identify:(NSString *)planetColor :(NSString *)planetName:(NSString *) reason{
    
    [self identityGroupMessage:planetColor :planetName:reason];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Submit Successful"
                                                        message:@"Your observation was submitted."
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
    [alertView show];
    [self insertReasoninDB];
    return;

}

- (void)sendMessage:(NSString *)msg:(NSString *)to{
    [[self appDelegate] sendMessage:msg :to];
}
-(void)sendGroupMessage:(NSString *)msg{
    [[self appDelegate] sendGroupMessage:msg];
}
-(int)inFrontGroupMessage:(NSString *)planet1:(NSString *)planet2:(NSString *) reason{
    return [[self appDelegate] inFrontGroupMessage:planet1:planet2:reason];
}
-(int)identityGroupMessage:(NSString *)planetColor:(NSString *)planetName:(NSString *) reason{
    return [[self appDelegate] identifyGroupMessage:planetColor:planetName:(NSString *) reason];
}
//-(int)orderReasonGroupMessage:(NSString *)reason{
//    return [[self appDelegate] orderReasonGroupMessage:reason];
//}
-(int)theoryReasonGroupMessage:(NSString *)reason{
    return [[self appDelegate] theoryReasonGroupMessage:reason];
}


#pragma mark - XMPP delegate methods

- (void)newMessageReceived:(NSDictionary *)messageContent{
    NSLog(@"newMessageReceived");
    NSString *msg = [messageContent objectForKey:@"msg"];
    
    SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
    NSError *error = nil;
    NSDictionary *jsonObjects = [jsonParser objectWithString:msg error:&error];
    
    
    if( jsonObjects != nil){
        NSString *destination = [jsonObjects objectForKey:@"destination"];
        NSString *origin = [jsonObjects objectForKey:@"destination"];
        
        if(![origin isEqualToString:[[self appDelegate] getLoggedInUser]]){ //Don't work with self reported event
            NSString *event = [jsonObjects objectForKey:@"event"];
            NSDictionary *payload = [jsonObjects objectForKey:@"payload"];
            NSString *color= [payload objectForKey:@"color"];
            NSString *anchor= [payload objectForKey:@"anchor"];
            NSString *reason= [payload objectForKey:@"reason"];
            
            if( [event isEqualToString:@"new_observation"] ) {
                if(_othersOrderDelegate!=nil){
                    [_othersOrderDelegate addOthersOrder:color:anchor:reason];
                }

            }
            else if( [event isEqualToString:@"remove_theory"] ) {
           
            }
            else if( [event isEqualToString:@"new_theory"] ) {
                if(_othersTheoryDelegate!=nil){
                    [_othersTheoryDelegate addOthersTheory:color:anchor:reason];
                }

            }
            else if( [event isEqualToString:@"delete_theory"] ) {
                
            }
            else if( [event isEqualToString:@"init_helio_diff "] &&
                    [destination isEqualToString:[[self appDelegate] getLoggedInUser]]) {
                
            }
            else if( [event isEqualToString:@"init_helio_all"] ) {
                
            }
            
            
            //            [self resetGame];
            //        } else if( [event isEqualToString:@"game_stop"] ) {
            //            isRUNNING = NO;
            //            isGAME_STOPPED = YES;
            //        }
            //
            //        if( ! [destination isEqualToString:[self origin]] )
            //            return;
            //
            //        if( event != nil) {
            //            if( [event isEqualToString:@"patch_init_data"]){
            //
            //                [[DataStore sharedInstance] resetPlayerCount];
            //
            //                NSDictionary *payload = [jsonObjects objectForKey:@"payload"];
            //
            //                feedRatio = @([[payload objectForKey:@"feed-ratio"] integerValue]);
            //
            //                NSArray *tags = [payload objectForKey:@"tags"];
            //
            //                for (NSDictionary *tag in tags) {
            //
            //                    NSString *tagId = [tag objectForKey:@"tag"];
            //                    NSString *cluster = [tag objectForKey:@"cluster"];
            //                    NSString *color = [tag objectForKey:@"color"];
            //
            //                    [[DataStore sharedInstance] addPlayerWithRFID:tagId withCluster:cluster withColor:color];
            //                }
            //
            //                [[DataStore sharedInstance] printPlayers];
            //
            //                [[DataStore sharedInstance] addPlayerSpacing];
            //
            //
            //
            //                //init the graph
            //                if( hasGraph) {
            //                    [graph reloadData];
            //                } else {
            //                    hasGraph = YES;
            //
            //                    [self initPlot];
            //                }
            //
            //
            //            } else if( [event isEqualToString:@"rfid_update"] ){
            //                NSDictionary *payload = [jsonObjects objectForKey:@"payload"];
            //
            //
            //                NSArray *arrivals = [payload objectForKey:@"arrivals"];
            //                NSArray *departures = [payload objectForKey:@"departures"];
            //
            //                if( arrivals != nil && arrivals.count > 0 ) {
            //                    for (NSString *rfid in arrivals) {
            //                        [self addRFID:rfid];
            //                    }
            //
            //                    if( (isRUNNING == NO && isGAME_STOPPED == NO)) {
            //                        isRUNNING = YES;
            //                        [self startTimer];
            //
            //                    }
            //                }
            //
            //                if( departures != nil && departures.count > 0 ) {
            //                    for (NSString *rfid in departures) {
            //                        [self sendOutScoreUpdateWith:rfid];
            //                        [self resetScoreByRFID: rfid];
            //                        [self removeRFID:rfid];
            //                        
            //                    }
            //                }
            //            }
            //            
            //            
            //        }
        }
    }
    
    NSLog(@"newMessageRecieved method. The following: %@", msg);
}



@end
