import Microsoft.Quantum.Intrinsic.*;

operation Main() : Result {
    // Allocate a qubit
    use q = Qubit();
    H(q);
    let result = M(q);
    Reset(q);
    return result;
}