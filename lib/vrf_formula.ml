(* Build Verifiable Random Function (VRF) Formula *)

open Hacl_star;;


type vrf_output = Vrf_output of bytes * bytes

let compare_two_hash first_hash second_hash = 
  if first_hash == second_hash then true
  else false

(* Generate verifiable random output *)
let vrf_generation secret_key msg = 
  let signed_message = Ed25519_signature.signature secret_key msg in
  let hash = Hacl.SHA2_256.hash signed_message in
  let () = print_bytes signed_message in
  (signed_message, hash)


(* Verify the random output *)
let verify public_key message (Vrf_output (signed_message, hash)) = 
  if (Ed25519_signature.status_of_signature public_key message signed_message) then
    compare_two_hash (Hacl.SHA2_256.hash signed_message) hash
  else false

   



