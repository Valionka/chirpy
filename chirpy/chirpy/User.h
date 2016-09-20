//
//  User.h
//  chirpy
//
//  Created by Valentin Mihaylov on 9/20/16.
//  Copyright © 2016 valionka. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *screenname;
@property (nonatomic,strong) NSString *profileImageUrl;
@property (nonatomic,strong) NSString *tagline;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
