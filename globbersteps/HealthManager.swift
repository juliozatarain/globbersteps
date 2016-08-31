import HealthKit

class HealthManager {
    
    let healthKitStore:HKHealthStore = HKHealthStore()
    
    
    func authorizeHealthKit(completion: ((success:Bool, error:NSError!) -> Void)!)
    {
        if !HKHealthStore.isHealthDataAvailable()
        {
            let error = NSError(domain: "com.jz.healthkit", code: 2, userInfo: [NSLocalizedDescriptionKey:"HealthKit is not available in this Device"])
            if( completion != nil )
            {
                completion(success:false, error:error)
            }
            return;
        }
        
        let healthKitTypesToRead : Set<HKObjectType> = [HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierStepCount)!]
        
        healthKitStore.requestAuthorizationToShareTypes(nil, readTypes: healthKitTypesToRead) { (success, error) -> Void in
            
            if( completion != nil )
            {
                completion(success:success,error:error)
            }
        }
    }
}
