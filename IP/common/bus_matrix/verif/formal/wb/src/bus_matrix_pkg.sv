// -----------------------------------------------------------------------------
// File: bus_matrix_pkg.sv
// Module: bus_matrix_pkg
// Description:
//   SystemVerilog package defining common types and structs for the Bus Matrix IP.
//
// Types:
//   - addr_range_t: Struct defining start and end addresses for a memory region.
//   - region_attr_t: Struct defining security attributes (secure_only, read_only)
//                    for a memory region.
//
// Usage:
//   Import this package in all bus matrix submodules to ensure consistent
//   type definitions for address decoding and configuration.
// -----------------------------------------------------------------------------
package bus_matrix_pkg;

    // Default configuration limits
    localparam int MAX_MASTERS = 16;
    localparam int MAX_SLAVES = 16;
    
    // Address Map Structure
    typedef struct packed {
        logic [31:0] start_addr;
        logic [31:0] end_addr;
    } addr_range_t;

    // Region Attributes
    typedef struct packed {
        logic [31:0] start_addr;
        logic [31:0] end_addr;
        logic        secure_only; // Only Secure masters can access
        logic        read_only;   // Writes are blocked
    } region_attr_t;

endpackage
