(* Implement unit test for every function *)


open Vrf_simulator;;
open Printf;;


(* Unit Test for factorial function *)
let () = 
  let res = Util_calculation.factorial 3 in
  match res with
  | 6 -> printf "Factorial Function is True \n"
  | _ -> printf "Factorial Function is False \n"


let () = 
  let res = Util_calculation.pow 2.0 3 in
  match res with
  | 8.0 -> printf "Power Function is True \n"
  | _ -> printf "Power Function is False \n"

let () = 
  let res = Util_calculation.calculate_combination 2 3 0.5 in
  match res with
  | 0.375 -> printf "Combination Function is True \n"
  | _ -> printf "Combination Function is False \n"

let () = 
  let res = Util_calculation.calculate_binomial_distribution 2 3 0.5 in
  match res with
  | 0.875 -> printf "Binomial Distribution Function is True \n"
  | _ -> printf "Binomial Distribution is False \n"

let () = 
  let res = Util_calculation.calculate_bit_length 967 in
  match res with
  | 10 -> printf "Bit Length Function is True \n"
  | _ -> printf "Bit Length is False \n"


let () = 
  let secret_key = "JtOTUuq71msxVEfaT4BqrZOtuLoXatv6" in
  let seed = "SaSlBRu5e88WRRfR3RGI7artOLgMQc8s" in
  let role = "proposer" in
  let teta = 30 in
  let total_rolls = 40 in
  let roll = 20 in
  let displayed_number_of_rolls = 15 in
  let number_of_rolls, proof = 
    Roll_selection_formula.select_roll_of_each_node (Bytes.of_string secret_key) seed teta role roll total_rolls 
  in
    let public_key = (Ed25519_signature.secret_to_public_key (Bytes.of_string secret_key)) in
    let status = 
      Roll_selection_formula.verify_selection_of_roll public_key proof teta seed role displayed_number_of_rolls number_of_rolls total_rolls
    in 
    match status with
    | true -> printf "Verify Function in Role Selection Formula is True \n"
    | _ -> printf "Verify Function in Role Selection Formula is False \n"
