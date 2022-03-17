# Verifiable Random Function Simulator

![Pipeline status](https://gitlab.com/nomadic-labs/tenderbake-simulator/badges/master/pipeline.svg)

This project implements a simulator to write our blockchain algorithm, represented in the consensus proposal [*Some Adjustments to Candidates Selection in Tezos Blockchain*][paper].

## Build With Opam

Install opam 2.0+ and then off you go:

```console
$ eval $(opam env)
$ opam install . --deps-only
$ eval $(opam env)
$ dune build ./src/bin/main.exe
$ dune exec ./src/bin/main.exe
```

## License

The source code is distributed under the [MIT Open Source
License](https://opensource.org/licenses/MIT).

[paper]: https://drive.google.com/file/d/1o6Brp76OofgoD9lXMHtFYzedg40XSblb/view?usp=sharing
