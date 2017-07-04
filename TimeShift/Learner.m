//
//  Learners.m
//
//  Created by Vision Mkhabela on 6/10/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "Learner.h"


NSString *const kLearnersDisplayname = @"displayname";
NSString *const kLearnersMail = @"mail";
NSString *const kLearnersCommonname = @"commonname";
NSString *const kLearnersPhotoOfficial = @"photoOfficial";
NSString *const kLearnersSurname = @"surname";
NSString *const kLearnersPhotoSocial = @"photoSocial";
NSString *const kLearnersTitle = @"title";
NSString *const kLearnersUserId = @"userId";
NSString *const kLearnersLastModified = @"lastModified";
NSString *const kLearnersAffiliations = @"affiliations";
NSString *const kLearnersGivenname = @"givenname";
NSString *const kLearnersTelephonenumber = @"telephonenumber";
NSString *const kLearnersNickname = @"nickname";
NSString *const kLearnersClass = @"class";
NSString *const kLearnersGender = @"gender";
NSString *const kLearnersMobilenumber = @"mobilenumber";


@interface Learner ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Learner

@synthesize displayname = _displayname;
@synthesize mail = _mail;
@synthesize commonname = _commonname;
@synthesize photoOfficial = _photoOfficial;
@synthesize surname = _surname;
@synthesize photoSocial = _photoSocial;
@synthesize title = _title;
@synthesize userId = _userId;
@synthesize lastModified = _lastModified;
@synthesize affiliations = _affiliations;
@synthesize givenname = _givenname;
@synthesize telephonenumber = _telephonenumber;
@synthesize nickname = _nickname;
@synthesize classProperty = _classProperty;
@synthesize gender = _gender;
@synthesize mobilenumber = _mobilenumber;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.displayname = [self objectOrNilForKey:kLearnersDisplayname fromDictionary:dict];
            self.mail = [self objectOrNilForKey:kLearnersMail fromDictionary:dict];
            self.commonname = [self objectOrNilForKey:kLearnersCommonname fromDictionary:dict];
            self.photoOfficial = [self objectOrNilForKey:kLearnersPhotoOfficial fromDictionary:dict];
            self.surname = [self objectOrNilForKey:kLearnersSurname fromDictionary:dict];
            self.photoSocial = [self objectOrNilForKey:kLearnersPhotoSocial fromDictionary:dict];
            self.title = [self objectOrNilForKey:kLearnersTitle fromDictionary:dict];
            self.userId = [self objectOrNilForKey:kLearnersUserId fromDictionary:dict];
            self.lastModified = [self objectOrNilForKey:kLearnersLastModified fromDictionary:dict];
            self.affiliations = [self objectOrNilForKey:kLearnersAffiliations fromDictionary:dict];
            self.givenname = [self objectOrNilForKey:kLearnersGivenname fromDictionary:dict];
            self.telephonenumber = [self objectOrNilForKey:kLearnersTelephonenumber fromDictionary:dict];
            self.nickname = [self objectOrNilForKey:kLearnersNickname fromDictionary:dict];
            self.classProperty = [self objectOrNilForKey:kLearnersClass fromDictionary:dict];
            self.gender = [self objectOrNilForKey:kLearnersGender fromDictionary:dict];
            self.mobilenumber = [self objectOrNilForKey:kLearnersMobilenumber fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.displayname forKey:kLearnersDisplayname];
    [mutableDict setValue:self.mail forKey:kLearnersMail];
    [mutableDict setValue:self.commonname forKey:kLearnersCommonname];
    [mutableDict setValue:self.photoOfficial forKey:kLearnersPhotoOfficial];
    [mutableDict setValue:self.surname forKey:kLearnersSurname];
    [mutableDict setValue:self.photoSocial forKey:kLearnersPhotoSocial];
    [mutableDict setValue:self.title forKey:kLearnersTitle];
    [mutableDict setValue:self.userId forKey:kLearnersUserId];
    [mutableDict setValue:self.lastModified forKey:kLearnersLastModified];
    NSMutableArray *tempArrayForAffiliations = [NSMutableArray array];
    for (NSObject *subArrayObject in self.affiliations) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForAffiliations addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForAffiliations addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForAffiliations] forKey:kLearnersAffiliations];
    [mutableDict setValue:self.givenname forKey:kLearnersGivenname];
    [mutableDict setValue:self.telephonenumber forKey:kLearnersTelephonenumber];
    [mutableDict setValue:self.nickname forKey:kLearnersNickname];
    [mutableDict setValue:self.classProperty forKey:kLearnersClass];
    [mutableDict setValue:self.gender forKey:kLearnersGender];
    [mutableDict setValue:self.mobilenumber forKey:kLearnersMobilenumber];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.displayname = [aDecoder decodeObjectForKey:kLearnersDisplayname];
    self.mail = [aDecoder decodeObjectForKey:kLearnersMail];
    self.commonname = [aDecoder decodeObjectForKey:kLearnersCommonname];
    self.photoOfficial = [aDecoder decodeObjectForKey:kLearnersPhotoOfficial];
    self.surname = [aDecoder decodeObjectForKey:kLearnersSurname];
    self.photoSocial = [aDecoder decodeObjectForKey:kLearnersPhotoSocial];
    self.title = [aDecoder decodeObjectForKey:kLearnersTitle];
    self.userId = [aDecoder decodeObjectForKey:kLearnersUserId];
    self.lastModified = [aDecoder decodeObjectForKey:kLearnersLastModified];
    self.affiliations = [aDecoder decodeObjectForKey:kLearnersAffiliations];
    self.givenname = [aDecoder decodeObjectForKey:kLearnersGivenname];
    self.telephonenumber = [aDecoder decodeObjectForKey:kLearnersTelephonenumber];
    self.nickname = [aDecoder decodeObjectForKey:kLearnersNickname];
    self.classProperty = [aDecoder decodeObjectForKey:kLearnersClass];
    self.gender = [aDecoder decodeObjectForKey:kLearnersGender];
    self.mobilenumber = [aDecoder decodeObjectForKey:kLearnersMobilenumber];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_displayname forKey:kLearnersDisplayname];
    [aCoder encodeObject:_mail forKey:kLearnersMail];
    [aCoder encodeObject:_commonname forKey:kLearnersCommonname];
    [aCoder encodeObject:_photoOfficial forKey:kLearnersPhotoOfficial];
    [aCoder encodeObject:_surname forKey:kLearnersSurname];
    [aCoder encodeObject:_photoSocial forKey:kLearnersPhotoSocial];
    [aCoder encodeObject:_title forKey:kLearnersTitle];
    [aCoder encodeObject:_userId forKey:kLearnersUserId];
    [aCoder encodeObject:_lastModified forKey:kLearnersLastModified];
    [aCoder encodeObject:_affiliations forKey:kLearnersAffiliations];
    [aCoder encodeObject:_givenname forKey:kLearnersGivenname];
    [aCoder encodeObject:_telephonenumber forKey:kLearnersTelephonenumber];
    [aCoder encodeObject:_nickname forKey:kLearnersNickname];
    [aCoder encodeObject:_classProperty forKey:kLearnersClass];
    [aCoder encodeObject:_gender forKey:kLearnersGender];
    [aCoder encodeObject:_mobilenumber forKey:kLearnersMobilenumber];
}

- (id)copyWithZone:(NSZone *)zone
{
    Learner *copy = [[Learner alloc] init];
    
    if (copy) {

        copy.displayname = [self.displayname copyWithZone:zone];
        copy.mail = [self.mail copyWithZone:zone];
        copy.commonname = [self.commonname copyWithZone:zone];
        copy.photoOfficial = [self.photoOfficial copyWithZone:zone];
        copy.surname = [self.surname copyWithZone:zone];
        copy.photoSocial = [self.photoSocial copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.userId = [self.userId copyWithZone:zone];
        copy.lastModified = [self.lastModified copyWithZone:zone];
        copy.affiliations = [self.affiliations copyWithZone:zone];
        copy.givenname = [self.givenname copyWithZone:zone];
        copy.telephonenumber = [self.telephonenumber copyWithZone:zone];
        copy.nickname = [self.nickname copyWithZone:zone];
        copy.classProperty = [self.classProperty copyWithZone:zone];
        copy.gender = [self.gender copyWithZone:zone];
        copy.mobilenumber = [self.mobilenumber copyWithZone:zone];
    }
    
    return copy;
}


@end
