//
//  Tweet.h
//  chirpy
//
//  Created by Valentin Mihaylov on 9/20/16.
//  Copyright © 2016 valionka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Tweet : NSObject

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, strong) User *user;


- (id)initWithDictionary:(NSDictionary *)dictionary;
- (id) initWithText:(NSString *)text;

+ (NSArray *)tweetsWithArray:(NSArray *)array;

@end
