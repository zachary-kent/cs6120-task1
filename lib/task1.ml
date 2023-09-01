open Core
open Bril
open Func

(** [add_to_mul (Add dst x y)] is [Mul dst x y], and the identity for all other instruction *)
let add_to_mul_instr = function
  | Instr.Binary (dst, Op.Binary.Add, x, y) ->
      Instr.Binary (dst, Op.Binary.Mul, x, y)
  | instr -> instr

let add_to_mul =
  List.map ~f:(fun func ->
      {
        func with
        blocks = String.Map.map ~f:(List.map ~f:add_to_mul_instr) func.blocks;
      })
