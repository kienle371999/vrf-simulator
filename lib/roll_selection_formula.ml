(* Build the algorithm to calculate selected rolls in committees  *)


open Vrf_formula;;


(* Get the number of rolls belonging to each node *)
let get_roll_number integer_message bit_length w p =
  let input_number = Int.to_float integer_message /. (Util_calculation.pow 2. bit_length) in
  let terminal = ref (-1) in
  try 
    for i = 0 to w do
      let statement = (input_number >= Util_calculation.calculate_binomial_distribution i w p) 
      && (input_number < Util_calculation.calculate_binomial_distribution (i + 1) w p) 
      in
      match statement with
      | true -> terminal := i; raise Exit
      | _ -> ()
    done;
    raise Not_found
  with Exit -> !terminal 


(* Implement the roll-selecting algorithm. The output return
    the number of rolls belonging to each node, the signature and the proof *)
let select_roll_of_each_node secret_key seed teta role roll total_rolls =
  (* Concatenation of the random seed and the role to generate the random input *)
  let vrf_input = String.concat seed [role] in
  let signed_message, proof = Vrf_formula.vrf_generation secret_key (Bytes.of_string vrf_input) in
  (* Probability of one roll chosen in this committee *)
  let p = Int.to_float teta /. Int.to_float total_rolls in
  (* Convert the bytes to the unsigned integer *)
  let integer_of_signed_message = Bytes.get_uint16_le signed_message 0 in
  let number_of_rolls = 
    get_roll_number integer_of_signed_message (Util_calculation.calculate_bit_length integer_of_signed_message) roll p 
  in
  (number_of_rolls, Vrf_output (signed_message, proof))


(** Implement the algorithm to verify the roll-selecting procedure. The output return
      [true] or [false] to determine the final state *)
let verify_selection_of_roll public_key (Vrf_output (signed_message, proof)) teta seed role displayed_number_of_rolls roll total_rolls = 
  (* Concatenation of the random seed and the role to generate the random input *)
  let vrf_input = String.concat seed [role] in
  let status_of_signature = Vrf_formula.verify public_key (Bytes.of_string vrf_input) (Vrf_output ((signed_message, proof))) in
  if status_of_signature then 
    let p = Int.to_float teta /. Int.to_float total_rolls in
    (* Convert the bytes to the unsigned integer *)
    let integer_of_signed_message = Bytes.get_uint16_le signed_message 0 in
    (* Calculate the actual number of rolls *)
    let number_of_rolls = 
      get_roll_number integer_of_signed_message (Util_calculation.calculate_bit_length integer_of_signed_message) roll p 
    in
    if number_of_rolls == displayed_number_of_rolls then true
    else false
  else false

