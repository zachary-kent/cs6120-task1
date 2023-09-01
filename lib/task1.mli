open! Core

val add_to_mul : Bril.t -> Bril.t
(** [add_to_mul func] is [func] where every add instruction has been
    converted into a multiplication instruction with its destination
    and operands maintained the same. *)
