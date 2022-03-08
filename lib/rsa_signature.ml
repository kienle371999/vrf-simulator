(* Implement RSA digital signature *)

open Nocrypto;;

type private_key = Private_key of string

type public_key = Public_key of string

let () = Nocrypto_entropy_unix.initialize ()

let first_prime = Z.of_int 17333

let second_prime = Z.of_int 13267

let third_prime = Z.of_int 13271

let private_key = Rsa.priv_of_primes ~e:first_prime ~p:second_prime ~q:third_prime

let public_key = Rsa.pub_of_priv private_key

let signed_message = Rsa.encrypt ~key:public_key (Cstruct.of_string "his")

let plain_message = Rsa.decrypt ~key:private_key signed_message

let x = Rng.generate 13
