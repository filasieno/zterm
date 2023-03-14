const std = @import("std");

pub const ZTermInitOptions = struct {
    extent_size: usize = 1024 * 1024,
};

pub const ZTermInitError = error {
    ExtentAllocationError
};

pub const SigId       = u32;
pub const TypeId      = u32;
pub const ConsId      = u32;
pub const PartitionId = u32;
pub const EntityId    = u32;
pub const AttrId      = u32;
pub const ValueId     = u32;
pub const InternalValueId = u32;

// ValueId -> (ValueType, InternalValueId)
// InternalValueId -> i32
// InternalValueId -> u32
// InternalValueId -> SymbolText
// u32 -> ValueId
// SymbolText -> ValueId

pub const ValueType = enum { 
    boolean,
    uint8,
    sint8,
    uint16,
    sint16,
    uint32,
    sint32,
    uint64,
    sint64,
    float32,
    float64,
    symb,
    str8,
    str16,
    str32,
    c8,
    c16,
    c32,
    entity,
};

pub const ZTCmd = union(enum) {

    new_p: struct { 
        name: [] const u8 
    },
    
    del_p: struct { 
        p: PartitionId, 
    },

    def_s: struct { 
        name: [] const u8 
    },

    def_t: struct { 
        name: [] const u8 
    },

    def_c: struct { 
        name: [] const u8 
    },

    def_e: struct { 
        p : PartitionId,
        name      : [] const u8 
    },

    def_v: struct {
        e: EntityId,
        a: AttrId,
        v: ValueId,
    },

    undef_s: struct {
        s: SigId,
    },

    undef_t: struct {
        t: TypeId,
    },

    undef_c: struct {
        c: ConsId,
    },

    undef_e: struct {
        e: EntityId,
    },
    
    undef_a: struct {
        e: EntityId,
        a: AttrId,
    },

    undef_v: struct {
        e: EntityId,
        a: AttrId,
        v: ValueId,
    },

    upd_e : struct {
        old_e: EntityId,
        new_e: EntityId,
    },

    upd_a : struct {
        e: EntityId,
        old_a: AttrId,
        new_a: AttrId,
    },

    upd_v : struct {
        e: EntityId,
        a: AttrId,
        old_v: ValueId,
        new_v: ValueId,
    },

    upd_p : struct {
        old_p: PartitionId,
        new_p: PartitionId,
    },

    upd_t : struct {
        e: EntityId,
        t: TypeId,
    },

    mov_e : struct {
        e: EntityId,
        p: PartitionId,
    },

    push_vec : struct {
        e: EntityId,
        v: ValueId,
    },

    pop_vec : struct {
        e: EntityId,
    },

    ins_vec : struct {
        e: EntityId,
        index: u32,
        v: ValueId,
    },

    upd_vec : struct {
        e: EntityId,
        index: u32,
        new_v: ValueId,
    },

    mov_vec : struct {
        e: EntityId,
        old_index: u32,
        new_index: u32,
    },

    rem_vec: struct {
        e: EntityId,
        index: u32,
    },

    clear_vec: struct {
        e: EntityId,        
    },

};