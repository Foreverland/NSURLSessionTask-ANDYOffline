@import Foundation;

@interface NSURLSessionTask (ANDYOffline) <NSCoding>

@property (nonatomic, strong) NSURLRequest *andy_originalRequest;
@property (nonatomic, strong) NSURLRequest *andy_currentRequest;
@property (nonatomic, strong) NSURLResponse *andy_response;
@property (nonatomic, strong) NSDictionary *andy_params;

- (void)saveWithParams:(NSDictionary *)params;

+ (NSArray *)offlineTasks;

@end
