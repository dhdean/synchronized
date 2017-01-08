//
//  SynchronizedBool.swift
//
//  Created by Daniel Dean on 12/14/16.
//

import Foundation

open class SynchronizedBool {
    let lock = NSLock()
    var boolie = false
    
    init(value:Bool) {
        self.boolie = value
    }
    
    /**
     Returns the current boolean value.
     
     - returns: The current boolean value.
     */
    open func value() -> Bool {
        self.lock.lock()
        let val = self.boolie
        self.lock.unlock()
        return val
    }
    
    /**
     Attempts to set the current boolean value to true.
     
     - returns: False if the value was already true, true otherwise.
     */
    open func makeTrue () -> Bool {
        var changed = true
        self.lock.lock()
        if (self.boolie) {
            // value was already true
            changed = false
        }
        self.boolie = true
        self.lock.unlock()
        return changed
    }
    
    /**
     Attempts to set the current boolean value to false.
     
     - returns: False if the value was already false, true otherwise.
     */
    open func makeFalse () -> Bool {
        var changed = true
        self.lock.lock()
        if (!self.boolie) {
            // value was already false
            changed = false
        }
        self.boolie = false
        self.lock.unlock()
        return changed
    }
    
    
}
