import hashlib

def hash_password(password):
    return hashlib.sha256(password.encode()).hexdigest()

def main():
    password = input("Enter your password: ")
    hashed_password = hash_password(password)
    print(f"Hashed password: {hashed_password}")

if __name__ == '__main__':
    main()