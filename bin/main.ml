open Vrf_simulator;;

let secret_key = Ed25519_signature.secret_to_public_key (Bytes.of_string "Hello my name is Hehe Hello my n")

let seed = "hihihihihidddddddddddddddddddddeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee"

let teta = 32

let roll = 20

let total_rolls = 40

let role = "proposer" 


let (number_of_rolls, hash) = 
Roll_selection_formula.select_roll_of_each_node secret_key seed teta role roll total_rolls

let () = print_endline (string_of_int number_of_rolls)

let () = print_bytes hash 


let x = Roll_selection_formula.get_roll_number 20 30 10 4.0

let () = print_endline (string_of_int x)