(* Build Edwards-curve Digital Signature Algorithm (EdDSA) *)

open Hacl_star;;

type secret_key = Secret_key of bytes

type public_key = Public_key of bytes


(* let secret_key = Secret_key (Bytes.of_string "Hello my name is Hehe Hello my n") *)

let secret_to_public_key secret_key = Hacl.Ed25519.secret_to_public ~sk:secret_key

let signature ~sk ~msg = Hacl.Ed25519.sign ~sk ~msg

let status_of_signature ~pk ~msg ~signature = Hacl.Ed25519.verify ~pk ~msg ~signature









