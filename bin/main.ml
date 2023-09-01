(* Input path to JSON representing Bril program *)
let input_path = Sys.argv.(1)

(* The JSON representing the Bril program *)
let json = Yojson.Basic.from_file input_path
let prog = Bril.from_json json
let transformed_prog = Task1.add_to_mul prog

(* Dump the transformed program to stdout *)
let () =
  transformed_prog |> Bril.to_json |> Yojson.Basic.pretty_to_string
  |> print_endline
