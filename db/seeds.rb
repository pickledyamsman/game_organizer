matt = User.create(username: "Matt", password_digest: "superpassword")
BoardGame.create(name: "King of Tokyo", players: "2-6", manufacturer: "IELLO", user_id: matt)