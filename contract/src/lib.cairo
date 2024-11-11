use integrity::{calculate_bootloaded_fact_hash, STONE_BOOTLOADER_PROGRAM_HASH};

fn main() -> felt252 {
    let program = 0x59874649ccc5a0a15ee77538f1eb760acb88cab027a2d48f4246bf17b7b7694;
    let output = [0x5, 0xd].span();
    calculate_bootloaded_fact_hash(STONE_BOOTLOADER_PROGRAM_HASH, program, output)
}