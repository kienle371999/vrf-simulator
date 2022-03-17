# Verifiable Random Function Simulator

![Pipeline status](pipeline.svg)

This project implements a simulator to write our blockchain algorithm, represented in the consensus proposal [*Some Adjustments to Candidates Selection in Tezos Blockchain*][paper].

## Build With Opam

Install opam 2.0+ and then off you go:

```console
$ eval $(opam env) # Navigate to the environment variables set
$ opam install . --deps-only # Install libraries in vrf_simulator.opam
$ eval $(opam env) # Apply the installed libraries
$ dune build ./src/bin/main.exe # Build the Ocaml project
$ dune exec ./src/bin/main.exe # Run the Ocaml project
```

## Customize the number of exsiting nodes in Tezos

Navigative to `node_data.json` to modify the fundamental parameters and increase or decrease the number of nodes running in Tezos.

## The expected output of the simulator

This example of ultimate result is displayed in terminal as below:

```console
Node 1 has 14 rolls in this committee to select endorser 
Node 2 has 7 rolls in this committee to select endorser 
Node 3 has 8 rolls in this committee to select endorser 
```


## License

The source code is distributed under the [MIT Open Source
License](https://opensource.org/licenses/MIT).

[paper]: https://drive.google.com/file/d/1o6Brp76OofgoD9lXMHtFYzedg40XSblb/view?usp=sharing
