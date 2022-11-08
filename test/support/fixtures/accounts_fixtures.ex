defmodule PetalBoilerplate.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PetalBoilerplate.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        age: 42,
        avatar: "some avatar",
        blacklisted: true,
        country: "some country",
        dob: ~D[2022-11-07],
        firstname: "some firstname",
        gender: "some gender",
        lastname: "some lastname",
        privacy: true,
        status: true,
        username: "some username"
      })
      |> PetalBoilerplate.Accounts.create_user()

    user
  end
end
