defmodule Secrets do
  # using data hiding, secretly add secret to the param provided
  def secret_add(secret) do
    fn param ->
      param + secret
    end
  end

  # using data hiding, secretly subtract secret from the param provided
  def secret_subtract(secret) do
    fn param ->
      param - secret
    end
  end

  # using data hiding, secretly multiply secret by the param provided
  def secret_multiply(secret) do
    fn param ->
      param * secret
    end
  end

  # using data hiding, secretly divide secret by the param provided, using integer division
  def secret_divide(secret) do
    fn param ->
      floor(param / secret)
    end
  end

  # using data hiding, secretly bitwise AND compare secret to the param provided
  def secret_and(secret) do
    # import only the bitwise AND function
    import Bitwise, only: [band: 2]
    fn param ->
      band(param, secret)
    end
  end

  # using data hiding, secretly bitwise XOR compare secret to the param provided
  def secret_xor(secret) do
    # import only the bitwise OR function
    import Bitwise, only: [bxor: 2]
    fn param ->
      bxor(param, secret)
    end
  end

  # using data hiding, secretly compose a new function from the two secret functions
  def secret_combine(secret_function1, secret_function2) do
    fn param ->
      # apply secret_function1 to param and secret_function2 to function of secret_function1 and param via composition
      secret_function2.(secret_function1.(param))
    end
  end

end
