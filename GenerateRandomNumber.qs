import Std.Math.BitSizeI;
import Microsoft.Quantum.Convert.*;
import Microsoft.Quantum.Math.*;

operation GenerateRandomBit() : Result {
        // Allocate a qubit.
        use q = Qubit();
    
        // Set the qubit into superposition of 0 and 1 using the Hadamard 
        H(q);
    
        // Measure the qubit and store the result.
        let result = M(q);
    
        // Reset qubit to the |0〉 state.
        Reset(q);
    
        // Return the result of the measurement.
        return result;
    }

/// Generates a random number between 0 and `max`.
    operation GenerateRandomNumberInRange(min : Int, max : Int) : Int {
        // Determine the number of bits needed to represent `max` and store it
        // in the `nBits` variable. Then generate `nBits` random bits which will
        // represent the generated random number.
        mutable bits = [];
        let minBits = BitSizeI(min);
        let maxBits = BitSizeI(max);
        for idxBit in 1..minBits {
            set bits += [GenerateRandomBit()];
        }
        for idxBit in 1..(maxBits-minBits) {
            set bits += [GenerateRandomBit()];
        }
        let sample = ResultArrayAsInt(bits);
    
        // Return random number if it is within the requested range.
        // Generate it again if it is outside the range.
        return (sample > max or sample < min) ? GenerateRandomNumberInRange(min, max) | sample;
    }

operation Main() : Int {
    let max = 140;
    let min = 100;
    Message($"Sampling a random number between 0 and {max}: ");
    // Generate random number in the 0..max range.
    return GenerateRandomNumberInRange(min, max);
}