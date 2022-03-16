open Vrf_simulator;;
open Printf;;


type node_params = 
{
  index: int;
  secret_key: string;
  roll: int;
}

let node1 : node_params = {
  index = 1;
  secret_key = "JtOTUuq71msxVEfaT4BqrZOtuLoXatv6";
  roll = 20
}

let node2 : node_params = {
  index = 2;
  secret_key = "paA5lVYhMk3xPcSSgZzmOBmg9NrGZtJY";
  roll = 10
}

let node3 : node_params = {
  index = 3;
  secret_key = "LQlK4v4plTxBUwCxIuMyQf5LRAYjlMvZ";
  roll = 10
}

let teta = 30

let total_rolls = 40

let node_params_array = node1 :: node2 :: node3 :: []

let seed = "MoGkSxzJjv6bt4NvO8Fr"

let role = "endorser" 


(* let () = print_endline node1.secret_key

let number_of_rolls, _ = Roll_selection_formula.select_roll_of_each_node (Bytes.of_string "JtOTUuq71msxVEfaT4BqrZOtuLoXatv6") seed teta role 10 total_rolls 

let () = print_endline (string_of_int number_of_rolls) *)

let rec print_roll_number param_elements seed teta role total_rolls =
  match param_elements with
  | [] -> printf ""
  | element::remain_elements ->
    let number_of_rolls, _ = 
      Roll_selection_formula.select_roll_of_each_node (Bytes.of_string element.secret_key) seed teta role element.roll total_rolls 
    in
      printf "----- Node %i has %i rolls in this committee to select %s \n" element.index number_of_rolls role;
      print_roll_number remain_elements seed teta role total_rolls

let () = print_roll_number node_params_array seed teta role total_rolls


