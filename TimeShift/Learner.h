//
//  Learners.h
//
//  Created by Vision Mkhabela on 6/10/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Learner : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *displayname;
@property (nonatomic, strong) NSString *mail;
@property (nonatomic, strong) NSString *commonname;
@property (nonatomic, strong) NSString *photoOfficial;
@property (nonatomic, strong) NSString *surname;
@property (nonatomic, strong) NSString *photoSocial;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSString *lastModified;
@property (nonatomic, strong) NSArray *affiliations;
@property (nonatomic, strong) NSString *givenname;
@property (nonatomic, strong) NSString *telephonenumber;
@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, strong) NSString *classProperty;
@property (nonatomic, strong) NSString *gender;
@property (nonatomic, strong) NSString *mobilenumber;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
