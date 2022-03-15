(* Build Verifiable Random Function (VRF) Formula *)

open Hacl_star;;


type vrf_output = Vrf_output of bytes * bytes

let compare_two_hash first_hash second_hash = 
  if first_hash == second_hash then true
  else false

(* Generate verifiable random output *)
let vrf_generation secret_key msg = 
  let signed_message = Ed25519_signature.signature secret_key msg in
  (* The proof to determine whether this signature is valid or not *)
  let proof = Hacl.SHA2_256.hash signed_message in
  (signed_message, proof)


(* Verify the random output *)
let verify public_key message (Vrf_output (signed_message, proof)) = 
  if (Ed25519_signature.status_of_signature public_key message signed_message) then
    compare_two_hash (Hacl.SHA2_256.hash signed_message) proof
  else false

   



