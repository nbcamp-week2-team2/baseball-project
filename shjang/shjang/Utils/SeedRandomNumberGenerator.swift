import Foundation
struct SeedRandomNumberGenerator: RandomNumberGenerator {
    private var state: Int
    init(seed: Int){
        //long int
        srand48(seed)
        state = seed
    }
    
    mutating func next() -> UInt64 {
        let min: UInt64 = 100
        let max: UInt64 = 999
        // drand48 returns double -> Convert it to Int64 -> then Uint64
        let randomNumber = UInt64(Int(drand48() * Double(max - min + 1))) + min
        return randomNumber
    }
}
