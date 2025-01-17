# Store environment info, e.g. gas, calldata, value, addresses etc
struct ExecutionEnvironment:
    member calldata_size : felt
    member input_len : felt
    member input : felt*  # a big-endian 128-bit packed byte array
end
