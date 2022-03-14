(* Build the algorithm to calculate selected rolls in committees  *)

let rec factorial n =
  match n with
  | 0 -> 1
  | 1 -> 1
  | _ -> n * factorial (n - 1)


let rec pow a b = 
  match Int.to_float b with
  | 0. -> 1.
  | _ -> a *. pow a (b - 1)


let calculate_combination k n p = 
  let combination = Int.to_float(factorial n) /. (Int.to_float(factorial k) *. Int.to_float(factorial (n - k))) in
  combination *. (pow p k *. pow (1. -. p) (n - k))

  
let rec calculate_binomial_distribution k w p =
  match k with
  | 0 -> calculate_combination k w p
  | _ -> (calculate_combination k w p) +. calculate_binomial_distribution (k - 1) w p  


let get_roll_number integer_message bit_length w p =
  let input_number = Int.to_float integer_message /. (pow 2. bit_length) in
  let () = print_endline (string_of_float input_number) in
  let terminal = ref (-1) in
  try 
    for i = 0 to w do
      let statement = (input_number >= calculate_binomial_distribution i w p) 
      && (input_number < calculate_binomial_distribution (i + 1) w p) 
      in
      match statement with
      | true -> terminal := i; raise Exit
      | _ -> ()
    done;
    raise Not_found
  with Exit -> !terminal 


let select_roll_of_each_node secret_key seed teta role roll total_rolls =
  let vrf_input = String.concat seed [role] in
  let signed_message, hash = Vrf_formula.vrf_generation secret_key (Bytes.of_string vrf_input) in
  (* Probability of one roll chosen in this committee *)
  let p = Int.to_float teta /. Int.to_float total_rolls in
  let () = print_endline (string_of_float p) in
  let integer_of_signed_message = Bytes.get_int16_ne signed_message 0 in
  let () = print_endline (string_of_int integer_of_signed_message) in
  let number_of_rolls = get_roll_number integer_of_signed_message (Bytes.length signed_message) roll p in
  let () = print_endline (string_of_int number_of_rolls) in
  (number_of_rolls, hash)

