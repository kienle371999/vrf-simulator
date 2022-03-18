# Verifiable Random Function Simulator

![Pipeline status](pipeline.svg)

This project implements a simulator to write our blockchain algorithm, represented in the consensus proposal [*Some Adjustments to Candidates Selection in Tezos Blockchain*][paper].

# Build the project and represent the output
## Build with opam

Install opam 2.0+ and then off you go:

```console
$ eval $(opam env) # Navigate to the environment variables set
$ opam install . --deps-only # Install libraries in vrf_simulator.opam
$ eval $(opam env) # Apply the installed libraries
$ dune build . # Build the Ocaml project
$ dune exec ./src/bin/main.exe # Run the Ocaml project
```

## The expected output of the simulator

This example of ultimate result is displayed in terminal as below:

```console
Node 1 has 14 rolls in this committee to select endorser 
Node 2 has 7 rolls in this committee to select endorser 
Node 3 has 8 rolls in this committee to select endorser 
```
# Test the project and represent the output

## Test with opam

```console
$ dune exec ./test/test_vrf_simulator.exe # Run Unit Test in Ocaml project
```

## The expected output of unit test 

This example of ultimate result is displayed in terminal as below:

```console
Factorial Function is True          
Power Function is True 
Combination Function is True 
Binomial Distribution Function is True 
Bit Length Function is True 
Verify Function in Role Selection Formula is False
```

## Customize the number of exsiting nodes in Tezos

Navigative to `node_data.json` to modify the fundamental parameters and increase or decrease the number of nodes running in Tezos.


## License

The source code is distributed under the [MIT Open Source
License](https://opensource.org/licenses/MIT).

[paper]: https://drive.google.com/file/d/1o6Brp76OofgoD9lXMHtFYzedg40XSblb/view?usp=sharing
