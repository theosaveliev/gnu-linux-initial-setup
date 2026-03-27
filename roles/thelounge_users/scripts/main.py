import secrets
import string


def generate_password(length: int) -> str:
    alphabet = string.ascii_letters + string.digits
    while True:
        pw = "".join(secrets.choice(alphabet) for _ in range(length))
        if (
            any(c.islower() for c in pw)
            and any(c.isupper() for c in pw)
            and any(c.isdigit() for c in pw)
        ):
            return pw


def main():
    with open("users", "rt", encoding="utf-8", errors="strict") as fd:
        users = [line.strip() for line in fd if line.strip()]

    passwords: dict[str, str] = {}
    for user in users:
        passwords[user] = generate_password(length=20)

    for user, pw in passwords.items():
        print(f'  - {{ user: "{user}", password: "{pw}" }}')

    for user, pw in passwords.items():
        print("[Operator]")
        print(f"    Name = {user}")
        print(f"    Password = {pw}")


if __name__ == "__main__":
    main()
