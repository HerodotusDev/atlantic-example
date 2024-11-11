%builtins output pedersen range_check bitwise

func main(
    output_ptr: felt*, pedersen_ptr: felt*, range_check_ptr: felt*, bitwise_ptr: felt*) -> (
           output_ptr: felt*, pedersen_ptr: felt*, range_check_ptr: felt*, bitwise_ptr: felt*
        ) {
    alloc_locals;

    local fibonacci_claim_index;
    %{ ids.fibonacci_claim_index = program_input['fibonacci_claim_index'] %}

    assert output_ptr[0] = fibonacci_claim_index;
    let res = fib(1, 1, fibonacci_claim_index);
    assert output_ptr[1] = res;

    return (
        output_ptr=&output_ptr[2], pedersen_ptr=pedersen_ptr, range_check_ptr=range_check_ptr, bitwise_ptr=bitwise_ptr
    );
}

func fib(first_element: felt, second_element: felt, n: felt) -> felt {
    if (n == 0) {
        return second_element;
    }
    return fib(
        first_element=second_element, second_element=first_element + second_element, n=n-1
    );
}