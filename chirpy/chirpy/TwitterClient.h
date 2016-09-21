//
//  TwitterClient.h
//  chirpy
//
//  Created by Valentin Mihaylov on 9/20/16.
//  Copyright © 2016 valionka. All rights reserved.
//

#import "BDBOAuth1SessionManager.h"
#import "User.h"

@interface TwitterClient : BDBOAuth1SessionManager

- (void)loginWithCompletion:(void (^)(User *user, NSError *error))completion;
- (void)openURL:(NSURL *)url;
- (NSArray *) getTweetsForUser: (User *)user;

+ (TwitterClient *)sharedInstance;

@end
