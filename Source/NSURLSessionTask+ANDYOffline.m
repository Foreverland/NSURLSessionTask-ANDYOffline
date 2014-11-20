#import "NSURLSessionTask+ANDYOffline.h"

#import <objc/runtime.h>

@implementation NSURLSessionTask (ANDYOffline)

@dynamic andy_originalRequest;
@dynamic andy_currentRequest;
@dynamic andy_response;
@dynamic andy_params;

#pragma mark - Getters

- (NSURLRequest *)andy_originalRequest
{
    return objc_getAssociatedObject(self, @selector(andy_originalRequest));
}

- (NSURLRequest *)andy_currentRequest
{
    return objc_getAssociatedObject(self, @selector(andy_currentRequest));
}

- (NSURLRequest *)andy_response
{
    return objc_getAssociatedObject(self, @selector(andy_response));
}

- (NSURLRequest *)andy_params
{
    return objc_getAssociatedObject(self, @selector(andy_params));
}

#pragma mark - Setters

- (void)setAndy_originalRequest:(NSURLRequest *)object
{
    objc_setAssociatedObject(self, @selector(andy_originalRequest), object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setAndy_currentRequest:(NSURLRequest *)object
{
    objc_setAssociatedObject(self, @selector(andy_currentRequest), object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setAndy_response:(NSURLResponse *)object
{
    objc_setAssociatedObject(self, @selector(andy_response), object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setAndy_params:(NSDictionary *)object
{
    objc_setAssociatedObject(self, @selector(andy_params), object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - NSCoding

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (!self) return nil;

    self.andy_originalRequest = [aDecoder decodeObjectForKey:@"andy_originalRequest"];
    self.andy_currentRequest = [aDecoder decodeObjectForKey:@"andy_currentRequest"];
    self.andy_response = [aDecoder decodeObjectForKey:@"andy_response"];
    self.andy_params = [aDecoder decodeObjectForKey:@"andy_params"];

    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.originalRequest forKey:@"andy_originalRequest"];
    [aCoder encodeObject:self.currentRequest forKey:@"andy_currentRequest"];
    [aCoder encodeObject:self.response forKey:@"andy_response"];
    [aCoder encodeObject:self.andy_params forKey:@"andy_params"];
}

- (void)saveWithParams:(NSDictionary *)params
{
    self.andy_params = params;

    NSData *requestsData = [[NSUserDefaults standardUserDefaults] objectForKey:@"offlineRequests"];
    NSMutableArray *requests = [[NSKeyedUnarchiver unarchiveObjectWithData:requestsData] mutableCopy];

    if (!requests) requests = [NSMutableArray array];

    [requests addObject:self];

    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:requests];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"offlineRequests"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSArray *)offlineTasks
{
    NSData *requestsData = [[NSUserDefaults standardUserDefaults] objectForKey:@"offlineRequests"];
    NSArray *requests = [NSKeyedUnarchiver unarchiveObjectWithData:requestsData];

    return requests;
}

@end
