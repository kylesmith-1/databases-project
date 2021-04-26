# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     DbProj.Repo.insert!(%DbProj.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias DbProj.Repo
alias DbProj.Coopterms.Coopterm

spring = Repo.insert!(%Coopterm{term: "spring"})
fall = Repo.insert!(%Coopterm{term: "fall"})