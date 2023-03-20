# Creating a generator that generates a sequence of numbers

number_generator = fn ->
  Stream.iterate(1, &(&1 + 1))
end

# Calling the generator
numbers = number_generator.() |> Enum.take(10)

IO.inspect(numbers)

#  Other showcases of unique features of Elixir

# 1. Pattern matching
# Pattern matching is a way to match a value against a pattern
# and bind the variables in the pattern to the values in the value.
# It is a way to destructure a value.
# Compare this code showcasing pattern matching in Elixir:

{a, b, c} = {1, 2, 3}
IO.puts("a: #{a}, b: #{b}, c: #{c}")

# 2. Anonymous functions
# Anonymous functions are functions without a name.
# They are also called lambda functions.
# Compare this code showcasing anonymous functions in Elixir:

anonymous_function = fn -> IO.puts("The owls are not what they seem") end

anonymous_function.()

# 3. Pipe operator
# The pipe operator is a way to chain functions together.
# Compare this code showcasing the pipe operator in Elixir:

# Without the pipe operator
IO.puts(String.upcase("We live inside a dream"))

# With the pipe operator
"But who is the dreamer?" |> String.upcase() |> IO.puts()

# 4. Modules
# Modules are a way to group functions and values together.
# Compare this code showcasing modules in Elixir:

defmodule Math do
  def sum(a, b) do
    a + b
  end
end

IO.puts(Math.sum(1, 2))

# 5. Structs
# Structs are a way to create custom data types.
# Compare this code showcasing structs in Elixir:

defmodule Person do
  defstruct name: nil, age: nil
end



# 6. Protocols
# Protocols are a way to define a set of functions that can be implemented
# by different modules.
# Compare this code showcasing protocols in Elixir:


defmodule PersonSerializer do
  def serialize(person) do
    %{
      name: person.name,
      age: person.age
    }
  end
end

defmodule PersonPresenter do
  def present(person) do
    "Name: #{person.name}, Age: #{person.age}"
  end
end


defmodule Main do
  person = %Person{name: "David Lynch", age: 77}

  IO.inspect(PersonSerializer.serialize(person))
  IO.inspect(PersonPresenter.present(person))
end
