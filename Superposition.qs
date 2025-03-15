import Microsoft.Quantum.Diagnostics.*;
import Microsoft.Quantum.Math.*;

operation Main() : Result {
    use q = Qubit();
    Message("Initialized qubit:");
    DumpMachine(); // First dump
    Message(" ");
    H(q);
    Message("Qubit after applying H:");
    DumpMachine(); // Second dump
    Message(" ");
    let randomBit = M(q);
    Message("Qubit after the measurement:");
    DumpMachine(); // Third dump
    Message(" ");
    Reset(q);
    Message("Qubit after resetting:");
    DumpMachine(); // Fourth dump
    Message(" ");
    return randomBit;
}

operation Main2() : Result {
    use q = Qubit();
    let P = 0.333333; // P is 1/3
    Ry(2.0 * ArcCos(Sqrt(P)), q);
    Message("The qubit is in the desired state.");
    Message("");
    DumpMachine(); // Dump the state of the qubit 
    Message("");
    Message("Your skewed random bit is:");
    let skewedrandomBit = M(q);
    Reset(q);
    return skewedrandomBit;
}