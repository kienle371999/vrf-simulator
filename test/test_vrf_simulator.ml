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
