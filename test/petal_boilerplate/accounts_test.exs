defmodule PetalBoilerplate.AccountsTest do
  use PetalBoilerplate.DataCase

  alias PetalBoilerplate.Accounts

  describe "users" do
    alias PetalBoilerplate.Accounts.User

    import PetalBoilerplate.AccountsFixtures

    @invalid_attrs %{age: nil, avatar: nil, blacklisted: nil, country: nil, dob: nil, firstname: nil, gender: nil, lastname: nil, privacy: nil, status: nil, username: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{age: 42, avatar: "some avatar", blacklisted: true, country: "some country", dob: ~D[2022-11-07], firstname: "some firstname", gender: "some gender", lastname: "some lastname", privacy: true, status: true, username: "some username"}

      assert {:ok, %User{} = user} = Accounts.create_user(valid_attrs)
      assert user.age == 42
      assert user.avatar == "some avatar"
      assert user.blacklisted == true
      assert user.country == "some country"
      assert user.dob == ~D[2022-11-07]
      assert user.firstname == "some firstname"
      assert user.gender == "some gender"
      assert user.lastname == "some lastname"
      assert user.privacy == true
      assert user.status == true
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{age: 43, avatar: "some updated avatar", blacklisted: false, country: "some updated country", dob: ~D[2022-11-08], firstname: "some updated firstname", gender: "some updated gender", lastname: "some updated lastname", privacy: false, status: false, username: "some updated username"}

      assert {:ok, %User{} = user} = Accounts.update_user(user, update_attrs)
      assert user.age == 43
      assert user.avatar == "some updated avatar"
      assert user.blacklisted == false
      assert user.country == "some updated country"
      assert user.dob == ~D[2022-11-08]
      assert user.firstname == "some updated firstname"
      assert user.gender == "some updated gender"
      assert user.lastname == "some updated lastname"
      assert user.privacy == false
      assert user.status == false
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end
