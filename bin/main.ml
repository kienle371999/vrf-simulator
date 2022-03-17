open Vrf_simulator;;
open Printf;;
open Yojson;;


let rec print_roll_number param_elements seed teta role total_rolls =
  match param_elements with
  | [] -> printf ""
  | element::remain_elements ->
    let open Basic.Util in
    let index = element |> member "index" |> to_int in
    let secret_key = element |> member "secret_key" |> to_string in
    let roll = element |> member "roll" |> to_int in 
    let number_of_rolls, _ = 
      Roll_selection_formula.select_roll_of_each_node (Bytes.of_string secret_key) seed teta role roll total_rolls 
    in
      printf "----- Node %i has %i rolls in this committee to select %s \n" index number_of_rolls role;
      print_roll_number remain_elements seed teta role total_rolls


(* Print the corresponding rolls of each node in the current committee *)
let () = 
  let json_data = Basic.from_file "node_data.json" in 
  let open Basic.Util in
  let seed = json_data |> member "seed" |> to_string in
  let teta = json_data |> member "teta" |> to_int in
  let role = json_data |> member "role" |> to_string in
  let total_rolls = json_data |> member "total_rolls" |> to_int in
  let deserialized_nodes = json_data |> member "data" |> to_list in
  print_roll_number deserialized_nodes seed teta role total_rolls


  





