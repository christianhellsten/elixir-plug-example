# elixir-plug-example

An annotated Elixir and Plug example web application.

```bash
$ git clone https://github.com/christianhellsten/elixir-plug-example.git
$ brew install elixir
$ mix deps.get
$ iex -S mix
```

[http://localhost:4000](http://localhost:4000)

## Why Elixir and Plug?

Valid reasons:
- [Scalability](http://learnyousomeerlang.com/the-hitchhikers-guide-to-concurrency): concurrency (No GIL), low-latency, distributed
- Fault-tolerance (processes-with-asynchronous-messages model)
- [Erlang's OTP](http://learnyousomeerlang.com/what-is-otp)

Questionable reasons:
- Functional programming
- Ruby-like syntax

## Why not?

- Still a young language (2016)
- Debugging Elixir code is difficult (IEx < pry)


## Also see

- [Example of how to deploy an Elixir web application with exrm](https://snippets.aktagon.com/snippets/777-elixir-deployment)
