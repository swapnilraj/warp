%lang starknet

%builtins pedersen range_check

from evm.exec_env import ExecutionEnvironment
from evm.output import Output
from evm.stack import StackItem
from evm.uint256 import is_lt, is_zero
from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.default_dict import default_dict_new
from starkware.cairo.common.dict_access import DictAccess
from starkware.cairo.common.math_cmp import is_le
from starkware.cairo.common.registers import get_fp_and_pc
from starkware.cairo.common.uint256 import Uint256, uint256_add, uint256_eq
from starkware.starknet.common.storage import Storage

func segment0{
        storage_ptr : Storage*, pedersen_ptr : HashBuiltin*, range_check_ptr, msize,
        memory_dict : DictAccess*}(exec_env : ExecutionEnvironment*, stack : StackItem*) -> (
        stack : StackItem*, output : Output):
    alloc_locals
    let stack0 = stack
    let (local __fp__, _) = get_fp_and_pc()
    local newitem0 : StackItem = StackItem(value=Uint256(0, 0), next=stack0)
    local newitem1 : StackItem = StackItem(value=Uint256(1, 0), next=&newitem0)
    local newitem2 : StackItem = StackItem(value=Uint256(1, 0), next=&newitem1)
    local newitem3 : StackItem = StackItem(value=Uint256(0, 0), next=&newitem2)
    return segment18(exec_env, &newitem3)
end

func segment18{
        storage_ptr : Storage*, pedersen_ptr : HashBuiltin*, range_check_ptr, msize,
        memory_dict : DictAccess*}(exec_env : ExecutionEnvironment*, stack : StackItem*) -> (
        stack : StackItem*, output : Output):
    alloc_locals
    let stack0 = stack
    let (local __fp__, _) = get_fp_and_pc()
    local stack1 : StackItem* = stack0.next
    local stack2 : StackItem* = stack1.next
    local stack3 : StackItem* = stack2.next
    local stack4 : StackItem* = stack3.next
    local stack5 : StackItem* = stack4.next
    local memory_dict : DictAccess* = memory_dict
    let (local tmp0 : Uint256) = is_lt{range_check_ptr=range_check_ptr}(stack0.value, stack4.value)
    let (local tmp1 : Uint256) = is_zero{range_check_ptr=range_check_ptr}(tmp0)
    let (immediate) = uint256_eq(tmp1, Uint256(0, 0))
    if immediate == 0:
        return segment51(exec_env, stack0)
    end
    let (local tmp2 : Uint256, _) = uint256_add(stack2.value, stack1.value)
    let (local tmp3 : Uint256, _) = uint256_add(Uint256(1, 0), stack0.value)
    local newitem2 : StackItem = StackItem(value=tmp2, next=stack3)
    local newitem3 : StackItem = StackItem(value=stack2.value, next=&newitem2)
    local newitem4 : StackItem = StackItem(value=tmp3, next=&newitem3)
    return segment18(exec_env, &newitem4)
end

func segment51{
        storage_ptr : Storage*, pedersen_ptr : HashBuiltin*, range_check_ptr, msize,
        memory_dict : DictAccess*}(exec_env : ExecutionEnvironment*, stack : StackItem*) -> (
        stack : StackItem*, output : Output):
    alloc_locals
    let stack0 = stack
    let (local __fp__, _) = get_fp_and_pc()
    return (stack0, Output(cast(0, felt*), 0))
end

func run_from{
        storage_ptr : Storage*, pedersen_ptr : HashBuiltin*, range_check_ptr, msize,
        memory_dict : DictAccess*}(
        exec_env : ExecutionEnvironment*, evm_pc, stack : StackItem*) -> (
        stack : StackItem*, output : Output):
    if evm_pc == 0:
        return segment0(exec_env, stack)
    end
    if evm_pc == 18:
        return segment18(exec_env, stack)
    end
    if evm_pc == 51:
        return segment51(exec_env, stack)
    end
    if evm_pc == -1:
        return (stack, Output(cast(0, felt*), 0))
    end
    # Fail.
    assert 0 = 1
    jmp rel 0
end

@external
func main{storage_ptr : Storage*, pedersen_ptr : HashBuiltin*, range_check_ptr}(
        calldata_size, unused_bytes, input_len : felt, input : felt*):
    alloc_locals
    let (local __fp__, _) = get_fp_and_pc()
    local exec_env : ExecutionEnvironment = ExecutionEnvironment(
        calldata_size=calldata_size,
        input_len=input_len,
        input=input,
        )

    let (local memory_dict : DictAccess*) = default_dict_new(0)
    local memory_start : DictAccess* = memory_dict

    tempvar msize = 0

    local stack0 : StackItem
    assert stack0 = StackItem(value=Uint256(-1, 0), next=&stack0)  # Points to itself.

    let (local stack, local output) = segment0{
        storage_ptr=storage_ptr,
        pedersen_ptr=pedersen_ptr,
        range_check_ptr=range_check_ptr,
        msize=msize,
        memory_dict=memory_dict}(&exec_env, &stack0)

    return ()
end

