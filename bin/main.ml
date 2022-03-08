open Vrf_simulator;;
(* open Base64;; *)

let res = Ecdsa_signature.signed_message

let () = print_bytes res

let extra_res = Ecdsa_signature.valid_message

let () = print_endline (string_of_bool extra_res)

(* let extra_res = Rsa_signature.plain_message

let () = print_endline (Cstruct.to_string extra_res) *)