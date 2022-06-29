defmodule Secrets do
    def secret_add(secret) do
      adder = fn param ->
        secret + param
      end
    end
    def secret_subtract(secret) do
      subtractor = fn param ->
          param - secret
      end
    end
    def secret_multiply(secret) do
      multiplier = fn param ->
          param * secret
      end
    end
    def secret_divide(secret) do
      divider = fn param ->
          trunc(param / secret)
      end
    end
    def secret_and(secret) do
      ander = fn param ->
        Bitwise.band(param,secret)
      end
    end
    def secret_xor(secret) do
      xorer = fn param ->
        Bitwise.bxor(param,secret)
      end
    end
    def secret_combine(secret_function1, secret_function2) do
      combiner = fn param ->
        x = secret_function1.(param)
        secret_function2.(x)
      end
    end
end
