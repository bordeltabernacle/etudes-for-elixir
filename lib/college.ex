defmodule College do
  @moduledoc """
  ## Étude 7-1: Creating a HashDict from a File

  Your local college has given you a text file that contains data
  about which courses are taught in which rooms. The first column
  is the course ID number. The second column is the course name,
  and the third column is the room number.

  Your job in this étude is to read the file and create a `HashDict`
  whose key is the room number and whose value is a list of all the
  courses taught in that room.
  """

  @doc """
  Open given courses CSV file, with course ID, course, and room
  columns.  Build a HashDict containing the rooms and all courses
  associated with each room.
  """
  @spec make_room_list(String.t) :: HashDict.t
  def make_room_list(fin) do
    {result, device} = File.open(fin, [:read, :utf8])
    room_list = HashDict.new
    case result do
      :ok -> read_file(device, room_list)
      :error -> IO.puts("Error: #{device}")
    end
  end

  # Move through the file, line by line, passing each line to
  # the build_dict function until the end of the file is reached.
  defp read_file(device, room_list) do
    line = IO.read(device, :line)
    case line do
      :eof ->
        File.close(device)
        room_list
      _ ->
        updated_room_list = build_dict(line, room_list)
        read_file(device, updated_room_list)
    end
  end

  # Extract the room and course from each line and add them to
  # the room_list HashDict.
  defp build_dict(line, room_list) do
    [_id, course, room] = line |> String.strip |> String.split(",")
    current_room = Dict.get(room_list, room)
    case current_room do
      nil -> Dict.put(room_list, room, [course])
      _   -> Dict.put(room_list, room, [course | current_room])
    end
  end

end
