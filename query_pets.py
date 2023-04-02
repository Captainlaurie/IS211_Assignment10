import sqlite3 as lite

def main():
    con = lite.connect('pets.db')

    while True:
        person_id = input("Enter a person's ID number, or enter '-1' to quit: ")
        if person_id.lower() == "-1":
            break

        try:
            with con:
                cur = con.cursor()
                cur.execute("SELECT first_name, last_name FROM person WHERE id=:person_id", {'person_id': person_id})
                person = cur.fetchone()

                if person:
                    cur.execute("SELECT pet.name, pet.breed, pet.age, pet.dead FROM pet JOIN person_pet ON pet.id = person_pet.pet_id JOIN person ON person_pet.person_id = person.id WHERE person.id=:person_id", {'person_id': person_id})
                    pets = cur.fetchall()

                    for pet in pets:
                        if pet[3] == 1:
                            print(f"{person[0]} {person[1]} owned {pet[0]}, a {pet[1]} that was {pet[2]} year(s) old.")
                        else:
                            print(f"{person[0]} {person[1]} owns {pet[0]}, a {pet[1]} that is {pet[2]} year(s) old.")
        except Exception as e:
            print(f"An error occurred: {e}")


if __name__ == "__main__":
    main()
