(* Build the necessary calculation methods *)

let rec factorial n =
  match n with
  | 0 -> 1
  | 1 -> 1
  | _ -> n * factorial (n - 1)


let rec pow a b = 
  match Int.to_float b with
  | 0. -> 1.
  | _ -> a *. pow a (b - 1)


(* Calculate the bits length of any number *)
let calculate_bit_length number =
  let rec int_to_bit acc number =
    if number = 0 then acc
    else int_to_bit (number land 1::acc) (number lsr 1)
  in
  let bit_list = int_to_bit [] number in
  List.length bit_list


(* Implement the combinations formula *)
let calculate_combination k n p = 
  let combination = Int.to_float(factorial n) /. (Int.to_float(factorial k) *. Int.to_float(factorial (n - k))) in
  combination *. (pow p k *. pow (1. -. p) (n - k))

  
(* Implement the binomial distribution *)
let rec calculate_binomial_distribution k w p =
  match k with
  | 0 -> calculate_combination k w p
  | _ -> (calculate_combination k w p) +. calculate_binomial_distribution (k - 1) w p  