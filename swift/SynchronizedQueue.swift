//
//  SynchronizedQueue.swift
//
//  Created by Daniel Dean on 12/14/16.
//

import Foundation

class SynchronizedQueue {
    
    let queue:NSMutableArray = NSMutableArray()
    var lock:NSLock
    var maxSize:Int = 1
    
    init(maxSize:Int) {
        self.maxSize = maxSize
        self.lock = NSLock()
    }
    
    /**
     Attempts to add an object on to the queue.  Will return false if the queue
     is already at maximum capacity.
     
     - param obj: The object to be added to the queue.
     
     - returns: True if the object adds successfully, false otherwise.
     */
    func enqueue(_ obj:AnyObject) -> Bool {
        var result = true
        self.lock.lock()
        if self.queue.count >= self.maxSize {
            result = false
        }
        self.queue.insert(obj, at: 0)
        self.lock.unlock()
        return result
    }
    
    /**
     Attempts to get the object at the head of the queue.
     
     - returns: The object at the head of the queue, if any object exists.
     */
    func dequeue() -> AnyObject? {
        self.lock.lock()
        if (self.queue.count == 0) {
            self.lock.unlock()
            return nil
        }
        let result:AnyObject = self.queue.lastObject! as AnyObject
        self.queue.removeLastObject()
        self.lock.unlock()
        return result
    }
    
}
