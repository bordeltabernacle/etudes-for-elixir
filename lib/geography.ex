defmodule Country do
  @moduledoc """
  Contains Country struct.
  Country has fields for the country name, its language,
  and a list of cities in that country.
  """
  defstruct name: nil, language: nil, cities: []
end

defmodule City do
  @moduledoc """
  Contains City struct.
  Cities are represented by a City structure, which has
  fields for the city name, population, latitude, and longitude.
  """
  defstruct name: nil, population: 0, latitude: 0.0, longitude: 0.0
end

defprotocol Valid do
  @doc "Returns true if data is considered valid"
  def valid?(data)
end

defimpl Valid, for: City do
  def valid?(data) do
    data.population >= 0    &&
    data.latitude   >= -90  && data.latitude  <= 90 &&
    data.longitude  >= -180 && data.longitude <= 180
  end
end

defimpl Inspect, for: City do
  import Inspect.Algebra

  def inspect(item, _options) do
    lat = if (item.latitude < 0) do
      concat(to_string(Float.round(abs(item.latitude * 1.0), 2)), "°S")
    else
      concat(to_string(Float.round(item.latitude * 1.0, 2)), "°N")
    end

    lon = if (item.longitude < 0) do
      concat(to_string(Float.round(abs(item.longitude * 1.0), 2)), "°W")
    else
      concat(to_string(Float.round(item.longitude * 1.0, 2)), "°E")
    end

    concat([item.name,
            break, "(", to_string(item.population), ")",
            break, lat, break, lon])
  end
end

defmodule Geography do
  @moduledoc """
  ## Étude 7-2: Creating Structures from a File

  In this étude, you will read a CSV file with information about
  countries and cities. Lines with two entries give a country name
  and its primary language; lines with four entries give a city
  name, its population, its latitude, and its longitude.
  """

  @doc """
  Given the name of a CSV file, returns a list of Country
  structures and their cities.
  """
  @spec make_geo_list(String.t) :: Country.t
  def make_geo_list(fin) do
    {result, device} = File.open(fin, [:read, :utf8])
    case result do
      :ok -> read_file(device, [])
      :error -> IO.puts("Error: #{device}")
    end
  end

  # move through the file, line by line, passing each line to
  # the build_geo_list function until the end of the file
  # is reached.
  defp read_file(device, geo_list) do
    line = IO.read(device, :line)
    case line do
      :eof ->
        File.close(device)
        geo_list
      _ ->
        data = line |> String.strip |> String.split(",")
        updated_geo_list = build_geo_list(data, geo_list)
        read_file(device, updated_geo_list)
    end
  end

  # Pattern match against the line to determine if it represents
  # a Country or a City.  Extract the relevant data and add it
  # to the relevant struct.
  defp build_geo_list([country, language], geo_list) do
    [%Country{name: country, language: language} | geo_list]
  end
  defp build_geo_list([city_name, population, lat, long], [head | tail]) do
    city = %City{name: city_name,
                 population: String.to_integer(population),
                 latitude: String.to_float(lat),
                 longitude: String.to_float(long)}
    [%Country{head | cities: [city | head.cities]} | tail]
  end

  @doc """
  The first argument will be a list as constructed by
  `make_geo_list/1`, and the second argument is a string
  giving the name of a language. The function returns the
  total population of all the cities in countries whose
  primary language is the one you specified.
  """
  @spec total_population([Country], String.t) :: integer
  def total_population(geo_list, language) do
    total_population(geo_list, language, 0)
  end

  defp total_population([head | tail], language, acc) do
    if language == head.language do
      subtotal(head.cities, acc)
    else
      total_population(tail, language, acc)
    end
  end

  defp subtotal([], acc), do: acc
  defp subtotal([head | tail], acc) do
    subtotal(tail, acc + head.population)
  end
end
