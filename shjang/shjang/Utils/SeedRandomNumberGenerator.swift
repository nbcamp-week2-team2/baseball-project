import Foundation
struct SeedRandomNumberGenerator: RandomNumberGenerator {
    init(seed: Int){
        //long int
        srand48(seed)
    }
    
    mutating func next() -> UInt64 {
        let min: UInt64 = 100
        let max: UInt64 = 999
        // drand48 returns double -> Convert it to Int64 -> then Uint64
        let randomNumber = UInt64(Int(drand48() * Double(max - min + 1))) + min
        return randomNumber
    }
}
